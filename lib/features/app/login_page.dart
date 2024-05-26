import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String newUserEmail = '';
  String newUserPassword = '';
  String infoText = '';
  String loginUserEmail = '';
  String loginUserPassword = '';
  String logininfoText = '';

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
            Text("Login"),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (String value) => setState(() {
                loginUserEmail = value;
              }),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) => setState(() {
                loginUserPassword = value;
              }),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                      await auth.signInWithEmailAndPassword(
                    email: loginUserEmail,
                    password: loginUserPassword,
                  );

                  final User user = result.user!;
                  setState(() {
                    infoText = "ログインに成功しました。ログインメールアドレスは${user.email}です";
                  });
                } catch (e) {
                  setState(() {
                    infoText = 'ログイン時にエラーが発生しました';
                  });
                }
              },
              child: Text('Login'),
            ),
            const SizedBox(height: 8),
            Text(infoText),
          ],
        ),
      ),
    );
  }
}
