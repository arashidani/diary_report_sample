import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportsEditSheet extends StatefulWidget {
  final String? docId;
  final String? initialTitle;
  final String? initialContent;
  final DateTime? initialDate;

  const ReportsEditSheet({
    super.key,
    this.docId,
    this.initialTitle,
    this.initialContent,
    this.initialDate,
  });

  @override
  State<ReportsEditSheet> createState() => _ReportsEditSheetState();
}

class _ReportsEditSheetState extends State<ReportsEditSheet> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle ?? '');
    contentController =
        TextEditingController(text: widget.initialContent ?? '');
    date = widget.initialDate ?? DateTime.now();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) return;

    final diary = FirebaseFirestore.instance
        .collection('users/3hq19jY7PKTXmlY4oAcCaraIYSi1/dailyReports');

    if (widget.docId != null) {
      await diary.doc(widget.docId).update({
        'title': title,
        'content': content,
        'date': date,
      });
    } else {
      await diary.add({
        'title': title,
        'content': content,
        'date': date,
      });
    }

    if (mounted) Navigator.pop(context);
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => date = picked);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.docId != null;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          Text(isEditing ? 'Edit Report' : 'Add Report',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title')),
          const SizedBox(height: 8),
          TextField(
              controller: contentController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Content')),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('Date: ${date.toLocal().toString().split(' ')[0]}'),
              const SizedBox(width: 16),
              TextButton(onPressed: _pickDate, child: const Text('Pick Date')),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _save,
            child: Text(isEditing ? '更新' : '追加'),
          ),
        ],
      ),
    );
  }
}
