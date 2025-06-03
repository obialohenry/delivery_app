import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSoftSnow,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 132.h,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.kLavenderHaze,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ImageView.asset(AppImages.phoneIcon, width: 100.w, height: 100.h),
                      ),
                      Gap(10.h),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: "Apple iPhone 16 128GB|Teal",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.spMin,
                              height: (20 / 12).h,
                              color: AppColors.kGrey700,
                              fontFamily: sfPro,
                            ),
                            Gap(3.h),
                            TextView(
                              text: "\$700.00",
                              fontWeight: FontWeight.w600,
                              fontSize: 17.spMin,
                              height: (32 / 17).h,
                              color: AppColors.kGrey700,
                              fontFamily: sfPro,
                            ),
                            Gap(3.h),
                            TextView(
                              text: "In stock",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.spMin,
                              height: (16 / 12).h,
                              color: AppColors.kSuccess500,
                              fontFamily: sfPro,
                            ),
                            Gap(3.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18.r,
                                      backgroundColor: AppColors.kGrey200,
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: AppColors.kGrey500,
                                          size: 18.spMin,
                                        ),
                                      ),
                                    ),
                                    Gap(25.w),
                                    TextView(
                                      text: "0",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.spMin,
                                      height: (20 / 12).h,
                                      color: AppColors.kGrey700,
                                      fontFamily: sfPro,
                                    ),
                                    Gap(25.w),
                                    CircleAvatar(
                                      radius: 18.r,
                                      backgroundColor: AppColors.kWhite,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.kGrey500,
                                          size: 18.spMin,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor: AppColors.kWhite,
                                  child: Center(
                                    child: ImageView.asset(
                                      AppImages.deleteIcon,
                                      width: 19.w,
                                      height: 19.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
            Gap(12.h),
            TextView(
              text: orderInfo,
              fontSize: 14.spMin,
              fontWeight: FontWeight.w700,
              height: (20 / 14).h,
              color: AppColors.kBlack,
            ),
            Gap(10.h),
            OrderInfo(title: subTotal, detail: "\$2100"),
            OrderInfo(title: shipping, detail: "\$10"),
            OrderInfo(title: total, detail: "\$2100", isTotal: true),
            Gap(15.h),
            DefaultButtonMain(text: "Checkout (\$2110)"),
          ],
        ),
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.title, required this.detail, this.isTotal = false});
  final String title;
  final String detail;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 12.spMin,
            height: (20 / 12).h,
            color: AppColors.kBlack,
          ),
          TextView(
            text: detail,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            fontSize: 12.spMin,
            height: (20 / 12).h,
            color: AppColors.kBlack,
          ),
        ],
      ),
    );
  }
}
