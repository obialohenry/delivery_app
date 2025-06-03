import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/models.dart';
import 'package:deliveryapp/src/view_models.dart';
import 'package:deliveryapp/utils/Alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeCartProvider = ref.watch(homeViewModel);
    final dashboardProvider = ref.watch(dashboardViewModel);
    return Scaffold(
      backgroundColor: AppColors.kSoftSnow,
      body: homeCartProvider.cart.isEmpty
          ? Center(
              child: TextView(
                text: "No item in cart",
                fontSize: 16.spMin,
                color: AppColors.kBlack,
                fontWeight: FontWeight.w700,
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      AccessoriesModel anAccessory = homeCartProvider.cart[index];
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
                              child: ImageView.asset(
                                AppImages.phoneIcon,
                                width: 100.w,
                                height: 100.h,
                              ),
                            ),
                            Gap(10.h),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text:
                                        "${anAccessory.name} ${anAccessory.descriptions[0]}|${anAccessory.descriptions[1]}",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.spMin,
                                    height: (20 / 12).h,
                                    color: AppColors.kGrey700,
                                    fontFamily: sfPro,
                                  ),
                                  Gap(3.h),
                                  TextView(
                                    text: "\$${anAccessory.price.toStringAsFixed(2)}",
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
                                          GestureDetector(
                                            onTap: () {
                                              homeCartProvider.decreaseAccessoryItemCount(index);
                                            },
                                            child: CircleAvatar(
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
                                          ),
                                          Gap(25.w),
                                          TextView(
                                            text: homeCartProvider.accessoryItemCount[index]
                                                .toString(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.spMin,
                                            height: (20 / 12).h,
                                            color: AppColors.kGrey700,
                                            fontFamily: sfPro,
                                          ),
                                          Gap(25.w),
                                          GestureDetector(
                                            onTap: () {
                                              homeCartProvider.increaseAccessoryItemCount(index);
                                            },
                                            child: CircleAvatar(
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
                                          ),
                                        ],
                                      ),

                                      GestureDetector(
                                        onTap: () {
                                          homeCartProvider.removeAccessoryFromCart(index);
                                        },
                                        child: CircleAvatar(
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
                    itemCount: homeCartProvider.cart.length,
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
                  OrderInfo(
                    title: subTotal,
                    detail: "\$${homeCartProvider.subTotalOfItemInCart()}",
                  ),
                  OrderInfo(title: shipping, detail: "\$10"),
                  OrderInfo(
                    title: total,
                    detail: "\$${homeCartProvider.subTotalOfItemInCart() + 10}",
                    isTotal: true,
                  ),
                  Gap(15.h),
                  DefaultButtonMain(
                    text: "Checkout (\$${homeCartProvider.subTotalOfItemInCart() + 10})",
                    onPressed: () {
                      checkoutAlertDialog(
                        context,
                        action: () {
                          dashboardProvider.setDashboardToHome();
                          homeCartProvider.clearCart();
                        },
                      );
                    },
                  ),
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
