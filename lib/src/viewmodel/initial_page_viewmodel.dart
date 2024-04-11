import 'package:flutter/material.dart';
import 'package:whats_list/src/model/item.dart';
import 'package:whats_list/src/utils/clipboard.dart';

class InitialPageViewModel extends ChangeNotifier {
  List<Item> _itens = [];
  String _clipboardText = "";

  List<Item> get itens => _itens;
  String get clipBoardText => _clipboardText;

  bool clipBoardTextIsNull() {
    return _clipboardText == "";
  }

  void clear() {
    _clipboardText = "";
    _itens.clear();
    notifyListeners();
  }

  void clipboardTextConvert() async {
    _clipboardText = await ClipboardService().paste();
    listConvert();
    notifyListeners();
  }

  void listConvert() {
    _itens = _clipboardText
        .split('\n')
        .map((nomeItem) => Item(name: nomeItem))
        .toList();
  }
}
