import 'package:flutter/material.dart';
import 'package:whats_list/src/model/item.dart';

class ListPageViewModel extends ChangeNotifier {
  final List<Item> _itensList = [];

  List<Item> get listItens => _itensList;

  void addListItens(List<Item> list) {
    _itensList.clear();
    _itensList.addAll(list);
  }

  void addItem(String itemName) {
    final item = Item(name: itemName);
    _itensList.add(item);
    sortItesList();
    notifyListeners();
  }

  List<Item> itensListadosList() {
    return listItens.where((element) => element.status==ItemStatus.listado).toList();
  }

  void updateItemStatus(Item item, ItemStatus status) {
    item.itemStatus = status;
    sortItesList();
    notifyListeners();
  }

  void deleteItem(Item item) {
    _itensList.remove(item);
    notifyListeners();
  }

  void sortItesList() {
    _itensList.sort((a, b) => a.status.index.compareTo(b.status.index));
  }
}
