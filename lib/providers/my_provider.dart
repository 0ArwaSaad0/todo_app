import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  int currentIndex = 0;
  nevgateTabs(index) {
    currentIndex = index;
    notifyListeners();
  }
}
