import 'package:app/provider/userprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text('Log Out'),
      onPressed: () {
        Provider.of<UserProvider>(context, listen: false).logOut();
        Navigator.pushReplacementNamed(context, '/login');
      },
    ));
  }
}
