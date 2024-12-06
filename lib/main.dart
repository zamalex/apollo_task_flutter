import 'package:apollo_task_flutter/data/service_locator.dart';
import 'package:apollo_task_flutter/domain/items_use_case.dart';
import 'package:apollo_task_flutter/presentation/providers/content_switch_provider.dart';
import 'package:apollo_task_flutter/presentation/providers/items_provider.dart';
import 'package:apollo_task_flutter/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  init();


  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider<ItemsProvider>(create: (context) => ItemsProvider(),),
        ChangeNotifierProvider<ContentSwitchProvider>(create: (context) => ContentSwitchProvider(),)
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}