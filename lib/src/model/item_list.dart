import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:whats_list/src/model/item.dart';

part 'item_list.g.dart';

@HiveType(typeId: 1)
class ItemList {
  @HiveField(0)
  final UniqueKey id = UniqueKey();

  @HiveField(1)
  final DateTime _createDate;

  @HiveField(2)
  final List<Item> _list;

  ItemList({List<Item>? items})
      : _list = items ?? [],
        _createDate = DateTime.now();

  List<Item> get list => _list;

  String createDate() {
    return DateFormat('dd/MM/yyyy - kk:mm').format(_createDate);
  }

  void addListItens(List<Item> itemList) {
    _list.clear();
    _list.addAll(itemList);
  }

  void addItem(String itemName) {
    final item = Item(name: itemName);
    _list.add(item);
    sortItemList();
  }

  List<Item> itensListadosList() {
    return _list
        .where((element) => element.status == ItemStatus.listado)
        .toList();
  }

  void updateItemStatus(Item item, ItemStatus status) {
    item.updateStatus = status;
    sortItemList();
  }

  void deleteItem(Item item) {
    _list.remove(item);
  }

  void sortItemList() {
    _list.sort((a, b) => a.status.index.compareTo(b.status.index));
  }
}
