import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/features/app/table_view.dart';
import 'package:diary_report_sample/providers/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/app/account_view.dart';
import 'features/app/auth/signup_page.dart';
import 'models/firebase/users/users.dart';

// class AppState extends StatefulWidget {
//   const AppState({super.key});
//   @override
//   State<AppState> createState() => _AppState();
// }

// class _AppState extends State<AppState> {
//   var themeMode = ThemeMode.dark;
//   final appBarTitles = ['HOME', '一覧', 'アカウント'];
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // 表示する画面のリストを作成
//     final pages = [
//       const HomeView(),
//       const TableView(),
//       const AccountView(),
//     ];
//     return MaterialApp(
//         // themeMode: themeMode,
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: RouteGenerator.generateRoute,
//         theme: ThemeData(
//           textTheme: GoogleFonts.notoSansJpTextTheme(),
//         ),
//         home: Scaffold(
//           appBar: AppBar(
//               title: Text(
//             appBarTitles[_selectedIndex],
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           )),
//           body: pages[_selectedIndex],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             onTap: _onItemTapped,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.list_alt_outlined), label: '一覧'),
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
//             ],
//             type: BottomNavigationBarType.fixed,
//           ),
//           floatingActionButton: FloatingActionButton(
//             child: const Icon(Icons.edit),
//             onPressed: () {
//               // TODO: 追加画面を追加
//               debugPrint("onPressed");
//             },
//           ),
//         ));
//   }
// }

final selectedIndexProvider = StateProvider<int>((ref) => 0);
// 表示する画面のリストを作成
final pages = [
  HomeView(),
  const TableView(),
  const AccountView(),
];

class AppState extends ConsumerWidget {
  var themeMode = ThemeMode.dark;
  final appBarTitles = ['HOME', '一覧', 'アカウント'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = ref.watch(selectedIndexProvider);
    final currentUser = ref.watch(currentUserDataProvider);

    return MaterialApp(
        // themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansJpTextTheme(),
        ),
        home: Scaffold(
          appBar: AppBar(
              title: Text(
            appBarTitles[_selectedIndex],
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          // body: currentUser.when(
          //   data: (data) {
          //     print(data);
          //     return userData(data, _selectedIndex);
          //   },
          //   loading: () => CircularProgressIndicator(),
          //   error: (_, __) => Text('エラーが発生しました'),
          // ),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) =>
                ref.read(selectedIndexProvider.notifier).state = index,
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

Widget userData(Users? users, int index) {
  print(index);
  return users == null
      //ログインアウト中は新規登録画面を表示
      ? SignUpPage()
      //ログイン中はホーム画面を表示
      : pages[index];
}
