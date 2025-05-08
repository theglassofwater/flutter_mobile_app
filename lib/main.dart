import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/onboarding.dart';
import 'package:flutter_mobile_app/services/location_storage.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/services/theme_storage.dart';
import 'package:flutter_mobile_app/utils/location_provider.dart';
import 'package:flutter_mobile_app/utils/theme_provider.dart';
import 'package:flutter_mobile_app/big_widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDark = await ThemeStorage().isDark();

  final prefs = await SharedPreferences.getInstance();

  final OverpassApi overpassApi = OverpassApi();
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => ThemeProvider(isDark),
    //   child: const MyApp(),
    // ),
    MultiProvider(
      providers: [
        Provider<OverpassApi>(create: (_) => overpassApi),
        ChangeNotifierProvider(create: (context) => ThemeProvider(isDark)),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(prefs, overpassApi),
        ),
      ],
      child: MyApp(),
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
