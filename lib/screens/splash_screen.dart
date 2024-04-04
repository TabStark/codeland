import 'dart:async';

import 'package:codeland/AppTheme/app_color.dart';
import 'package:codeland/main.dart';
import 'package:codeland/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mq.height * 1,
        width: mq.width * 1,
        color: AppColor().orange,
        child: Center(
          child: Container(
            height: mq.height * .45,
            width: mq.width * .7,
            decoration: BoxDecoration(
                color: AppColor().white,
                borderRadius: BorderRadius.circular(70),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 10.0)),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: mq.height * .25,
                  width: mq.width * .7,
                  child: Image.asset('assets/images/logo 1.png'),
                ),
                Container(
                  height: mq.height * .1,
                  width: mq.width * .4,
                  child: Image.asset(
                    'assets/images/logo 2.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
