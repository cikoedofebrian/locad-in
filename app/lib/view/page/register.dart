import 'package:flutter/material.dart';
import '../templates/defaultpage.dart';
import '../../constant/appcolor.dart';
import '../../constant/api.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String passwordConfirm = '';
  String username = '';

  void register(BuildContext context) async {
    print('ss');
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse(Api.register);
      final result = await http.post(
        url,
        body: {"username": username, "email": email, "password": password},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      isPop: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text(
              'Register',
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
                  style: TextStyle(fontSize: 14),
                  onSaved: (newValue) => username = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an username";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Username",
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Email',
                  ),
                  margin: EdgeInsets.all(8),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  onSaved: (newValue) => email = newValue!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please give it an email";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
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
                  onSaved: (newValue) => password = newValue!,
                  obscureText: true,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please give it some password";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Confirm Password',
                  ),
                  margin: EdgeInsets.all(8),
                ),
                TextFormField(
                  onSaved: (newValue) => passwordConfirm = newValue!,
                  obscureText: true,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please give it a password";
                    } else if (password != passwordConfirm) {
                      return "Password does not match";
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () => register(context),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
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
