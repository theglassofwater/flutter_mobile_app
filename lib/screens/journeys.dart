import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/utils/theme_manager.dart';
import 'package:provider/provider.dart';

class Journeys extends StatelessWidget {
  const Journeys({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return JourneysPage(title: 'Journeys');
  }
}

class JourneysPage extends StatefulWidget {
  const JourneysPage({super.key, required this.title});
  final String title;

  @override
  State<JourneysPage> createState() => _JourneysPageState();
}

class _JourneysPageState extends State<JourneysPage> {
  int _counter = 0;
  bool _isdark = false;

  void _incrementCounter(int num) {
    setState(() {
      _counter += num;
    });
  }

  void darkModeSwitch(bool isdark) {
    setState(() {
      _isdark = !isdark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        leading: Icon(Icons.settings),

        actions: [
          Switch(
            value: _isdark == false,
            onChanged: (tap) {
              darkModeSwitch(tap);
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Journeys'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(1);
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
