import 'package:flutter/material.dart';

class PlanOptionCard extends StatelessWidget {
  final bool selected;
  final Widget leading;
  final String title;
  final String price;
  final String cadence;
  final String note;
  final VoidCallback onTap;

  const PlanOptionCard({
    super.key,
    required this.selected,
    required this.leading,
    required this.title,
    required this.price,
    required this.cadence,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = selected ? const Color(0xff5436F8) : Colors.white;
    final Color border =
        selected ? Colors.transparent : const Color(0xff18153F);
    final Color titleColor = selected ? Colors.white : const Color(0xff18153F);
    final Color subColor =
        selected ? const Color(0xff5436F8) : const Color(0xffAEADB5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                      children: [
                        TextSpan(text: price),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: cadence,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: subColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: subColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: selected
                    ? null
                    : Border.all(color: const Color(0xff18153F), width: 2),
                color: selected ? Colors.white : Colors.transparent,
              ),
              child: selected
                  ? const Icon(Icons.check, size: 18, color: Color(0xff5436F8))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
