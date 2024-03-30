import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('John Doe'),
          accountEmail: Text('john.doe@example.com'),
        ),
        ListTile(
          title: Text('通知'),
          onTap: () => {debugPrint("onTap")},
        ),
        ListTile(
          title: Text('テーマ'),
          onTap: () => {debugPrint("onTap")},
        ),
        ListTile(
          title: Text('ログアウト'),
          onTap: () => {debugPrint("onTap")},
        ),
      ],
    );
  }
}
