import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
  // final svgPicture = SvgPicture.asset(
  //   'assets/images/arrow_right.svg',
  //   semanticsLabel: 'Arrow',
  //   height: 70,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        title: Center(child: Text(widget.title)),
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
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
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        // Text("See More", style: TextStyle()),
                      ],
                    ),
                    Row(
                      spacing: 20.0,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Commutes",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text("15"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Time",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text("8h 47m"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Distance",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text("158km"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "C02",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "52Kg",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            // index - 1 because first item is manual
            return _container(context, index);
          },
        ),
      ),
    );
  }
}

Widget _container(context, int number) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 2),
    padding: EdgeInsets.all(10),
    height: 160,
    child: Column(
      children: [
        Text("Day $number"),
        // Text("Time: 19:23", style: Theme.of(context).textTheme.bodySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 114,
              // color: Colors.red,
              child: Text("Home", textAlign: TextAlign.center),
            ),
            Container(
              width: 165,
              height: 114,
              padding: EdgeInsets.only(top: 20),
              // color: const Color.fromARGB(255, 176, 176, 176),
              child: Column(
                children: [
                  Text(
                    "08:06 - 08:57",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Image(
                    image: AssetImage('assets/images/long_double_arrow.jpg'),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "17:26 - 18:15",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/images/long_double_arrow.jpg'),
              //     fit: BoxFit.contain, // or .contain / .fill etc
              //   ),
              // ),
            ),
            SizedBox(
              width: 90,
              height: 114,
              // color: Colors.red,
              child: Text("Work", textAlign: TextAlign.center),
            ),
          ],
        ),
      ],
    ),
  );
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
