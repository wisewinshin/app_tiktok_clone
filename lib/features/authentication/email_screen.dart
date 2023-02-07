import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
