import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/viewmodel/initial_page_viewmodel.dart';
import 'package:whats_list/src/widgets/my_appbar.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});
  final TextEditingController _copyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final copyText = Provider.of<InitialPageViewModel>(context);
    _copyTextController.text = copyText.clipBoardText;

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
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                    shadows: <Shadow>[
                      Shadow(
                          color: SystemColors.textPrimary, offset: Offset(2, 2))
                    ]),
              ),
              const SizedBox(
                height: 46,
              ),
              Container(
                decoration: BoxDecoration(
                    color: SystemColors.secondary,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  Expanded(child: Consumer<InitialPageViewModel>(
                    builder: (context, value, child) {
                      return TextField(
                        controller: _copyTextController,
                        decoration: const InputDecoration(
                            hintText: "Cole a lista recebida pelo WhatsApp",
                            hintStyle: TextStyle(
                                color: SystemColors.textSecondary,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 8)),
                      );
                    },
                  )),
                  IconButton(
                      onPressed: () async {
                        Provider.of<InitialPageViewModel>(context,
                                listen: false)
                            .clipboardTextConvert();
                      },
                      icon: const Icon(Icons.paste_rounded))
                ]),
              ),
              const SizedBox(
                height: 18,
              ),
              Consumer<InitialPageViewModel>(
                builder: (context, itensList, child) {
                  if (itensList.itens.isEmpty) {
                    return OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          backgroundColor: SystemColors.primary),
                      onPressed: () async {
                        itensList.clipboardTextConvert();
                      },
                      icon: const Icon(Icons.paste, color: Colors.white),
                      label: const Text("Colar lista",
                          style: TextStyle(color: Colors.white)),
                    );
                  } else {
                    return OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          backgroundColor: SystemColors.primary),
                      onPressed: () {},
                      icon: const Icon(Icons.format_list_numbered,
                          color: Colors.white),
                      label: Text("Listar ${itensList.itens.length} itens",
                          style: const TextStyle(color: Colors.white)),
                    );
                  }
                },
              ),
              Visibility(
                visible: !Provider.of<InitialPageViewModel>(context)
                    .clipBoardTextIsNull(),
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: TextButton.icon(
                    onPressed: () {
                      Provider.of<InitialPageViewModel>(context, listen: false)
                          .clear();
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: const Text("Limpar",
                        style: TextStyle(
                          color: Colors.red,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
