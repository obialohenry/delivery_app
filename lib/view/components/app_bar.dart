import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar(
    BuildContext context, {
    bool showSearchWidget = false,
    String? title,
    TextEditingController? controller,
  }) {
    return PreferredSize(
      preferredSize: Size(0, showSearchWidget ? 180.h : 135.h),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            border: Border.symmetric(horizontal: BorderSide(color: AppColors.kMistBlue)),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: "LOGO",
                      fontSize: 16.spMin,
                      color: AppColors.kSkylineBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: "DELIVERY ADDRESS",
                            fontSize: 10.spMin,
                            fontWeight: FontWeight.w600,
                            height: (28 / 10).h,
                            color: AppColors.kGrey700,
                          ),
                          TextView(
                            text: "Umuezike Road, Oyo State",
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w600,
                            height: (28 / 10).h,
                            color: AppColors.kGrey700,
                          ),
                        ],
                      ),
                    ),
                    ImageView.asset(AppImages.notifsIcon, width: 19.w, height: 20.h),
                  ],
                ),
              ),
              showSearchWidget
                  ? Column(
                      children: [
                        Gap(8.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 36.h,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: AppColors.kGrey200),
                          ),
                          child: TextFormField(
                            onChanged: (value) {},

                            controller: controller,
                            style: TextStyle(
                              color: AppColors.kBlack,
                              fontWeight: FontWeight.w400,
                              fontFamily: ibmPlexSans,
                              fontSize: 14.spMin,
                            ),
                            keyboardType: TextInputType.text,
                            readOnly: false,
                            enabled: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              //  label:
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: BorderSide(color: AppColors.kGrey200),
                              ),
                              hintText: "Search...",
                              hintStyle: TextStyle(
                                color: AppColors.kGrey300,
                                fontFamily: ibmPlexSans,
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w400,
                                height: (20 / 14).h,
                              ),
                              prefixIcon: ImageView.asset(AppImages.searchIcon, scale: 4.0),
                              filled: false,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: const BorderSide(color: AppColors.kGrey200),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              Gap(8.h),
              CustomDivider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  width: 116.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.arrowBackIcon,
                          width: 8.w,
                          height: 8.h,
                          color: AppColors.kGrey500,
                        ),
                        Gap(10.w),
                        TextView(
                          text: title!,
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
