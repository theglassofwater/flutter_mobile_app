import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/settings.dart';
import 'package:flutter_mobile_app/utils/screen_transitions.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProfilePage(title: 'Profile');
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        toolbarHeight: 50,
        title: Text(widget.title),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            slideFrom(context, Settings(), fromLeft: true);
          },
        ),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Divider(height: 1.0, thickness: 1.0),
        // ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Profile'),
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
      ),
    );
  }
}
