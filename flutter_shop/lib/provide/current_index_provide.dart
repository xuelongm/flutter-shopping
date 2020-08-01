import 'package:flutter/material.dart';
import 'package:provide/provide.dart';


class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(newIndex) {
    this.currentIndex = newIndex;
    // 通知消息
    this.notifyListeners();
  }

}
