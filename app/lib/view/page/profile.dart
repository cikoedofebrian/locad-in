import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        child: Text('Log out'),
        onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
      )),
    );
  }
}
