import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Earner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () => Navigator.pushNamed(context, '/wallet'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Your Balance',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${appProvider.balance.toStringAsFixed(4)} BTC',
                      style: const TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Earn More Crypto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildMenuItem(context, Icons.task, 'Complete Tasks', '/tasks'),
                _buildMenuItem(context, Icons.people, 'Refer Friends', '/referral'),
                _buildMenuItem(context, Icons.watch_later, 'Daily Bonus', null),
                _buildMenuItem(context, Icons.mining, 'Mining Simulator', null),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/tasks');
              break;
            case 2:
              Navigator.pushNamed(context, '/wallet');
              break;
          }
        },
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String? route) {
    return Card(
      child: InkWell(
        onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}