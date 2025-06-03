
import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';


class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.info});
  final List<dynamic>? info;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: info!.map<Widget>((propertyAmenty) {
        return SizedBox( height: 80.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: "\u2022",
                fontWeight: FontWeight.w400, fontSize: 14.spMin,
                height: 1.5,
                color: AppColors.kSlateGrey,
              ),
              Gap(5.w),
              Expanded(
                child: TextView(
                  text: propertyAmenty,
                  fontWeight: FontWeight.w400, fontSize: 14.spMin,
                  color: AppColors.kSlateGrey,
                  maxLines: 7,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}