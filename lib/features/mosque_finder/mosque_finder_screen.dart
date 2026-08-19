import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/models/nearby_place.dart';
import '../../core/services/nearby_places_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

enum _MosqueError { locationDisabled, locationDenied, searchFailed }

class MosqueFinderScreen extends StatefulWidget {
  const MosqueFinderScreen({super.key});

  @override
  State<MosqueFinderScreen> createState() => _MosqueFinderScreenState();
}

class _MosqueFinderScreenState extends State<MosqueFinderScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool _loading = true;
  _MosqueError? _error;
  List<NearbyPlace> _mosques = [];
  List<NearbyPlace> _halalRestaurants = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('location_disabled');

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        throw Exception('location_denied');
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      ).timeout(const Duration(seconds: 15));

      final results = await Future.wait([
        NearbyPlacesService.findMosques(latitude: position.latitude, longitude: position.longitude),
        NearbyPlacesService.findHalalRestaurants(latitude: position.latitude, longitude: position.longitude),
      ]);

      setState(() {
        _mosques = results[0];
        _halalRestaurants = results[1];
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString().contains('location_disabled')
            ? _MosqueError.locationDisabled
            : e.toString().contains('location_denied')
                ? _MosqueError.locationDenied
                : _MosqueError.searchFailed;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final errorMessage = switch (_error) {
      _MosqueError.locationDisabled => l10n.mosqueLocationServiceDisabled,
      _MosqueError.locationDenied => l10n.mosqueLocationPermissionNeeded,
      _MosqueError.searchFailed => l10n.mosqueSearchError,
      null => '',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.toolMosqueTitle),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.mosqueTabMosques),
            Tab(text: l10n.mosqueTabHalalRestaurants),
          ],
        ),
        actions: [
          IconButton(tooltip: l10n.commonRefreshTooltip, onPressed: _load, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_off_outlined, size: 48, color: AppColors.mutedText),
                        const SizedBox(height: 12),
                        Text(errorMessage, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(onPressed: _load, child: Text(l10n.commonRetry)),
                      ],
                    ),
                  ),
                )
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _PlacesList(places: _mosques, emptyMessage: l10n.mosqueNoMosquesFound),
                    _PlacesList(places: _halalRestaurants, emptyMessage: l10n.mosqueNoHalalFound),
                  ],
                ),
    );
  }
}

class _PlacesList extends StatelessWidget {
  final List<NearbyPlace> places;
  final String emptyMessage;

  const _PlacesList({required this.places, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(emptyMessage, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.mutedText)),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: places.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final place = places[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.mosque_outlined, color: AppColors.primaryEmerald),
            title: Text(place.name, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: place.address != null ? Text(place.address!) : null,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(place.distanceLabel, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryEmerald)),
                const Icon(Icons.chevron_left, color: AppColors.mutedText, size: 18),
              ],
            ),
            onTap: () => launchUrl(Uri.parse(place.mapsUrl), mode: LaunchMode.externalApplication),
          ),
        );
      },
    );
  }
}
