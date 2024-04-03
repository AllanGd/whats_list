import 'package:flutter/material.dart';
import 'package:whats_list/model/item_status_enum.dart';

class Item {
  UniqueKey id = UniqueKey();
  String nome;
  ItemStatus status = ItemStatus.adicionado;

  Item({required this.nome});
}
