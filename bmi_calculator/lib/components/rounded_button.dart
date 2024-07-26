
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      elevation: 6.0,
      onPressed: onPressed,
      fillColor: const Color(0xad10043d),
      highlightColor: const Color(0xFF5ac88d),
      constraints: const BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      child: Icon(icon),
    );
  }
}
