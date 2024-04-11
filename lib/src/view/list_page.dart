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
    List<Item> ItensList = Provider.of<ListPageViewModel>(context).listItens;
    return Scaffold(
      appBar: const MyAppBar(title: "WHATS LIST"),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: ItensList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(5),
                leading: ItensList[index].getIconStatus(),
                title: Text(ItensList[index].name),
                onTap: () => Provider.of<ListPageViewModel>(context,
                        listen: false)
                    .updateItemStatus(ItensList[index], ItemStatus.carrinho),
              );
            },
          ),
        )
      ]),
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
