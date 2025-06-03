import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dashboardProvider = ref.watch(dashboardViewModel);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.mainAppBar(
          context,
          title: dashboardProvider.screenTitle(dashboardProvider.currentIndex),
          showSearchWidget: dashboardProvider.showSearchTextfieldInDashboardScreen(
            dashboardProvider.currentIndex,
          ),
          controller: _controller,
        ),
        body: dashboardProvider.screens[dashboardProvider.currentIndex],
        backgroundColor: AppColors.kSoftSnow,
        bottomNavigationBar: SizedBox(
          height: 90.h,
          child: BottomNavigationBar(
            backgroundColor: AppColors.kEtherealWhite,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.kSkylineBlue,
            unselectedItemColor: AppColors.kTwilightCharcoal,
            selectedLabelStyle: TextStyle(
              fontFamily: ibmPlexSans,
              fontWeight: FontWeight.w600,
              fontSize: 12.spMin,
              height: (16 / 12).h,
              letterSpacing: 0.5.w,
              color: AppColors.kSkylineBlue,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: ibmPlexSans,
              fontWeight: FontWeight.w500,
              fontSize: 12.spMin,
              height: (16 / 12).h,
              letterSpacing: 0.5.w,
              color: AppColors.kTwilightCharcoal,
            ),
            onTap: (value) => dashboardProvider.switchToScreen(value),
            currentIndex: dashboardProvider.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 8.0.h),
                  child: ImageView.asset(AppImages.homeIcon, height: 24.h, width: 24.w),
                ),
                label: home,
                backgroundColor: AppColors.kEtherealWhite,
                activeIcon: NavBarActiveIconItem(iconImage: AppImages.homeIcon),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 8.0.h),
                  child: ImageView.asset(AppImages.cartIcon, height: 24.h, width: 24.w),
                ),
                label: cart,
                backgroundColor: AppColors.kEtherealWhite,
                activeIcon: NavBarActiveIconItem(iconImage: AppImages.cartIcon),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 8.0.h),
                  child: ImageView.asset(AppImages.favoritesIcon, height: 24.h, width: 24.w),
                ),
                label: favorites,
                backgroundColor: AppColors.kEtherealWhite,
                activeIcon: NavBarActiveIconItem(iconImage: AppImages.favoritesIcon),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 8.0.h),
                  child: ImageView.asset(AppImages.profileIcon, height: 24.h, width: 24.w),
                ),
                label: profile,
                backgroundColor: AppColors.kEtherealWhite,
                activeIcon: NavBarActiveIconItem(iconImage: AppImages.profileIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarActiveIconItem extends StatelessWidget {
  const NavBarActiveIconItem({super.key, required this.iconImage});
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 8.0.h),
      height: 32.h,
      width: 56.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.kSkylineBlue,
      ),
      child: ImageView.asset(iconImage, height: 24.h, width: 24.w, color: AppColors.kWhite),
    );
  }
}
