import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  int _activeIndex;

  int get activeIndex => _activeIndex;

  HomeModel() {
    _activeIndex = 0;
  }

  set activeIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }
}
