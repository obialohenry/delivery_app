import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  bool _iLoveThisAccessory = false;
  bool get iLoveThisAccessory => _iLoveThisAccessory;

  void toggleILoveThisAccessory() {
    _iLoveThisAccessory = !_iLoveThisAccessory;
    notifyListeners();
  }

  //List of Accessories in my store.
  final List<AccessoriesModel> _accessories = [
    AccessoriesModel(
      name: "Apple iPhone 16",
      descriptions: ["128GB", "Teal"],
      price: 700.00,
      image: AppImages.phoneIcon,
    ),
    AccessoriesModel(
      name: "M4 Macbook Air 13”",
      descriptions: ["256GB", "Sky blue"],
      price: 1000.00,
      image: AppImages.laptopIcon,
    ),
    AccessoriesModel(
      name: "Google Pixel 9A",
      descriptions: ["128GB", "Iris"],
      price: 499.00,
      image: AppImages.googlePhoneIcon,
    ),
    AccessoriesModel(
      name: "Apple Airpods 4",
      descriptions: ["Active Noise Cancellation", "Teal"],
      price: 129.00,
      image: AppImages.earpudIcon,
    ),
  ];

  List<AccessoriesModel> get accessories => _accessories;
}
