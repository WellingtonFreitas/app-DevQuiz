
import 'package:dev_quiz/Home/home_page.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds : 2)).then((value) => 
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage() )
        ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ) 
      ),
    );
  }
}