import 'package:hive/hive.dart';
import 'package:whats_list/src/model/item_list.dart';

class ListsReposirory {
  final String _boxName = "listsBox";

  Future<Box<ItemList>> get _box async =>
      await Hive.openBox<ItemList>(_boxName);

  Future<void> addList(ItemList itemList) async {
    var box = await _box;
    box.add(itemList);
  }

  Future<void> remover(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<List<ItemList>> listar() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<int> quantidadeIMCs() async {
    var box = await _box;
    return box.values.length;
  }
}
