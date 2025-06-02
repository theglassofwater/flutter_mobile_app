import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/onboarding.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/utils/account_provider.dart';
import 'package:flutter_mobile_app/utils/location_provider.dart';
import 'package:flutter_mobile_app/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final OverpassApi overpassApi = OverpassApi();

  final themeProvider = ThemeProvider(prefs);
  final accountProvider = AccountProvider(prefs);
  final locationProvider = LocationProvider(prefs, overpassApi);
  locationProvider.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<OverpassApi>(create: (_) => overpassApi),
        ChangeNotifierProvider(create: (context) => accountProvider),
        ChangeNotifierProvider(create: (context) => themeProvider),
        ChangeNotifierProvider(create: (context) => locationProvider),
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
