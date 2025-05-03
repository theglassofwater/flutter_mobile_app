import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/onboarding.dart';
import 'package:flutter_mobile_app/services/theme_storage.dart';
import 'package:flutter_mobile_app/utils/theme_provider.dart';
import 'package:flutter_mobile_app/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDark = await ThemeStorage().isDark();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark),
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
      title: 'My flutter app',

      // home: const BottomNavBar(),
      home: const Onboarding(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
