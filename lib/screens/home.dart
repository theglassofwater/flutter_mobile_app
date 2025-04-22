import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Home');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Divider(height: 1.0, thickness: 1.0, color: Colors.grey),
        // ),
      ),

      body: SafeArea(
        child: ListView.builder(
          itemCount: 11, // 1 manual + 10 generated
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                width: double.infinity,
                height: 120,
                // color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 2),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15.0,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Weekly Statistics",
                          style: TextStyle(fontSize: 14),
                        ),
                        // Text("See More", style: TextStyle()),
                      ],
                    ),
                    Row(
                      spacing: 50.0,
                      children: [
                        Column(
                          children: [
                            Text("Commutes", style: TextStyle(fontSize: 10)),
                            Text("15"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Time", style: TextStyle(fontSize: 10)),
                            Text("8h 47m"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Distance", style: TextStyle(fontSize: 10)),
                            Text("158km"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            // index - 1 because first item is manual
            return Container(
              width: double.infinity,
              // color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 2),
              // padding: EdgeInsets.all(30),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ListView(
//           children: [
//             Container(width: double.infinity, height: 150, color: Colors.blue),
//             Container(
//               width: double.infinity,
//               height: 100,
//               color: Colors.amberAccent,
//             ),
//           ],
//         ),

      // body: SafeArea(
      //   child: Container(
      //     // color: Colors.red,
      //     width: double.infinity,
      //     height: double.infinity,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5.0),
      //       color: Colors.red,
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //         Container(
      //           width: double.infinity,
      //           height: 150,
      //           color: Colors.blue,
      //         ),
      //         Container(
      //           width: double.infinity,
      //           height: 100,
      //           color: Colors.amberAccent,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _incrementCounter(3),
//         // tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
