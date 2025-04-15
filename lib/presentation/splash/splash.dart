import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran_app/core/resources/colors_manager.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes/routes_manger.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  void _navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onBording);
    });

    Timer(
      const Duration(seconds: 2),
      () {

      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: Image.asset(AssetsManager.splashLogo)),
          Expanded(flex: 1, child: Image.asset(AssetsManager.branding)),
        ],
      ),
    );
  }
}


