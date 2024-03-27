import 'dart:ui';

import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/onboarding/widgets/animated_button.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/onboarding/widgets/custom_sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;
  bool isSignInDialogShown = false;

  void toggleSignInDialog() {
    setState(() {
      isSignInDialogShown = !isSignInDialogShown;
    });
  }

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // height: 100
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 60,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ")
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  // animated button
                  AnimatedButton(
                    btnAnimationController: _btnAnimationController,
                    onTap: () {
                      _btnAnimationController.isActive = true;
                      Future.delayed(
                        const Duration(milliseconds: 600),
                        () {
                          setState(() {
                            toggleSignInDialog();
                            customSignInDialog(context,
                                onClosed: (_) => toggleSignInDialog());
                          });
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old"),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
