import 'package:flutter/material.dart';

class UpgradeHeader extends StatelessWidget {
  final VoidCallback onClose;
  const UpgradeHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Upgrade Plan',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 30),
        InkWell(
          onTap: onClose,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.close, color: Colors.black, size: 15),
          ),
        ),
      ],
    );
  }
}
