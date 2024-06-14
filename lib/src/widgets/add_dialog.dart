import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/viewmodel/list_page_viewmodel.dart';

class CustomAddDialog extends StatelessWidget {
  final TextEditingController itemNameController;

  const CustomAddDialog({super.key, required this.itemNameController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Adicionar item", textAlign: TextAlign.center),
      content: Form(
        child: TextFormField(
          controller: itemNameController,
          decoration: const InputDecoration(hintText: "Escreva aqui"),
        ),
      ),
      actions: [
        FilledButton.tonal(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(SystemColors.primary),
          ),
          onPressed: () {
            context.read<ListPageViewModel>().addItem(itemNameController.text);
            Navigator.of(context).pop();
          },
          child: const Text("Adicionar"),
        ),
        FilledButton.tonal(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red.shade200),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancelar"),
        ),
      ],
    );
  }
}

Future<dynamic> showAddDialog(BuildContext context) {
  final TextEditingController itemName = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => CustomAddDialog(
      itemNameController: itemName,
    ),
  );
}
