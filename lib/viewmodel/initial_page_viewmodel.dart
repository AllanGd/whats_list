import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whats_list/model/item.dart';

class InitialPageViewModel extends ChangeNotifier {
  final List<Item> _itens = [];
  String _clipboardText = "";

  List<Item> get itens => _itens;
  String get clipBoardText => _clipboardText;

  void addItem(String itemName) {
    final item = Item(name: itemName);
    _itens.add(item);
    notifyListeners();
  }

  void updateItemStatus(Item item, ItemStatus status) {
    item.itemStatus = status;
    notifyListeners();
  }

  void deleteItem(Item item) {
    _itens.remove(item);
    notifyListeners();
  }

  void paste() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    _clipboardText = clipboardData?.text ?? "Texto não encontrado";
    notifyListeners();
  }
}
