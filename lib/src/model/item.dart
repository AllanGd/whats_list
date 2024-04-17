import 'package:flutter/material.dart';

enum ItemStatus { listado, carrinho, emFalta }

class Item {
  final UniqueKey _id = UniqueKey();
  final String _name;
  ItemStatus _status = ItemStatus.listado;

  Item({required String name}) : _name = name;

  String get name => _name;

  set itemStatus(ItemStatus status) {
    _status = status;
  }

  ItemStatus get status => _status;
  Icon getIconStatus() {
    switch (_status) {
      case ItemStatus.listado:
        return const Icon(
          Icons.check_box_outline_blank,
          // color: Colors.grey,
        );
      case ItemStatus.carrinho:
        return const Icon(
          Icons.shopping_cart,
          // color: Colors.green,
        );
      case ItemStatus.emFalta:
        return const Icon(
          Icons.cancel,
          // color: Colors.red,
        );
    }
  }
}
