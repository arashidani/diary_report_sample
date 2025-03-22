import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/reports_edit_sheet.dart';
import 'package:flutter/material.dart';

class ReportListTile extends StatelessWidget {
  final String docId;
  final Map<String, dynamic> data;

  const ReportListTile({
    super.key,
    required this.docId,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(docId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Delete Diary?'),
            content: Text('Delete "${data['title']}"?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Delete')),
            ],
          ),
        );
      },
      onDismissed: (_) async {
        await FirebaseFirestore.instance
            .collection('users/3hq19jY7PKTXmlY4oAcCaraIYSi1/dailyReports')
            .doc(docId)
            .delete();
      },
      child: ListTile(
        title: Text(data['title'] ?? ''),
        subtitle: Text((data['date'] as Timestamp).toDate().toString()),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: ReportsEditSheet(
                docId: docId,
                initialTitle: data['title'],
                initialContent: data['content'],
                initialDate: (data['date'] as Timestamp).toDate(),
              ),
            ),
          );
        },
      ),
    );
  }
}
