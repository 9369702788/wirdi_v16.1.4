
import 'package:flutter/material.dart';
import '../../../core/models/radio_station.dart';
import '../../../core/services/radio_service.dart';
import '../../../core/services/settings_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/generated/app_localizations.dart';

class RadioStationTile extends StatelessWidget {
  final RadioStation station;
  const RadioStationTile({super.key, required this.station});

  Color get _catColor {
    switch (station.category) {
      case 'quran':    return AppColors.primaryEmerald;
      case 'prayers':  return const Color(0xFF1565C0);
      case 'lectures': return const Color(0xFF6A1B9A);
      case 'nasheed':  return const Color(0xFFE65100);
      default:         return Colors.grey;
    }
  }

  IconData get _catIcon {
    switch (station.category) {
      case 'quran':    return Icons.menu_book_rounded;
      case 'prayers':  return Icons.mosque_rounded;
      case 'lectures': return Icons.school_rounded;
      case 'nasheed':  return Icons.music_note_rounded;
      default:         return Icons.radio;
    }
  }

  String get _flag {
    const flags = {'SA':'🇸🇦','EG':'🇪🇬','AE':'🇦🇪','KW':'🇰🇼','MA':'🇲🇦','DZ':'🇩🇿','TN':'🇹🇳','QA':'🇶🇦'};
    return flags[station.countryCode] ?? '🌍';
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final lang = appSettings.locale.languageCode;
    final name = lang == 'ar' ? station.nameAr : station.nameEn;

    return ListenableBuilder(
      listenable: RadioService.instance,
      builder: (_, __) {
        final svc = RadioService.instance;
        final isThis = svc.currentStation?.id == station.id;
        final isPlaying = isThis && svc.isPlaying;
        final isLoading = isThis && svc.isLoading;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          elevation: isThis ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: isThis
                ? const BorderSide(color: AppColors.primaryEmerald, width: 1.5)
                : BorderSide.none,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: Stack(children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: isThis ? _catColor : _catColor.withOpacity(0.12),
                child: Icon(_catIcon, color: isThis ? Colors.white : _catColor, size: 22),
              ),
              Positioned(right: 0, bottom: 0,
                  child: Text(_flag, style: const TextStyle(fontSize: 12))),
            ]),
            title: Text(name,
                style: TextStyle(
                    fontWeight: isThis ? FontWeight.bold : FontWeight.normal,
                    color: isThis ? AppColors.primaryEmerald : null)),
            subtitle: Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primaryEmerald.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(station.category,
                    style: const TextStyle(fontSize: 10,
                        color: AppColors.primaryEmerald, fontWeight: FontWeight.w600)),
              ),
              if (station.isOfficial) ...[
                const SizedBox(width: 4),
                const Icon(Icons.verified, size: 12, color: AppColors.goldAccent),
              ],
            ]),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                icon: Icon(
                  svc.isFavorite(station.id) ? Icons.favorite : Icons.favorite_border,
                  color: svc.isFavorite(station.id) ? Colors.red.shade400 : Colors.grey,
                  size: 20,
                ),
                tooltip: svc.isFavorite(station.id) ? l.radioRemoveFavorite : l.radioAddFavorite,
                onPressed: () => svc.toggleFavorite(station.id),
              ),
              SizedBox(
                width: 40, height: 40,
                child: isLoading
                    ? const Padding(padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_rounded,
                          size: 36,
                          color: isPlaying ? AppColors.primaryEmerald : Colors.grey.shade400,
                        ),
                        onPressed: () => svc.togglePlay(station),
                      ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
