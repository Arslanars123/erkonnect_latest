import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(()=>const OnBoarding());
    },);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      
      
      body: SafeArea(
        child: Center(child: Image.asset("img/app_logo.png",height: Get.height*0.25,)),
      ),
      
    );
  }
}
