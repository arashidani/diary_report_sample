import 'package:diary_report_sample/providers/current_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:diary_report_sample/models/firebase/users/users.dart';

class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDataProvider);

    return currentUser.when(
      data: (data) {
        return userData(data);
      },
      loading: () => CircularProgressIndicator(),
      error: (_, __) => Text('エラーが発生しました'),
    );
  }
}

Widget userData(Users? users) {
  return users == null
      ? Text('ユーザーデータがありません')
      : Column(
          children: [Text(users.name), Text(users.email), Text(users.role)],
        );
}
