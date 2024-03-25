import 'package:end_pay_app/views/home.dart';
import 'package:end_pay_app/views/login.dart';
import 'package:end_pay_app/views/register.dart';
import 'package:end_pay_app/views/splash.dart';
import 'package:end_pay_app/views/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter extends InheritedWidget {
  final Color color;

  const AppRouter({
    super.key,
    required this.color,
    required super.child,
  });

  @override
  bool updateShouldNotify(AppRouter oldWidget) {
    return color != Colors.lightGreen;
  }

  static AppRouter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppRouter>();
  }
}

class RouterApp extends StatefulWidget {
  const RouterApp({super.key});

  @override
  RouterState createState() => RouterState();
}

class RouterState extends State<RouterApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }

  @override
  Widget build(BuildContext context) {
    return AppRouter(
        color: Colors.lightGreen,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Splash(),
            theme: ThemeData(
              brightness: Brightness.light,
              tabBarTheme: const TabBarTheme(
                  labelColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white), // color for text
                  indicator: UnderlineTabIndicator(
                      // color for indicator (underline)
                      borderSide: BorderSide(color: Colors.white))),
              primaryColor:
                  Colors.lightGreen, // outdated and has no effect to Tabbar
            ),
            routes: {
              '/account': (context) => Wellcome(),
              '/login': (context) => Login(),
              '/register': (context) => Register(),
              '/home': (context) => const Home(),
            }));
  }
}