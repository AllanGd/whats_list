import 'package:flutter/material.dart';

enum ItemStatus {
  adicionado,
  comprado,
  emFalta
}
class Item {
  final UniqueKey _id = UniqueKey();
  final String _name;
  ItemStatus _status = ItemStatus.adicionado;

  Item({required String name}) : _name = name;

  set itemStatus(ItemStatus status) {
    _status = status;
  }
}
