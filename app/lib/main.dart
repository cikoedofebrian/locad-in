import 'package:app/constant/appcolor.dart';
import 'package:app/provider/menuprov.dart';
import 'package:app/provider/userprov.dart';
import 'package:app/view/page/forgotpassword.dart';
import 'package:app/view/page/home_nav.dart';
import 'package:app/view/page/login.dart';
import 'package:app/view/page/profile.dart';
import 'package:app/view/page/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 10));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: userProvider.tryAutoLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: AppColor.primary,
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: Colors.white, size: 40),
                ),
              );
            }
            if (userProvider.isLogin()) {
              return HomeNav();
            }
            return LoginPage();
          }),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => const HomeNav(),
        "/register": (context) => RegisterPage(),
        "/forgot-password": (context) => ForgotPassword(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
