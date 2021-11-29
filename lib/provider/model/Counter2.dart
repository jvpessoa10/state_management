import 'package:flutter/cupertino.dart';

class Counter2 with ChangeNotifier {
  int value;

  Counter2(this.value);

  increment() {
    value++;
    notifyListeners();
  }
}