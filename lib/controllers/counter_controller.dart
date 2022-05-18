import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _count = 1;

  int get count => _count;

  void increment() {
    _count++;
    debugPrint('Contador atual: $count');
    notifyListeners();
  }
}
