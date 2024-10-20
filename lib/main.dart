import 'package:catalog/pages/cart_page.dart';

import 'package:flutter/material.dart';

import 'package:catalog/pages/home_page.dart';

import 'package:catalog/pages/login_page.dart';

import 'package:catalog/utils/routes.dart';

import 'package:catalog/widgets/themes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute:  MyRoutes.homeRoute,
      routes: {

        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}