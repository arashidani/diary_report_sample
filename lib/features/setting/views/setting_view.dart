import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/components/common_dialog.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/locale_provider.dart';
import 'package:diary_report_sample/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuthService = ref.read(firebaseAuthServiceProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final localeNotifier = ref.read(localeProvider.notifier);
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Icon and Username
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 16),
                Text(
                  'User Name', // ユーザー名
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 32),

            // Account Settings
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account Settings'),
              onTap: () {
                // Navigate to account settings page
              },
            ),

            // Notification Settings
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification Settings'),
              onTap: () {
                // Navigate to notification settings page
              },
            ),

            // Help
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // Navigate to help page
              },
            ),

            // Terms of Service
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Terms of Service'),
              onTap: () {
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

            DropdownButton<Locale>(
              value: currentLocale,
              items: const [
                DropdownMenuItem(
                  value: Locale('ja'),
                  child: Text('日本語'),
                ),
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  localeNotifier.changeLocale(locale);
                }
              },
            ),
            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout'),
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
          ],
        ),
      ),
    );
  }
}
