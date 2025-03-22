import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Web用の存在しないpathを入力した際に表示されるページ
class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Error Page'), backgroundColor: BrandColor.error),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: BrandColor.error,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: const TextStyle(
                fontSize: 24,
                color: BrandColor.error,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.login);
              },
              child: const Text('ログインページに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
