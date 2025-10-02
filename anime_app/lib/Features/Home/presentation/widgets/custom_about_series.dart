import 'package:flutter/material.dart';

class CustomAboutSeries extends StatelessWidget {
  const CustomAboutSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/Vector.png',
            width: 29,
            height: 32,
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Text(
              'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFCBC4C4),
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
