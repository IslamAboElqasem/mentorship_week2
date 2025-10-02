import 'package:flutter/material.dart';

class DeviceStackIcon extends StatelessWidget {
  final Color primary;
  const DeviceStackIcon({super.key, required this.primary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 48,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 8,
            top: 8,
            child: Container(
              width: 44,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primary.withOpacity(0.12),
                border: Border.all(color: primary.withOpacity(0.3)),
              ),
            ),
          ),
          Container(
            width: 52,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: primary),
            ),
            child: Icon(Icons.play_arrow_rounded, color: primary, size: 22),
          ),
        ],
      ),
    );
  }
}
