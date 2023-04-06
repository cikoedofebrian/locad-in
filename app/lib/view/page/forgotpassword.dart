import 'package:app/provider/userprov.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../templates/defaultpage.dart';
import '../../constant/appcolor.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var passwordConf = '';

  void forgotPassword(BuildContext context) async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final result = await Provider.of<UserProvider>(context, listen: false)
          .changePassword(email, password);
      if (result.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Change password success!')));
        Navigator.pop(context);
      }
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
              'Forgot Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      return "Please enter an email";
                    }
                    if (!EmailValidator.validate(email)) {
                      return "Please give a valid email address";
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
                      return "Please enter a password";
                    } else if (value.length < 8 || value.length > 15) {
                      return "A password have minimum and maximum length of 8 and 15";
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
                  onSaved: (newValue) => passwordConf = newValue!,
                  obscureText: true,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 8 || value.length > 15) {
                      return "A password have minimum and maximum length of 8 and 15";
                    } else if (password != passwordConf) {
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
                    onTap: () => forgotPassword(context),
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
