import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(this.size, {super.key});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size?.spMin ?? 10.spMin,
    );
  }
}