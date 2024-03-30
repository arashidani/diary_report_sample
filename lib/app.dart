import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/features/app/sample_view.dart';
import 'package:diary_report_sample/features/app/table_view.dart';
import 'package:diary_report_sample/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'features/app/side_drawer.dart';

class AppState extends StatefulWidget {
  const AppState({super.key});
  @override
  State<AppState> createState() => _AppState();
}

class _AppState extends State<AppState> {
  var themeMode = ThemeMode.dark;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 表示する画面のリストを作成
    final pages = [
      const HomeView(),
      const TableView(title: "一覧画面"),
      SideDrawer(),
    ];
    return MaterialApp(
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Scaffold(
          appBar: AppBar(title: const Text('HOME')),
          body: pages[_selectedIndex],
          endDrawer: const SideDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined), label: '一覧'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
            ],
            type: BottomNavigationBarType.fixed,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.edit),
            onPressed: () {
              // TODO: 追加画面を追加
              debugPrint("onPressed");
            },
          ),
        ));
  }
}
