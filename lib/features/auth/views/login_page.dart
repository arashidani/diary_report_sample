import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/extensions/firebase_auth_error_extension.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/services/firebase_auth_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onLoginPressed() async {
    final authService = ref.read(firebaseAuthServiceProvider);

    try {
      // signIn
      await authService.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      // 履歴を置き換える => 戻るボタンでlogin画面に戻れない
      context.replace(Routes.home);
    } on FirebaseAuthError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${e.title}:\n ${e.description}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.read(authStateProvider);
    return authState.map(
        data: (_) => _body(context),
        error: (_) => const SizedBox(),
        loading: (_) {
          return Stack(
            children: [
              _body(context),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        });
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
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
                onPressed: _onLoginPressed,
                child: const Text('ログイン'),
              ),
            ),
            TextButton(
              onPressed: () {
                // サインアップページへは push で移動（戻ってこれる）
                context.push(Routes.signUp);
              },
              child: const Text('新規登録はこちら'),
            ),
            TextButton(
              onPressed: () {
                // パスワードリセットページへ
                context.push(Routes.forgetPassword);
              },
              child: const Text('パスワードをお忘れの方はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}
