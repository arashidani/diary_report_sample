import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1, // 1割
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  )),
              const Expanded(
                flex: 8, // 8割
                child: Text(
                  'Your Text',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  flex: 1, // 1割
                  child: Container()),
            ],
          ),
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
      ),
    );
  }
}
