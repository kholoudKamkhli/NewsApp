import 'package:flutter/material.dart';
import 'package:news_app/style/theme.dart';
import 'package:news_app/view/home_view.dart';
import 'package:news_app/view/splash_view.dart';

import 'news/search_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.routeName:(_)=>HomeView(),
        SplashView.routeName:(_)=>SplashView(),
        SearchScreen.routeName:(_)=>SearchScreen(),
      },
      initialRoute: SplashView.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
