import 'package:flutter/material.dart';
import 'package:whats_list/controller/clipboard_controller.dart';
import 'package:whats_list/utils/system_colors.dart';
import 'package:whats_list/widgets/my_appbar.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String clipboardText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: ""),
      drawer: const Drawer(child: Text("deu certo")),
      // backgroundColor: SystemColors.primary,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
              SystemColors.primary,
              SystemColors.primary.withOpacity(0.7),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WHATS LIST",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    color: SystemColors.secondary,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "Cole a lista recebida pelo WhasApp",
                        hintStyle: TextStyle(
                            color: SystemColors.textSecondary,
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 8)),
                  )),
                  IconButton(
                      onPressed: () async {
                        clipboardText = await ClipboardController.paste();
                        setState(() {});
                      },
                      icon: const Icon(Icons.paste_rounded))
                ]),
              ),
              Text(clipboardText),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: SystemColors.primary),
                  onPressed: () {},
                  child: const Text(
                    "Listar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
