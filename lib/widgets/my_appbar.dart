import 'package:flutter/material.dart';
import 'package:whats_list/utils/system_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("WHATS LIST",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      backgroundColor: SystemColors.primary,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: SystemColors.secondary,
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
