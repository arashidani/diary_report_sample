import 'package:cached_network_image/cached_network_image.dart';
import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/common/components/common_dialog.dart';
import 'package:diary_report_sample/features/auth/viewmodels/users_provider.dart';
import 'package:diary_report_sample/features/setting/views/components/cutom_avatar.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/package_info_provider.dart';
import 'package:diary_report_sample/providers/theme_provider.dart';
import 'package:diary_report_sample/providers/user_doc_provider.dart';
import 'package:diary_report_sample/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     spacing: 4,
      //     children: [
      //       // User Icon and Username
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           children: [
      //             CustomAvatar(
      //               imageUrl:
      //                   'https://avatars.githubusercontent.com/u/100942704?v=4',
      //             ),
      //             SizedBox(width: 32),
      //             userDoc.maybeWhen(
      //                 data: (user) => Text(
      //                       user!.fullName, // ユーザー名
      //                       style: const TextStyle(
      //                           fontSize: 20, fontWeight: FontWeight.bold),
      //                     ),
      //                 orElse: () => const SizedBox()),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 8),
      //       // Account Settings
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         title: Text('本人情報変更'),
      //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
      //         onTap: () {
      //           // Navigate to account settings page
      //         },
      //       ),
      //
      //       ListTile(
      //         leading: Icon(Icons.email),
      //         title: Text('メールアドレスの変更'),
      //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
      //         onTap: () {
      //           // Navigate to account settings page
      //         },
      //       ),
      //
      //       ListTile(
      //         leading: Icon(Icons.password),
      //         title: Text('パスワードの変更'),
      //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
      //         onTap: () {
      //           // Navigate to account settings page
      //         },
      //       ),
      //
      //       // Notification Settings
      //       ListTile(
      //         leading: Icon(Icons.notifications),
      //         title: Text('通知設定'),
      //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
      //         onTap: () {
      //           // Navigate to notification settings page
      //         },
      //       ),
      //
      //       // Terms of Service
      //       ListTile(
      //         leading: Icon(Icons.description),
      //         title: Text('ライセンス'),
      //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
      //         onTap: () {
      //           showLicensePage(
      //             context: context,
      //             applicationName: packageInfoAsync.value?.appName ?? '',
      //             applicationIcon:
      //                 Image.asset('assets/images/rogo-typeB.png', height: 80),
      //             applicationVersion: packageInfoAsync.value?.version,
      //           );
      //           // Navigate to terms of service page
      //         },
      //       ),
      //       SwitchListTile(
      //         title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
      //         value: isDarkMode,
      //         onChanged: (value) => {
      //           themeNotifier.toggleTheme(),
      //         },
      //       ),
      //
      //       // DropdownButton<Locale>(
      //       //   value: currentLocale,
      //       //   items: const [
      //       //     DropdownMenuItem(
      //       //       value: Locale('ja'),
      //       //       child: Text('日本語'),
      //       //     ),
      //       //     DropdownMenuItem(
      //       //       value: Locale('en'),
      //       //       child: Text('English'),
      //       //     ),
      //       //   ],
      //       //   onChanged: (locale) {
      //       //     if (locale != null) {
      //       //       localeNotifier.changeLocale(locale);
      //       //     }
      //       //   },
      //       // ),
      //       // Logout Button
      //       ListTile(
      //         leading: const Icon(Icons.logout),
      //         title: Text('ログアウト'),
      //         onTap: () {
      //           CommonDialog.show(
      //             context,
      //             'ログアウトしますか？',
      //             onOkPressed: () async {
      //               if (!context.mounted) return;
      //               // Logout後に置き換え => 戻れなくする
      //               await firebaseAuthService.signOut(); // 確実にサインアウトしてから遷移
      //               if (context.mounted) {
      //                 context.replace(Routes.login); // 🔁 go -> replace
      //               }
      //             },
      //           );
      //         },
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      //         child: Center(
      //           child: packageInfoAsync.maybeWhen(
      //             data: (packageInfo) => Text(
      //               'バージョン: ${packageInfo.version}',
      //               style: const TextStyle(fontSize: 18),
      //             ),
      //             orElse: () => const Text('バージョン: 情報がありません'),
      //           ),
      //         ),
      //       ),
      //       Spacer(),
      //       ListTile(
      //         title: Center(
      //             child: Text('アカウント削除',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     color: BrandColor.error))),
      //         onTap: () {
      //           CommonDialog.show(
      //             context,
      //             'アカウントを削除してもよろしいですか？',
      //             onOkPressed: () async {
      //               if (!context.mounted) return;
      //               await usersNotifier.deleteUser(uid!);
      //               await authState.value?.delete(); //
      //               if (context.mounted) {
      //                 context.replace(Routes.signUp); // 🔁 go -> replace
      //               }
      //             },
      //           );
      //         },
      //       ),
      //       Spacer(),
      //     ],
      //   ),
      // ),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: 'アカウント設定'),
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
            const SectionHeader(title: '通知設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: 'プッシュ通知', value: 'オン'),
                SettingsTile(title: 'メール通知', value: 'オフ'),
              ],
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ユーザーID：$uid',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: "$uid"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('ユーザーIDをコピーしました')),
                    );
                  },
                  child: Icon(Icons.copy, size: 20, color: Colors.grey[700]),
                ),
              ],
            ),
            ListTile(
              title: Text('ユーザーID'),
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: "${userDoc.value?.docId}"));
              },
            ),
            const SectionHeader(title: '通知設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: 'プッシュ通知', value: 'オン'),
                SettingsTile(title: 'メール通知', value: 'オフ'),
                SettingsTile(title: 'Chatwork Live通知', value: 'オン'),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: '表示設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: '使用するテーマ', value: 'システムの設定に従う'),
                SettingsTile(title: 'リンク先のプレビュー表示', value: 'オン'),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: '詳細設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: 'Face ID とパスコード', value: 'オフ'),
                SettingsTile(title: '送信画像の品質', value: '標準'),
                SettingsTile(title: '送信動画の品質', value: '標準'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        leading: const BackButton(),
      ),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: '通知設定'),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           children: [
            //             CustomAvatar(
            //               imageUrl:
            //                   'https://avatars.githubusercontent.com/u/100942704?v=4',
            //             ),
            //             SizedBox(width: 32),
            //             userDoc.maybeWhen(
            //                 data: (user) => Text(
            //                       user!.fullName, // ユーザー名
            //                       style: const TextStyle(
            //                           fontSize: 20, fontWeight: FontWeight.bold),
            //                     ),
            //                 orElse: () => const SizedBox()),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 8),
            //       // Account Settings
            //       ListTile(
            //         leading: Icon(Icons.person),
            //         title: Text('本人情報変更'),
            //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
            //         onTap: () {
            //           // Navigate to account settings page
            //         },
            //       ),
            //
            //       ListTile(
            //         leading: Icon(Icons.email),
            //         title: Text('メールアドレスの変更'),
            //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
            //         onTap: () {
            //           // Navigate to account settings page
            //         },
            //       ),
            //
            //       ListTile(
            //         leading: Icon(Icons.password),
            //         title: Text('パスワードの変更'),
            //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
            //         onTap: () {
            //           // Navigate to account settings page
            //         },
            //       ),
            //
            //       // Notification Settings
            //       ListTile(
            //         leading: Icon(Icons.notifications),
            //         title: Text('通知設定'),
            //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
            //         onTap: () {
            //           // Navigate to notification settings page
            //         },
            //       ),
            //
            //       // Terms of Service
            //       ListTile(
            //         leading: Icon(Icons.description),
            //         title: Text('ライセンス'),
            //         trailing: Icon(Icons.keyboard_arrow_right_outlined),
            //         onTap: () {
            //           showLicensePage(
            //             context: context,
            //             applicationName: packageInfoAsync.value?.appName ?? '',
            //             applicationIcon:
            //                 Image.asset('assets/images/rogo-typeB.png', height: 80),
            //             applicationVersion: packageInfoAsync.value?.version,
            //           );
            //           // Navigate to terms of service page
            //         },
            //       ),
            //       SwitchListTile(
            //         title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
            //         value: isDarkMode,
            //         onChanged: (value) => {
            //           themeNotifier.toggleTheme(),
            //         },
            //       ),
            //
            //       // DropdownButton<Locale>(
            //       //   value: currentLocale,
            //       //   items: const [
            //       //     DropdownMenuItem(
            //       //       value: Locale('ja'),
            //       //       child: Text('日本語'),
            //       //     ),
            //       //     DropdownMenuItem(
            //       //       value: Locale('en'),
            //       //       child: Text('English'),
            //       //     ),
            //       //   ],
            //       //   onChanged: (locale) {
            //       //     if (locale != null) {
            //       //       localeNotifier.changeLocale(locale);
            //       //     }
            //       //   },
            //       // ),
            //       // Logout Button
            //       ListTile(
            //         leading: const Icon(Icons.logout),
            //         title: Text('ログアウト'),
            //         onTap: () {
            //           CommonDialog.show(
            //             context,
            //             'ログアウトしますか？',
            //             onOkPressed: () async {
            //               if (!context.mounted) return;
            //               // Logout後に置き換え => 戻れなくする
            //               await firebaseAuthService.signOut(); // 確実にサインアウトしてから遷移
            //               if (context.mounted) {
            //                 context.replace(Routes.login); // 🔁 go -> replace
            //               }
            //             },
            //           );
            //         },
            //       ),
            //
            //       Padding(
            //         padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            //         child: Center(
            //           child: packageInfoAsync.maybeWhen(
            //             data: (packageInfo) => Text(
            //               'バージョン: ${packageInfo.version}',
            //               style: const TextStyle(fontSize: 18),
            //             ),
            //             orElse: () => const Text('バージョン: 情報がありません'),
            //           ),
            //         ),
            //       ),
            //       Spacer(),
            //       ListTile(
            //         title: Center(
            //             child: Text('アカウント削除',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     color: BrandColor.error))),
            //         onTap: () {
            //           CommonDialog.show(
            //             context,
            //             'アカウントを削除してもよろしいですか？',
            //             onOkPressed: () async {
            //               if (!context.mounted) return;
            //               await usersNotifier.deleteUser(uid!);
            //               await authState.value?.delete(); //
            //               if (context.mounted) {
            //                 context.replace(Routes.signUp); // 🔁 go -> replace
            //               }
            //             },
            //           );
            //         },
            //       ),
            //       Spacer(),
            const SettingsSection(
              tiles: [
                SettingsTile(title: 'プッシュ通知', value: 'オン'),
                SettingsTile(title: 'メール通知', value: 'オフ'),
                SettingsTile(title: 'Chatwork Live通知', value: 'オン'),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: '表示設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: '使用するテーマ', value: 'システムの設定に従う'),
                SettingsTile(title: 'リンク先のプレビュー表示', value: 'オン'),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: '詳細設定'),
            const SettingsSection(
              tiles: [
                SettingsTile(title: 'Face ID とパスコード', value: 'オフ'),
                SettingsTile(title: '送信画像の品質', value: '標準'),
                SettingsTile(title: '送信動画の品質', value: '標準'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final List<SettingsTile> tiles;

  const SettingsSection({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(
          tiles.length,
          (index) => Column(
            children: [
              if (index != 0)
                const Divider(height: 1, indent: 16, endIndent: 16),
              tiles[index],
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String value;

  const SettingsTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(
        value,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      onTap: () {
        // TODO: implement navigation
      },
    );
  }
}
