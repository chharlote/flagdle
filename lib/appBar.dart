import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Flagdle',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: 47,
          fontWeight: FontWeight.bold,
        ),
      ),

      backgroundColor: Colors.black,
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
