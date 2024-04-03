import 'package:flutter/material.dart';
import 'package:whats_list/model/item.dart';

class InitialPageViewModel extends ChangeNotifier {
  List<Item> _itens = [];

  List<Item> get itens => _itens;

  
}
