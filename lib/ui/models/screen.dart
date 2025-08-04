import 'package:flutter/material.dart';

class Screen {
  final String title;
  final NavigationDestination destination;
  final Widget screen;
  final bool isLabelVisible;

  Screen({
    required this.title,
    required Icon icon,
    required this.screen,
    Icon? selectedIcon,
    this.isLabelVisible = false,
  }) : destination = NavigationDestination(
         icon: Badge(isLabelVisible: isLabelVisible, child: icon),
         label: title,
         selectedIcon: Badge(
           isLabelVisible: isLabelVisible,
           child: selectedIcon,
         ),
       );
}
