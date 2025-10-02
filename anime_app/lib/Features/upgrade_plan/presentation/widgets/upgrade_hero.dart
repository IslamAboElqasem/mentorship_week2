import 'package:flutter/material.dart';

class UpgradeHero extends StatelessWidget {
  const UpgradeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Image.asset(
            'assets/images/c95a60abc2a332ac2e9ec339e59e23931d355859.png',
            height: 130,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Seamless Anime\nExperience, Ad-Free.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF18153F),
              )),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Enjoy unlimited anime streaming without\ninterruptions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
