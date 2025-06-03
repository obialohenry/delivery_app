import 'package:deliveryapp/src/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModel = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  final List<Widget> _screens = [HomeScreen(), CartScreen(), FavoritesScreen(), ProfileScreen()];
  List<Widget> get screens => _screens;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void switchToScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
