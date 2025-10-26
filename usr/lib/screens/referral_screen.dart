import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/app_provider.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Refer & Earn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Invite Friends & Earn Crypto!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Share your referral code and earn 0.0001 BTC for each friend who joins and completes their first task.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Your Referral Code',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appProvider.referralCode,
                      style: const TextStyle(fontSize: 24, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Share.share(
                  'Join me on Crypto Earner and earn free crypto! Use my referral code: ${appProvider.referralCode}',
                );
              },
              icon: const Icon(Icons.share),
              label: const Text('Share Referral Code'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Friends Referred: 0',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Total Earned: 0.000000 BTC',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}