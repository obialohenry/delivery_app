import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModel = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  final List<Widget> _screens = [HomeScreen(), CartScreen(), FavoritesScreen(), ProfileScreen()];
  List<Widget> get screens => _screens;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ///Update the private [currentIndex] field to whatever the argument is,thus switching between Dashboard screens.
  void switchToScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ///Method changing Dashboard screen title.
  String screenTitle(int index) {
    switch (index) {
      case 0:
        return technology;
      case 1:
        return yourCart;
      case 2:
        return favorites;
      case 3:
        return profile;
      default:
        return "";
    }
  }
  
  //return a boolean value based on the argument index.
  bool showSearchTextfieldInDashboardScreen(int index) {
    switch (index) {
      case 0:
        return true;
      case 1:
        return false;
      case 2:
        return false;
      case 3:
        return false;
      default:
        return false;
    }
  }
}
