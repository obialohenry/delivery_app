import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/models.dart';
import 'package:deliveryapp/src/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnAccessoryDetailsScreen extends ConsumerStatefulWidget {
  const AnAccessoryDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.detail1,
    required this.detail2,
    required this.price,
    required this.accessory,
  });
  final String image;
  final String name;
  final double price;
  final String detail1;
  final String detail2;
  final AccessoriesModel accessory;
  @override
  ConsumerState<AnAccessoryDetailsScreen> createState() => _AnAccessoryDetailsScreenState();
}

class _AnAccessoryDetailsScreenState extends ConsumerState<AnAccessoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeViewModel);
    return Scaffold(
      appBar: AppBars.mainAppBar(context, title: goBack),
      backgroundColor: AppColors.kSoftSnow,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              height: 331.6.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.kLavenderMist,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: homeProvider.toggleILoveThisAccessory,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Center(
                          child: homeProvider.iLoveThisAccessory
                              ? ImageView.asset(
                                  AppImages.pinkFavoriteIcon,
                                  width: 24.w,
                                  height: 24.h,
                                )
                              : ImageView.asset(AppImages.favoritesIcon, width: 24.w, height: 24.h),
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  ImageView.asset(widget.image, height: 230.h),
                ],
              ),
            ),
            Gap(10.h),
            TextView(
              text: "${widget.name} ${widget.detail1}|${widget.detail2}",
              fontWeight: FontWeight.w400,
              fontSize: 17.spMin,
              color: AppColors.kBlack,
            ),
            Gap(12.h),
            TextView(
              text: "\$${widget.price.toStringAsFixed(2)}",
              fontWeight: FontWeight.w700,
              fontSize: 32.75.spMin,
              color: AppColors.kBlack,
            ),
            Gap(20.h),
            TextView(
              text: aboutThisItem,
              fontWeight: FontWeight.w400,
              fontSize: 14.spMin,
              color: AppColors.kSlateGrey,
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10.w),
              child: BulletList(info: [firstAccessoryInfo, secondAccessoryInfo]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 94.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.symmetric(horizontal: BorderSide(color: AppColors.kMistBlue)),
        ),
        child: Column(
          children: [
            DefaultButtonMain(
              text: addToCart,
              onPressed: () {
                homeProvider.addAccessoryToCart(widget.accessory);
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
