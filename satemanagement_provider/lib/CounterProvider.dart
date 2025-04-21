import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int getCount() => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void DecrementCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
