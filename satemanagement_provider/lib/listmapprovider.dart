import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mydata = [];
  void addData(Map<String, dynamic> data) {
    _mydata.add(data);
    notifyListeners();
  }

  List<Map<String, dynamic>> getdata() => _mydata;
}
