import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignUpPage> {
  String newUserEmail = '';
  String newUserPassword = '';
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emailアドレスを入力するテキストフィールドを作成する
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (String value) => setState(() {
                newUserEmail = value;
              }),
            ),

            const SizedBox(height: 8),
            // パスワードを入力するテキストフィールドを作成する
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              //パスワードが見えないように設定する
              obscureText: true,
              onChanged: (String value) => setState(() {
                newUserPassword = value;
              }),
            ),
            const SizedBox(height: 8),
            // このボタンを押すとFirebaseにユーザー情報が登録される
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.createUserWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  print(newUserEmail);

                  final User user = result.user!;
                  // await FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc(user.uid)
                  //     .set({
                  //   //'name': newUserName, // 任意のユーザ情報
                  //   'email': user.email, // 任意のユーザ情報
                  // });

                  setState(() {
                    infoText = "ユーザー登録を完了しました。登録したメールアドレスは${user.email}です";
                  });
                } catch (e) {
                  setState(() {
                    infoText = "ユーザー登録時にエラーが発生しました";
                  });
                }
              },
              child: Text('Sign Up'),
            ),
            const SizedBox(height: 8),

            Text(infoText),
          ],
        ),
      ),
    );
  }
}
