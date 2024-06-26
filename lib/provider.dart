import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {
  List _data = [];

  List get data => _data;

  fetchData(newData) {
    _data = newData;
    notifyListeners();
  }
}
