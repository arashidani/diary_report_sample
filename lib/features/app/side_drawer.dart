import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_page.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);
  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  User? loginuser;
  String displayname = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!(ログアウトしています)');
      } else {
        print('User is signed in!（ログインしています）');
        loginuser = user;
        displayname = user.displayName ?? '';
        email = user.email ?? '';
      }
    });
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(displayname),
          accountEmail: Text(email),
        ),
        ListTile(
          title: Text('通知'),
          onTap: () => {debugPrint("onTap")},
        ),
        ListTile(
          title: Text('テーマ'),
          onTap: () => {debugPrint("onTap")},
        ),
        LoginPage(),
        ListTile(
          title: Text('ログアウト'),
          onTap: () async {
            try {
              await FirebaseAuth.instance.signOut();
              setState(() {
                Fluttertoast.showToast(
                  msg: 'ログアウトしました',
                  fontSize: 18,
                );
              });
            } catch (e) {
              setState(() {
                Fluttertoast.showToast(
                  msg: "ログアウトに失敗しました：${e.toString()}",
                  fontSize: 18,
                );
              });
            }
          },
        ),
      ],
    );
  }
}
