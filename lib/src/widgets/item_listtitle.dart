import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/model/item.dart';
import 'package:whats_list/src/viewmodel/list_page_viewmodel.dart';

class ItemListTitle extends StatelessWidget {
  const ItemListTitle({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: switch (item.status) {
        ItemStatus.carrinho => Colors.green.shade100,
        ItemStatus.emFalta => Colors.red.shade100,
        ItemStatus.listado => null,
      },
      leading: item.getIconStatus(),
      // ignore: prefer_const_constructors
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: Text("Item em falta")),
            onTap: () => Provider.of<ListPageViewModel>(context, listen: false)
                .updateItemStatus(item, ItemStatus.emFalta),
          ),
          PopupMenuItem(
            child: const ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                title: Text("Deletar Item")),
            onTap: () => Provider.of<ListPageViewModel>(context, listen: false)
                .deleteItem(item),
          )
        ],
      ),
      title: Text(item.name),
      onTap: () => Provider.of<ListPageViewModel>(context, listen: false)
          .updateItemStatus(item, ItemStatus.carrinho),
    );
  }
}
