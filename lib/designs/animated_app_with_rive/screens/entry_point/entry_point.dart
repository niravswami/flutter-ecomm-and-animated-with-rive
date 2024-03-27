// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/components/menu_button.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/sidebar_drawer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/animated_bar.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/bottom_navs.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/models/rive_assets_model.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/home_screen/home_screen.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/utils/constants.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAssetsModel selectedBottomNav = bottomNavs.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;

  void bottomNavOnTap(RiveAssetsModel nav) {
    setState(() {
      selectedBottomNav = nav;
    });
    nav.input!.change(true);
    Future.delayed(const Duration(seconds: 1), () => nav.input!.change(false));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: const SidebarDrawer()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: HomeScreen(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            top: 16,
            left: isSideMenuClosed ? 0 : 220,
            child: MenuButton(
              onPress: () {
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = !isSideBarClosed.value;
                });
                isSideBarClosed.value = !isSideBarClosed.value;
              },
              riveOnInit: (Artboard artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI('isOpen') as SMIBool;
                isSideBarClosed.value = true;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(bottomNavs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      bottomNavOnTap(bottomNavs[index]);
                      // bottomNavs[index].input!.change(true);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActive: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          width: 36,
                          height: 36,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI('active') as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
