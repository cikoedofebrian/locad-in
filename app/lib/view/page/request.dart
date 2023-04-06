import 'package:app/constant/api.dart';
import 'package:app/provider/userprov.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final url = Uri.parse(Api.menu);
          final result = await http.get(url);
          print(result.body);
        },
        child: Text('Test'),
      ),
    );
  }
}
