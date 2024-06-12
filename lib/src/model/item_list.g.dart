// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemListAdapter extends TypeAdapter<ItemList> {
  @override
  final int typeId = 1;

  @override
  ItemList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    // ignore: unused_local_variable
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemList();
  }

  @override
  void write(BinaryWriter writer, ItemList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj._createDate)
      ..writeByte(2)
      ..write(obj._list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
