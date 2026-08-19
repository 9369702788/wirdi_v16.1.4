import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class _MyDua {
  final String id;
  final String text;
  final String? title;
  const _MyDua({required this.id, required this.text, this.title});

  Map<String, dynamic> toJson() => {'id': id, 'text': text, 'title': title};
  factory _MyDua.fromJson(Map<String, dynamic> json) =>
      _MyDua(id: json['id'], text: json['text'], title: json['title']);
}

class MyDuasScreen extends StatefulWidget {
  const MyDuasScreen({super.key});

  @override
  State<MyDuasScreen> createState() => _MyDuasScreenState();
}

class _MyDuasScreenState extends State<MyDuasScreen> {
  static const _prefsKey = 'my_duas_v1';
  List<_MyDua> _duas = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw != null) {
      final decoded = jsonDecode(raw) as List<dynamic>;
      _duas = decoded.map((e) => _MyDua.fromJson(e as Map<String, dynamic>)).toList();
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, jsonEncode(_duas.map((d) => d.toJson()).toList()));
  }

  Future<void> _addOrEditDua({_MyDua? existing}) async {
    final l10n = AppLocalizations.of(context);
    final titleController = TextEditingController(text: existing?.title ?? '');
    final textController = TextEditingController(text: existing?.text ?? '');

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existing == null ? l10n.myDuasDialogTitleNew : l10n.myDuasDialogTitleEdit),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: InputDecoration(labelText: l10n.myDuasTitleFieldLabel),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: textController,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                maxLines: 5,
                decoration: InputDecoration(labelText: l10n.myDuasTextFieldLabel, alignLabelWithHint: true),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.commonSave)),
        ],
      ),
    );

    if (result != true) return;
    final text = textController.text.trim();
    if (text.isEmpty) return;
    final title = titleController.text.trim();

    setState(() {
      if (existing != null) {
        final index = _duas.indexWhere((d) => d.id == existing.id);
        if (index != -1) {
          _duas[index] = _MyDua(id: existing.id, text: text, title: title.isEmpty ? null : title);
        }
      } else {
        _duas.add(_MyDua(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          title: title.isEmpty ? null : title,
        ));
      }
    });
    await _save();
  }

  Future<void> _deleteDua(_MyDua dua) async {
    setState(() => _duas.removeWhere((d) => d.id == dua.id));
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolDuasTitle), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditDua(),
        backgroundColor: AppColors.primaryEmerald,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _duas.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.auto_stories_outlined, size: 48, color: AppColors.mutedText),
                        const SizedBox(height: 12),
                        Text(l10n.myDuasEmptyTitle, style: const TextStyle(color: AppColors.mutedText)),
                        const SizedBox(height: 8),
                        Text(l10n.myDuasEmptySubtitle, style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                  itemCount: _duas.length,
                  itemBuilder: (context, index) {
                    final dua = _duas[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (dua.title != null) ...[
                              Text(dua.title!, textDirection: TextDirection.rtl, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                            ],
                            Text(dua.text, textDirection: TextDirection.rtl, textAlign: TextAlign.right, style: const TextStyle(fontSize: 16, height: 1.7)),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  tooltip: l10n.commonEditTooltip,
                                  icon: const Icon(Icons.edit_outlined, size: 20, color: AppColors.mutedText),
                                  onPressed: () => _addOrEditDua(existing: dua),
                                ),
                                IconButton(
                                  tooltip: l10n.commonDeleteTooltip,
                                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                  onPressed: () => _deleteDua(dua),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
