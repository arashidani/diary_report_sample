import 'package:cached_network_image/cached_network_image.dart';
import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/components/common_dialog.dart';
import 'package:diary_report_sample/features/auth/viewmodels/users_provider.dart';
import 'package:diary_report_sample/features/setting/views/components/cutom_avatar.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/locale_provider.dart';
import 'package:diary_report_sample/providers/package_info_provider.dart';
import 'package:diary_report_sample/providers/theme_provider.dart';
import 'package:diary_report_sample/providers/user_doc_provider.dart';
import 'package:diary_report_sample/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(packageInfoProvider);

    final firebaseAuthService = ref.read(firebaseAuthServiceProvider);
    final authState = ref.watch(authStateProvider);
    final uid = authState.value?.uid;
    final userDoc = ref.watch(userDocProvider(uid ?? ''));
    final usersNotifier = ref.read(usersProvider.notifier);

    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    // final localeNotifier = ref.read(localeProvider.notifier);
    // final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            // User Icon and Username
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomAvatar(
                    imageUrl:
                        'https://avatars.githubusercontent.com/u/100942704?v=4',
                  ),
                  SizedBox(width: 32),
                  userDoc.maybeWhen(
                      data: (user) => Text(
                            user!.fullName, // ユーザー名
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                      orElse: () => const SizedBox()),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Account Settings
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

            // Notification Settings
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('通知設定'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                // Navigate to notification settings page
              },
            ),

            // Terms of Service
            ListTile(
              leading: Icon(Icons.description),
              title: Text('ライセンス'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: packageInfoAsync.value?.appName ?? '',
                  applicationIcon:
                      Image.asset('assets/images/rogo-typeB.png', height: 80),
                  applicationVersion: packageInfoAsync.value?.version,
                );
                // Navigate to terms of service page
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
            // Logout Button
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
                    await firebaseAuthService.signOut(); // 確実にサインアウトしてから遷移
                    if (context.mounted) {
                      context.replace(Routes.login); // 🔁 go -> replace
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
                    style: const TextStyle(fontSize: 18),
                  ),
                  orElse: () => const Text('バージョン: 情報がありません'),
                ),
              ),
            ),
            Spacer(),
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
                    await usersNotifier.deleteUser(uid!);
                    await authState.value?.delete(); //
                    if (context.mounted) {
                      context.replace(Routes.signUp); // 🔁 go -> replace
                    }
                  },
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
