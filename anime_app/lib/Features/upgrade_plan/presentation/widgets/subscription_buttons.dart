import 'package:anime_app/features/upgrade_plan/presentation/widgets/device_stack_icon.dart';
import 'package:anime_app/features/upgrade_plan/presentation/widgets/plan_option_card.dart';
import 'package:flutter/material.dart';

class SubscriptionButtons extends StatefulWidget {
  const SubscriptionButtons({super.key});

  @override
  State<SubscriptionButtons> createState() => _SubscriptionButtonsState();
}

class _SubscriptionButtonsState extends State<SubscriptionButtons> {
  bool monthlySelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanOptionCard(
          selected: monthlySelected,
          leading: const DeviceStackIcon(primary: Color(0xff5436F8)),
          title: 'Monthly',
          price: '5 USD',
          cadence: '/Month',
          note: 'Include Family Sharing',
          onTap: () {
            if (!monthlySelected) {
              setState(() => monthlySelected = true);
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        PlanOptionCard(
          selected: !monthlySelected,
          leading: const DeviceStackIcon(primary: Color(0xff5436F8)),
          title: 'Annually',
          price: '50 USD',
          cadence: '/Year',
          note: 'Include Family Sharing',
          onTap: () {
            if (monthlySelected) {
              setState(() => monthlySelected = false);
            }
          },
        ),
      ],
    );
  }
}
