import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

/// Renders a single ayah as a styled, shareable image card -- Arabic
/// text, optional translation, Surah/Ayah reference, and Wirdi
/// branding -- captured via [RepaintBoundary] and handed to the OS
/// share sheet (WhatsApp, Instagram, Telegram, etc. all pick it up
/// automatically as an image attachment, no per-app integration needed).
class AyahShareScreen extends StatefulWidget {
  final String arabicText;
  final String? translationText;
  final String surahNameArabic;
  final String surahNameLocalized;
  final int surahNumber;
  final int ayahNumber;

  const AyahShareScreen({
    super.key,
    required this.arabicText,
    required this.translationText,
    required this.surahNameArabic,
    required this.surahNameLocalized,
    required this.surahNumber,
    required this.ayahNumber,
  });

  @override
  State<AyahShareScreen> createState() => _AyahShareScreenState();
}

class _AyahShareScreenState extends State<AyahShareScreen> {
  final GlobalKey _cardKey = GlobalKey();
  bool _showTranslation = true;
  bool _isSharing = false;

  Future<void> _share() async {
    if (_isSharing) return;
    setState(() => _isSharing = true);
    try {
      final boundary = _cardKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

      final bytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/wirdi_ayah_${widget.surahNumber}_${widget.ayahNumber}.png');
      await file.writeAsBytes(bytes);

      if (!mounted) return;
      await Share.shareXFiles([XFile(file.path)]);
    } catch (_) {
      // Sharing is best-effort -- the user can simply try again.
    } finally {
      if (mounted) setState(() => _isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ayahShareTitle), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: RepaintBoundary(
                  key: _cardKey,
                  child: _AyahCard(
                    arabicText: widget.arabicText,
                    translationText: _showTranslation ? widget.translationText : null,
                    surahNameArabic: widget.surahNameArabic,
                    ayahNumber: widget.ayahNumber,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  if (widget.translationText != null)
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.ayahShareIncludeTranslation),
                      value: _showTranslation,
                      activeTrackColor: AppColors.primaryEmerald,
                      onChanged: (value) => setState(() => _showTranslation = value),
                    ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _isSharing ? null : _share,
                      icon: _isSharing
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.share),
                      label: Text(l10n.ayahShareButton),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AyahCard extends StatelessWidget {
  final String arabicText;
  final String? translationText;
  final String surahNameArabic;
  final int ayahNumber;

  const _AyahCard({
    required this.arabicText,
    required this.translationText,
    required this.surahNameArabic,
    required this.ayahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryEmerald, Color(0xFF0B3D36)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.format_quote, color: AppColors.goldAccent, size: 28),
          const SizedBox(height: 16),
          Text(
            arabicText,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontFamily: 'AmiriQuran',
              fontSize: 24,
              height: 1.9,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (translationText != null) ...[
            const SizedBox(height: 20),
            Container(height: 1, width: 60, color: AppColors.goldAccent.withValues(alpha: 0.5)),
            const SizedBox(height: 20),
            Text(
              translationText!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 24),
          Text(
            '$surahNameArabic • $ayahNumber',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: AppColors.goldAccent, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 28),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.mosque, size: 16, color: Colors.white70),
              SizedBox(width: 6),
              Text(
                'Wirdi',
                style: TextStyle(fontSize: 13, color: Colors.white70, fontWeight: FontWeight.w700, letterSpacing: 1.2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
