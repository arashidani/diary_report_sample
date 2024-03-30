import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/features/app/table_view.dart';
import 'package:diary_report_sample/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/app/side_drawer.dart';

class AppState extends StatefulWidget {
  const AppState({super.key});
  @override
  State<AppState> createState() => _AppState();
}

class _AppState extends State<AppState> {
  var themeMode = ThemeMode.dark;
  final appBarTitles = ['HOME', '一覧', 'アカウント'];
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
      const TableView(),
      const SideDrawer(),
    ];
    return MaterialApp(
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansJpTextTheme(),
        ),
        home: Scaffold(
          appBar: AppBar(
              title: Text(
            appBarTitles[_selectedIndex],
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          body: pages[_selectedIndex],
          endDrawer: const SideDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
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
