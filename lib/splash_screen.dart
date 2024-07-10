import 'dart:async';

import 'package:covid_app/world_statistics.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const WorldStatistics())));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('assets/virus.json',width: 200,height: 200,fit: BoxFit.fill,frameRate: FrameRate.max)),
          const Center(child: Text('  COVID-19\nTracker App',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
