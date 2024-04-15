import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/model/item.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/viewmodel/list_page_viewmodel.dart';
import 'package:whats_list/src/widgets/AddDialog.dart';
import 'package:whats_list/src/widgets/my_appbar.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.listItem});
  final List<Item> listItem;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListPageViewModel>(context, listen: false)
        .addListItens(widget.listItem);
  }

  @override
  Widget build(BuildContext context) {
    List<Item> itensList =
        Provider.of<ListPageViewModel>(context).itensListadosList();
    return Scaffold(
      appBar: const MyAppBar(title: "WHATS LIST"),
      body: Container(
        color: SystemColors.primary.withOpacity(0.1),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: itensList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: itensList[index].getIconStatus(),
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
                          onTap: () => Provider.of<ListPageViewModel>(context,
                                  listen: false)
                              .updateItemStatus(
                                  itensList[index], ItemStatus.emFalta),
                        ),
                        PopupMenuItem(
                          child: const ListTile(
                              leading: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              title: Text("Deletar Item")),
                          onTap: () => Provider.of<ListPageViewModel>(context,
                                  listen: false)
                              .deleteItem(itensList[index]),
                        )
                      ],
                    ),
                    title: Text(itensList[index].name),
                    onTap: () =>
                        Provider.of<ListPageViewModel>(context, listen: false)
                            .updateItemStatus(
                                itensList[index], ItemStatus.carrinho),
                  ),
                );
              },
            ),
          )
        ]),
      ),
      backgroundColor: SystemColors.secondary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
