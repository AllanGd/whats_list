import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whats_list/src/model/item_list.dart';

class ListsRepository with ChangeNotifier {
  final String _boxName = "listsBox";
  Box<ItemList>? _box;

  Future<Box<ItemList>> get _openBox async {
    _box ??= await Hive.openBox<ItemList>(_boxName);
    return _box!;
  }

  Future<void> addList(ItemList itemList) async {
    var box = await _openBox;
    box.add(itemList);
    notifyListeners();
  }

  Future<void> updateList(int index, ItemList itemList) async {
    var box = await _openBox;
    box.putAt(index, itemList);
    notifyListeners();
  }

  Future<void> removeList(int index) async {
    var box = await _openBox;
    await box.deleteAt(index);
    notifyListeners();
  }

  Future<List<ItemList>> listAll() async {
    var box = await _openBox;
    return box.values.toList();
  }

  Future<int> itemCount() async {
    var box = await _openBox;
    return box.length;
  }

  List<ItemList> get lists => _box?.values.toList() ?? [];
}
