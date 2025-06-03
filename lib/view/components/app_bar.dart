import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar(
    BuildContext context, {
    bool showSearchWidget = false,
    Widget? searchWidget,
   String? title,
  }) {
  
    return PreferredSize(
      preferredSize: Size(0,showSearchWidget? 205.h:135.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(color: AppColors.kWhite,border: Border.symmetric(horizontal: BorderSide(color: AppColors.kMistBlue))),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 TextView(text: "LOGO",fontSize: 16.spMin,color: AppColors.kSkylineBlue,fontWeight: FontWeight.w500,),
                 SizedBox(height: 60.h,child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(text: "DELIVERY ADDRESS",fontSize: 10.spMin,fontWeight: FontWeight.w600,height: (28/10).h,color: AppColors.kGrey700,),
                    TextView(text: "Umuezike Road, Oyo State",fontSize: 12.spMin,fontWeight: FontWeight.w600,height: (28/10).h,color: AppColors.kGrey700,)
                  ],
                 ),),
                 ImageView.asset(AppImages.notifsIcon,width: 19.w,height: 20.h,),
                ],
              ),
            ),
            showSearchWidget?Column(
              children: [
                Gap(8.h),
                searchWidget!
              ],
            )
            :SizedBox.shrink(),
Gap(8.h),
            CustomDivider(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(width: 116.w,child: Row(
              
                            children: [
                Image.asset(AppImages.arrowBackIcon,width: 8.w,height: 8.h,color: AppColors.kGrey500,),
                Gap(10.w),
                TextView(text: title!,fontSize: 18.spMin,fontWeight: FontWeight.w700,color: AppColors.kBlack,)
              ],
              ),),
            )
          ],
        ),
      ),
    );
  }
}


