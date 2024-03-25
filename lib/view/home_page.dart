import 'package:flutter/material.dart';
import 'package:whats_list/utils/system_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WHATS LIST",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor: SystemColors.primary,
      ),
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
