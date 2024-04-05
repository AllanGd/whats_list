import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/utils/system_colors.dart';
import 'package:whats_list/view/initial_page.dart';
import 'package:whats_list/viewmodel/initial_page_viewmodel.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => InitialPageViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whats List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SystemColors.primary),
        useMaterial3: true,
      ),
      home: InitialPage(),
    );
  }
}
