import 'dart:convert';

import 'package:app/constant/api.dart';
import 'package:app/provider/userprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../templates/defaultpage.dart';
import '../../constant/appcolor.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';

  void login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final result = await Provider.of<UserProvider>(context, listen: false)
          .login(email, password);
      if (result.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      isPop: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Username',
                  ),
                  margin: EdgeInsets.all(8),
                ),
                TextFormField(
                  onSaved: (newValue) => email = newValue!,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can't be empty";
                    } else if (value.length < 8 || value.length > 15) {
                      return "A Username have minimum and maximum length of 8 and 15";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: "Username",
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Password',
                  ),
                  margin: EdgeInsets.all(8),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (newValue) => password = newValue!,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/forgot-password"),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () => login(context),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Does not have an account?',
                      style: TextStyle(fontSize: 12),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'Create account',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
