import 'package:flutter/material.dart';

class DailyBonusScreen extends StatelessWidget {
  const DailyBonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Bonus'),
      ),
      body: const Center(
        child: Text('Daily Bonus Coming Soon!'),
      ),
    );
  }
}