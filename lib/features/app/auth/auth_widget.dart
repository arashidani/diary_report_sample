import 'package:diary_report_sample/features/app/auth/signup_page.dart';
import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/providers/current_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:diary_report_sample/models/firebase/users/users.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserDataProvider);
    print(currentUser.toString() + '15');
    return currentUser.when(
      data: (data) {
        print(data.toString() + '18');
        return userData(data);
      },
      loading: () => CircularProgressIndicator(),
      error: (_, __) => Text('エラーが発生しました'),
    );
  }
}

Widget userData(Users? users) {
  return users == null
      //ログインアウト中は新規登録画面を表示
      ? SignUpPage()
      //ログイン中はホーム画面を表示
      : HomeView();
}
