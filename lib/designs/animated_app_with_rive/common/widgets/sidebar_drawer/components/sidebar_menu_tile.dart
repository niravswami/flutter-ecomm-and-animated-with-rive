// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

import 'package:ecomm_bloc_app/designs/animated_app_with_rive/models/rive_assets_model.dart';

class SidebarMenuTile extends StatelessWidget {
  const SidebarMenuTile({
    super.key,
    required this.menu,
    required this.onPress,
    required this.riveOnInit,
    required this.isActive,
  });

  final RiveAssetsModel menu;
  final VoidCallback onPress;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: onPress,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
