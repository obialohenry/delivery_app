import 'package:deliveryapp/src/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextView(text: "Welcome to Cart Screen.",fontSize: 18.spMin,fontWeight: FontWeight.bold,color: Colors.black,),
      ),
    );
  }
}