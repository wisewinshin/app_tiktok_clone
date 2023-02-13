import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _click = 0;

  void _increase() {
    setState(() {
      _click = _click + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$_click"),
        TextButton(onPressed: _increase, child: const Text("+"))
      ],
    );
  }
}
