import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5))
        .then((value) => Get.offAllNamed('/login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 251, 253, 1),
      body: Center(
        child: Image.asset("assets/images/ezgif.com-video-to-gif.gif"),
      ),
    );
  }
}
