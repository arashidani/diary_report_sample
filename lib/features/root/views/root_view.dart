import 'package:diary_report_sample/app/routes.dart';
import 'package:diary_report_sample/features/daily_reports/views/daily_reports_view.dart';
import 'package:diary_report_sample/features/setting/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootView extends StatefulWidget {
  const RootView({super.key, required this.child});
  final Widget child;

  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  final List<String> _routes = [
    Routes.home,
    Routes.dailyReports,
    Routes.setting
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // キーボード表示時に画面が調整されず、意図せずTextFieldが押せないことがある
      resizeToAvoidBottomInset: false, // Not related to navigation
      body: SelectionArea(child: widget.child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
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
