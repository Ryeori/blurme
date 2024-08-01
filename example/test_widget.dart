import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.purpleAccent,
        border: Border.all(color: Colors.red.withOpacity(0.5), width: 2),
      ),
      child: const Text(
        'My test widget',
      ),
    );
  }
}
