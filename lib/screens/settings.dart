import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'Flutter Demo Home Page');
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SettingsPage> {
  int _counter = 0;

  void _incrementCounter(int num) {
    setState(() {
      _counter += num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Settings'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(3),
        // tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
