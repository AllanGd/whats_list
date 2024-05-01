import 'package:flutter/material.dart';
import 'package:whats_list/src/model/item.dart';

class ItemList {
  final UniqueKey id = UniqueKey();
  final DateTime createDate;
  final List<Item> list;

  ItemList({List<Item>? items})
      : list = items ?? [],
        createDate = DateTime.now();
}
