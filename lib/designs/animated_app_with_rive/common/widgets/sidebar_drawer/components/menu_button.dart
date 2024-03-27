import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPress,
    required this.riveOnInit,
  });
  final VoidCallback onPress;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
