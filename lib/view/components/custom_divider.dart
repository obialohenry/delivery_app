import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    // ref.watch(themeViewModel);
    // ThemeData theme = Theme.of(context);
    return SizedBox(
      width: double.infinity.w,
      child: Divider(
        color: color,
        thickness: 1.h,
      ),
    );
  }
}
