// lib/ui/signup/sign_up_page.dart
import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/extensions/firebase_auth_error_extension.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/services/firebase_auth_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onSignUpPressed() async {
    final authService = ref.read(firebaseAuthServiceProvider);

    try {
      await authService.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      // サインアップ後に戻らないように
      context.replace(Routes.home);
    } on FirebaseAuthError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${e.title}: \n${e.description}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  // child: SvgPicture.asset(
                  //   'assets/images/logo.svg',
                  //   width: 100,
                  //   height: 100,
                  // ),
                  child: Image.asset(
                    'assets/images/Icon-192.png',
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'メールアドレス'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSignUpPressed,
                child: const Text('登録する'),
              ),
            ),
            TextButton(
              onPressed: () {
                context.go(Routes.login);
              },
              child: const Text('ログイン画面に戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
