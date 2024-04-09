import 'package:flutter/material.dart';
import 'package:whats_list/src/model/item.dart';

class ListPageViewModel extends ChangeNotifier {
  final List<Item> _listItens = [];

  List<Item> get listItens => _listItens;

  void addListItens(List<Item> list) {
    _listItens.addAll(list);
    notifyListeners();
  }
}
