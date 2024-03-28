import 'package:flutter/material.dart';
import 'package:whats_list/utils/system_colors.dart';
import 'package:whats_list/view/home_page2.dart';

void main() {
  runApp(const MyApp());
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
      home: const HomePage2(),
    );
  }
}
