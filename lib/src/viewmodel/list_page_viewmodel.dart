import 'package:flutter/material.dart';
import 'package:whats_list/src/model/item.dart';
import 'package:whats_list/src/model/item_list.dart';

class ListPageViewModel extends ChangeNotifier {
  final ItemList _itensList = ItemList();

  List<Item> get listItens => _itensList.list;

  String dateTime() {
    return _itensList.createDate();
  }

  void addListItens(List<Item> list) {
    _itensList.list.clear();
    _itensList.list.addAll(list);
  }

  void addItem(String itemName) {
    final item = Item(name: itemName);
    _itensList.list.add(item);
    sortItemList();
    notifyListeners();
  }

  List<Item> itensListadosList() {
    return listItens
        .where((element) => element.status == ItemStatus.listado)
        .toList();
  }

  void updateItemStatus(Item item, ItemStatus status) {
    item.updateStatus = status;
    sortItemList();
    notifyListeners();
  }

  void deleteItem(Item item) {
    _itensList.list.remove(item);
    notifyListeners();
  }

  void sortItemList() {
    _itensList.list.sort((a, b) => a.status.index.compareTo(b.status.index));
  }
}
