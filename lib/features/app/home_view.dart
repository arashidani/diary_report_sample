import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: Text(
          'Welcome to HomeView!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
