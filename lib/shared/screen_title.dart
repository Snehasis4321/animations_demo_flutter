import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: ((context, value, child) => Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(top: value * 20),
              child: child,
            ),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
