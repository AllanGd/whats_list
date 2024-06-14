import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:whats_list/src/model/item_list.dart';
import 'package:whats_list/src/repository/lists_reposirory.dart';
import 'package:whats_list/src/utils/system_colors.dart';
import 'package:whats_list/src/view/initial_page.dart';
import 'package:whats_list/src/viewmodel/initial_page_viewmodel.dart';
import 'package:whats_list/src/viewmodel/list_page_viewmodel.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemListAdapter());
  await Hive.openBox<ItemList>('listsBox');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => InitialPageViewModel()),
      ChangeNotifierProvider(create: (context) => ListPageViewModel()),
      ChangeNotifierProvider(create: (context) => ListsRepository()),
    ],
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
