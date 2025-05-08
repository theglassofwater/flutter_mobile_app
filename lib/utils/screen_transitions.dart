import 'package:flutter/material.dart';

void slideFrom(
  BuildContext context,
  Widget page, {
  bool fromLeft = false,
  bool replace = false,
}) {
  final Function navigate =
      replace ? Navigator.pushReplacement : Navigator.push;

  navigate(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(fromLeft ? -1.0 : 1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    ),
  );
}
