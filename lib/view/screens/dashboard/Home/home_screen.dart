import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/models.dart';
import 'package:deliveryapp/src/screens.dart';
import 'package:deliveryapp/src/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor: AppColors.kSoftSnow,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: smartPhonesAndAccessories,
              fontSize: 18.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.kBlack,
              maxLines: 2,
            ),
            Gap(10.h),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 234.h,
                mainAxisSpacing: 10.h,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeProvider.accessories.length,
              itemBuilder: (context, index) {
                AccessoriesModel anAccessory = homeProvider.accessories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnAccessoryDetailsScreen(
                          name: anAccessory.name,
                          price: anAccessory.price,
                          image: anAccessory.image,
                          detail1: anAccessory.descriptions[0],
                          detail2: anAccessory.descriptions[1],
                          accessory: anAccessory,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 162.w,
                        height: 162.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.62.r),
                          color: AppColors.kLavenderMist,
                        ),
                        child: ImageView.asset(
                          anAccessory.image,
                          //  width: 100.w,
                          //  height: 100.h,
                        ),
                      ),
                      Gap(3.h),
                      TextView(
                        text: anAccessory.name,
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlack,
                      ),
                      TextView(
                        text: "${anAccessory.descriptions[0]}|${anAccessory.descriptions[1]}",
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlack,
                      ),
                      Gap(3.h),
                      TextView(
                        text: "\$${anAccessory.price.toStringAsFixed(2)}",
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w700,
                        color: AppColors.kBlack,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
