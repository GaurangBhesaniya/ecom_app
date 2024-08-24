import 'package:flutter/material.dart';
import 'package:ecom_app/config/app_image.dart';



class AnimatedBorderWidget extends StatefulWidget {
  const AnimatedBorderWidget({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedBorderWidget> createState() => _AnimatedBorderWidgetState();
}

class _AnimatedBorderWidgetState extends State<AnimatedBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: 120,
        height: 120,
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImage.animationRing),fit: BoxFit.cover)
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

// SvgPicture.asset(AppIcon.backBtn)
