import 'package:app/constant/appcolor.dart';
import 'package:app/view/page/forgotpassword.dart';
import 'package:app/view/page/home.dart';
import 'package:app/view/page/home_nav.dart';
import 'package:app/view/page/homeex.dart';
import 'package:app/view/page/login.dart';
import 'package:app/view/page/profile.dart';
import 'package:app/view/page/register.dart';
import 'package:app/view/pbm.dart';
import 'package:app/view/pbm_2.dart';
import 'package:app/view/templates/defaultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 10));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => const HomeNav(),
        "/register": (context) => RegisterPage(),
        "/forgot-password": (context) => const ForgotPassword(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
