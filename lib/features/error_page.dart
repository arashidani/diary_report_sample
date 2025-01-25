import 'package:diary_report_sample/4_presentation/router/routes.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              error,
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.signupPage);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
