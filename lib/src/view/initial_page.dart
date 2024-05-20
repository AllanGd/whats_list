import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/view/list_page.dart';
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
      appBar: const MyAppBar(title: "", createDate: ""),
      drawer: const Drawer(child: Text("deu certo")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
                    letterSpacing: 3,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                    shadows: <Shadow>[
                      Shadow(
                          color: SystemColors.textPrimary, offset: Offset(2, 2))
                    ]),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<InitialPageViewModel>(context, listen: false)
                        .clipboardTextConvert();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(
                              listItem: Provider.of<InitialPageViewModel>(
                                      context,
                                      listen: false)
                                  .itens),
                        ));
                  },
                  icon: const Icon(Icons.paste),
                  label: const Text("Colar Lista")),
              const SizedBox(height: 5),
              FilledButton.icon(
                  onPressed: () {
                    Provider.of<InitialPageViewModel>(context, listen: false)
                        .clipboardTextConvert();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(listItem: []),
                        ));
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("Lista Vazia"))
            ],
          ),
        ),
      ),
    );
  }
}
