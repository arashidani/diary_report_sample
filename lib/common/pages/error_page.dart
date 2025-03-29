import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Web用の存在しないpathを入力した際に表示されるページ
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Page Not Found'),
          backgroundColor: BrandColor.error),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: BrandColor.error,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              "This page does not exist.",
              style: const TextStyle(
                fontSize: 18,
                color: BrandColor.error,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.replace(Routes.login);
              },
              child: const Text('ログインページに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
