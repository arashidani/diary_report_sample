// lib/ui/setup/setup_page.dart
import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SetUpPage extends ConsumerStatefulWidget {
  const SetUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends ConsumerState<SetUpPage> {
  final _first = TextEditingController();
  final _last = TextEditingController();

  Future<void> _save() async {
    final user = ref.read(authStateProvider).value;
    if (user == null) return;
    final client = FirestoreClient();
    await client.update(
        collectionPath: DatabaseConstants.USERS,
        docId: user.uid,
        data: Users(
          firstName: _first.text.trim(),
          lastName: _last.text.trim(),
        ),
        toJson: (user) => user.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プロフィール設定')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
              controller: _first,
              decoration: const InputDecoration(labelText: '名')),
          TextField(
              controller: _last,
              decoration: const InputDecoration(labelText: '姓')),
          const SizedBox(height: 16),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: _save, child: const Text('保存')))
        ]),
      ),
    );
  }
}
