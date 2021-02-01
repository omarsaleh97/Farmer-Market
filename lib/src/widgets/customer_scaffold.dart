import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/widgets/products_customer.dart';
import 'package:farmer_market/src/widgets/profile_customer.dart';
import 'package:farmer_market/src/widgets/shopping_bag.dart';
import 'package:flutter/cupertino.dart';

abstract class CustomerScaffold {
  static CupertinoTabScaffold get cupertinoTabScaffold {
    return CupertinoTabScaffold(
        tabBar: _cupertinoTabBar,
        tabBuilder: (context, index) {
          return _pageSelection(index);
        });
  }

  static get _cupertinoTabBar {
    return CupertinoTabBar(
      backgroundColor: AppColors.darkblue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.create), label: 'Products'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), label: 'Orders'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), label: 'Profile'),
      ],
    );
  }

  static Widget _pageSelection(int index) {
    if (index == 0) {
      return ProductCustomer();
    }

    if (index == 1) {
      return ShoppingBag();
    }

    return ProfileCustomer();
  }
}
