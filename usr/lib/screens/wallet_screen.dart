import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wallet Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'BTC Balance',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${appProvider.balance.toStringAsFixed(6)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transaction History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: appProvider.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = appProvider.transactions[index];
                  return ListTile(
                    title: Text(transaction.description),
                    subtitle: Text(transaction.date.toString().split(' ')[0]),
                    trailing: Text(
                      '${transaction.amount > 0 ? '+' : ''}${transaction.amount.toStringAsFixed(6)} BTC',
                      style: TextStyle(
                        color: transaction.amount > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}