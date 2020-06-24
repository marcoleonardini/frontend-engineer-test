import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/providers/restaurants.provider.dart';
import 'package:frontend_engineer_test/src/core/providers/user.provider.dart';
import 'package:frontend_engineer_test/src/ui/pages/history.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/home.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/login.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/map.page.dart';
import 'package:frontend_engineer_test/src/ui/pages/register.page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<RestaurantsProvider>(
            create: (_) => RestaurantsProvider()..getRestaurants()),
      ],
      child: MaterialApp(
        title: 'Fast Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginPage.route,
        routes: {
          LoginPage.route: (context) => LoginPage(),
          RegisterPage.route: (context) => RegisterPage(),
          HomePage.route: (context) => HomePage(),
          HistoryPage.route: (context) => HistoryPage(),
          MapPage.route: (context) => MapPage(),
        },
      ),
    );
  }
}
