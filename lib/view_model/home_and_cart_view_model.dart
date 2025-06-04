import 'package:deliveryapp/src/config.dart';
import 'package:deliveryapp/src/models.dart';
import 'package:deliveryapp/src/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  bool _iLoveThisAccessory = false;
  bool get iLoveThisAccessory => _iLoveThisAccessory;
  List<int> _accessoryItemCount = [];
  List<int> get accessoryItemCount => _accessoryItemCount;
  List<AccessoriesModel> _cart = [];
  List<AccessoriesModel> get cart => _cart;
  
  //Add an accessory to user cart.
  void addAccessoryToCart(AccessoriesModel item) {
    _cart.add(item);
    _accessoryItemCount.add(1);
    notifyListeners();
    showToast(msg: "${item.name} added to cart", isError: false);
  }

  //remove an already added accessory from user cart.
  void removeAccessoryFromCart(int index) {
    showToast(msg: "${_cart[index].name} removed from cart", isError: true);
    _cart.removeAt(index);
    _accessoryItemCount.removeAt(index);
    notifyListeners();
  }

  //Increase number of an item awaiting checkout.
  void increaseAccessoryItemCount(int index) {
    _accessoryItemCount[index] += 1;
    notifyListeners();
  }

  //Decrease number of an item awaiting checkout.
  void decreaseAccessoryItemCount(int index) {
    if (_accessoryItemCount[index] > 1) {
      _accessoryItemCount[index] -= 1;
    }
    notifyListeners();
  }

  void toggleILoveThisAccessory() {
    _iLoveThisAccessory = !_iLoveThisAccessory;
    notifyListeners();
  }

  //return the total of every item in count minus shipping fee as a whole number.
  int subTotalOfItemInCart() {
    double subTotal = 0;
    for (int i = 0; i < _cart.length; i++) {
      if (_accessoryItemCount[i] > 1) {
        double item = (_cart[i].price * _accessoryItemCount[i]);
        subTotal += item;
      } else {
        subTotal += _cart[i].price;
      }
    }

    return subTotal.round();
  }

  //clear a user cart after a successful shopping
  void clearCart() {
    _cart = [];
    _accessoryItemCount = [];
    _iLoveThisAccessory = false;
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
