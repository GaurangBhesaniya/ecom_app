import 'package:flutter/material.dart';

class SlidingPanelGreyContainer extends StatelessWidget {
  const SlidingPanelGreyContainer({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF575757),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
