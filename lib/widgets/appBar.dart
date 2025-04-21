import 'package:flutter/material.dart';

AppBar MyAppBar(String title) {
  return AppBar(
    // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Center(child: Text(title)),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(height: 1.0, thickness: 1.0),
    ),
  );
}
