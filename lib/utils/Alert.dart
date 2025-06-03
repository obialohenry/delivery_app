
import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

Future<dynamic> checkoutAlertDialog(context, {VoidCallback? action}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: "Thanks for shopping at the store🥳",
              fontSize: 14.spMin,
              color: AppColors.kBlack,
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.bottomRight,
            child: DefaultButtonMain(
              text: "shop again",
              color: AppColors.kWhite,
              fontSize: 16.spMin,
              width: 100.w,
              borderColor: AppColors.kSkylineBlue,
              textColor: AppColors.kBlack,
              onPressed: () {
                Navigator.pop(context);
                action!.call();
              },
            ),
          ),
        ],
      );
    },
  );
}
