import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/model/item_list.dart';
import 'package:whats_list/src/repository/lists_reposirory.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var listsRepository = Provider.of<ListsRepository>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Listas",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listsRepository.lists.length,
            itemBuilder: (context, index) {
              ItemList itemList = listsRepository.lists[index];
              return const ListTile(
                title: Text("Lista}"),
              );
            },
          ))
        ],
      ),
    );
  }
}
