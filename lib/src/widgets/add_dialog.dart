import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/viewmodel/list_page_viewmodel.dart';

Future<dynamic> showAddDialog(BuildContext context) {
  TextEditingController itemName = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Adicionar item", textAlign: TextAlign.center),
      content: Form(
          child: TextFormField(
        controller: itemName,
        decoration: const InputDecoration(hintText: "Escreva aqui"),
      )),
      actions: [
        FilledButton.tonal(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(SystemColors.primary)),
            onPressed: () {
              Provider.of<ListPageViewModel>(context, listen: false)
                  .addItem(itemName.text);
              Navigator.of(context).pop();
            },
            child: const Text("Adicionar")),
        FilledButton.tonal(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red.shade200)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"))
      ],
    ),
  );
}
