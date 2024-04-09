import 'package:flutter/material.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/widgets/my_appbar.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "WHATS LIST"),
      body: Column(children: [
        Container(
          color: SystemColors.secondary,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cole a lista recebida pelo WhasApp",
                      hintStyle:
                          const TextStyle(color: SystemColors.textPrimary),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.paste, color: SystemColors.primary))
              ],
            ),
          ),
        ),
      ]),
      backgroundColor: SystemColors.secondary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}