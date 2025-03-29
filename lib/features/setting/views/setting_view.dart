import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/components/common_dialog.dart';
import 'package:diary_report_sample/features/auth/viewmodels/user_notifier_provider.dart';
import 'package:diary_report_sample/features/setting/views/components/cutom_avatar.dart';
import 'package:diary_report_sample/features/setting/views/components/section_header.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/package_info_provider.dart';
import 'package:diary_report_sample/providers/theme_provider.dart';
import 'package:diary_report_sample/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authStateProvider).value?.uid;

    final packageInfoAsync = ref.watch(packageInfoProvider);

    final userState = ref.watch(userNotifierProvider);
    final userNotifier = ref.read(userNotifierProvider.notifier);

    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    // final localeNotifier = ref.read(localeProvider.notifier);
    // final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('設定')),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomAvatar(
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/100942704?v=4',
                  ),
                  SizedBox(width: 20),
                  userState.maybeWhen(
                      data: (user) => Text(
                            user!.fullName.isEmpty ? 'ユーザー名なし' : user.fullName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                      orElse: () => const SizedBox()),
                ],
              ),
            ),
            SizedBox(height: 10),
            const SectionHeader(title: 'アカウント設定'),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('本人情報変更'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                // Navigate to account settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('メールアドレスの変更'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                // Navigate to account settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.password),
              title: Text('パスワードの変更'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                // Navigate to account settings page
              },
            ),
            const SectionHeader(title: '通知設定'),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('通知設定'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {},
            ),
            const SectionHeader(title: 'システム'),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('ライセンス'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                context.push(Routes.licence);
              },
            ),
            SwitchListTile(
              title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
              value: isDarkMode,
              onChanged: (value) => {
                themeNotifier.toggleTheme(),
              },
            ),

            // DropdownButton<Locale>(
            //   value: currentLocale,
            //   items: const [
            //     DropdownMenuItem(
            //       value: Locale('ja'),
            //       child: Text('日本語'),
            //     ),
            //     DropdownMenuItem(
            //       value: Locale('en'),
            //       child: Text('English'),
            //     ),
            //   ],
            //   onChanged: (locale) {
            //     if (locale != null) {
            //       localeNotifier.changeLocale(locale);
            //     }
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('ログアウト'),
              onTap: () {
                CommonDialog.show(
                  context,
                  'ログアウトしますか？',
                  onOkPressed: () async {
                    if (!context.mounted) return;
                    // Logout後に置き換え => 戻れなくする
                    await userNotifier.signOut(); // 確実にサインアウトしてから遷移
                    if (context.mounted) {
                      context.replace(Routes.login);
                    }
                  },
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: packageInfoAsync.maybeWhen(
                  data: (packageInfo) => Text(
                    'バージョン: ${packageInfo.version}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  orElse: () => const Text('バージョン: 情報がありません'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'id：$uid',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: IconButton(
                      icon: Icon(Icons.copy, size: 20, color: Colors.grey[700]),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: "$uid"));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ユーザーIDをコピーしました')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Center(
                  child: Text('アカウント削除',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: BrandColor.error))),
              onTap: () {
                CommonDialog.show(
                  context,
                  'アカウントを削除してもよろしいですか？',
                  onOkPressed: () async {
                    if (!context.mounted) return;
                    await userNotifier.deleteUser();
                    if (context.mounted) {
                      context.replace(Routes.signUp);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
