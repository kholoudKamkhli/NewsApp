import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view/home_view.dart';

class SplashView extends StatefulWidget{
  static const String routeName = "splashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeView())));
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset("assets/images/pattern.png",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: Image.asset("assets/images/logo.png"),
        )
      ],
    );
  }
}