import 'package:flutter/material.dart';
import 'package:whats_list/utils/system_colors.dart';
import 'package:whats_list/widgets/my_appbar.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const Drawer(child: Text("deu certo")),
      backgroundColor: SystemColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                          color: SystemColors.textPrimary,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8)),
                )),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.paste_rounded))
              ]),
            )

            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "Cole a lista recebida pelo WhasApp",
            //     hintStyle: const TextStyle(
            //         color: SystemColors.textPrimary,
            //         fontWeight: FontWeight.bold),
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(50),
            //         borderSide: BorderSide.none),
            //     fillColor: Colors.white,
            //     filled: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
