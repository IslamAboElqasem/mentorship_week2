import 'package:anime_app/Features/upgrade_plan/presentation/widgets/primary_button.dart';
import 'package:anime_app/Features/upgrade_plan/presentation/widgets/subscription_buttons.dart';
import 'package:anime_app/Features/upgrade_plan/presentation/widgets/upgrade_hero.dart';
import 'package:flutter/material.dart';

import 'widgets/upgrade_header.dart';

class UpgradePlanScreen extends StatelessWidget {
  const UpgradePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F8FD),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffDEE3FF), Color(0xffF9F8FD)],
            stops: [.6, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpgradeHeader(
                      onClose: () => Navigator.of(context).maybePop(),
                    ),
                    const UpgradeHero(),
                    const SizedBox(height: 24),
                    const SubscriptionButtons(),
                    const SizedBox(height: 16),
                    PrimaryButton(label: 'Continue', onPressed: () {}),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
