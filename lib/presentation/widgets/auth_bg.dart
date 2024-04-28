import 'dart:ui';

import 'package:flutter/material.dart';

class AuthBg extends StatelessWidget {
  final Widget child;

  const AuthBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/images/auth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: child,
        ),
      ),
    );
  }
}
