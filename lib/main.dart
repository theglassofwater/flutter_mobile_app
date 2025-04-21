import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/utils/theme_provider.dart';
import 'package:flutter_mobile_app/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: const BottomNavBar(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
