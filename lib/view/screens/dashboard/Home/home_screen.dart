
import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSoftSnow,
      body: Center(
        child: TextView(text: "Welcome to Home Screen.",fontSize: 18.spMin,fontWeight: FontWeight.bold,color: Colors.black,),
      ),
    );
  }
}