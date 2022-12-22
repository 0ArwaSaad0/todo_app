import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  var titleController = TextEditingController();
  var detailCoontroller = TextEditingController();

  int currentIndex = 0;
  nevgateTabs(index) {
    currentIndex = index;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String languageCode = 'en';
  changeLanguage(lang) {
    languageCode = lang;
    notifyListeners();
  }

  ThemeMode currentTheme = ThemeMode.light;
  changeTheme(ThemeMode theme) {
    currentTheme = theme;
    notifyListeners();
  }
}


