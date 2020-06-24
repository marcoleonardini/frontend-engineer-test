import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/ui/pages/home.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/login.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/register.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        RegisterPage.route: (context) => RegisterPage(),
        HomePage.route: (context) => HomePage(),
      },
    );
  }
}
