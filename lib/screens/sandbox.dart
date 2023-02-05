import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double opacity = 1, margin = 0, width = 200;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.all(margin),
        width: width,
        color: color,
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                margin = 50;
              });
            },
            child: const Text("Animate Margin"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                width = 300;
              });
            },
            child: const Text("Animate Width"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                color = Colors.blue;
              });
            },
            child: const Text("Animate Color"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                opacity = 0;
              });
            },
            child: const Text("Animate Opacity"),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 2),
            child: const Text("Hide"),
          )
        ]),
      ),
    );
  }
}
