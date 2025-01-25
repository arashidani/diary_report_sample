import 'package:diary_report_sample/4_presentation/dialog/common_dialog.dart';
import 'package:diary_report_sample/4_presentation/theme/theme_notifier.dart';
import 'package:diary_report_sample/features/root/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopView extends StatefulWidget {
  const TopView({super.key});

  @override
  _TopViewState createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ListScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 関係ない
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        // type: BottomNavigationBarType.fixed, // 高さを固定
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pressed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materialThemeNotifier = ref.read(materialThemeProvider.notifier);
    final materialThemeMode = ref.watch(materialThemeProvider);

    final cupertinoThemeNotifier = ref.read(cupertinoThemeProvider.notifier);
    final cupertinoThemeMode = ref.watch(cupertinoThemeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: materialThemeNotifier.toggleTheme,
              child: Text(
                materialThemeMode == ThemeMode.light
                    ? 'Switch to Dark Mode'
                    : 'Switch to Light Mode',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: cupertinoThemeNotifier.toggleTheme,
              child: Text(
                cupertinoThemeMode == ThemeMode.light
                    ? 'Switch to Dark Mode'
                    : 'Switch to Light Mode',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuthService = ref.read(firebaseAuthServiceProvider);

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

            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                CommonDialog.show(
                  context,
                  'ログアウトしますか？',
                  onOkPressed: () async {
                    await firebaseAuthService.signOut();
                    // Navigator.of(context).pushReplacementNamed('/login');
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
