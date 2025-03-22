import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/user_doc_provider.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' hide Router;

class SetUpPage extends ConsumerStatefulWidget {
  const SetUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends ConsumerState<SetUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    try {
      final client = FirestoreClient();
      await client.update(
        collectionPath: DatabaseConstants.USERS,
        docId: user.uid,
        data: Users(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
        ),
        toJson: (users) => users.toJson(),
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('プロフィールを保存しました')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('保存に失敗しました: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).value;
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('未ログインのため設定できません')),
      );
    }

    final asyncUserDoc = ref.watch(userDocProvider(user.uid));

    return asyncUserDoc.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(
        body: Center(child: Text('ユーザ情報の取得に失敗しました: $err')),
      ),
      data: (userDoc) {
        return Scaffold(
          appBar: AppBar(title: const Text('プロフィール設定')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _firstNameController
                    ..text = userDoc?.firstName ?? '',
                  decoration:
                      const InputDecoration(labelText: '名 (First Name)'),
                ),
                TextField(
                  controller: _lastNameController
                    ..text = userDoc?.lastName ?? '',
                  decoration: const InputDecoration(labelText: '姓 (Last Name)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('ホームへ'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
