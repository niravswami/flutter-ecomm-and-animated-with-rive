import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/components/info_card.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/components/sidebar_menu_items.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/components/sidebar_menu_tile.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/models/rive_assets_model.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SidebarDrawer extends StatefulWidget {
  const SidebarDrawer({super.key});

  @override
  State<SidebarDrawer> createState() => _SidebarDrawerState();
}

class _SidebarDrawerState extends State<SidebarDrawer> {
  RiveAssetsModel selectedMenu = sidebarMenuItems.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: 288,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 32,
              // ),
              const InfoCard(
                name: "Nirav Swami",
                profession: "YouTuber",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 34, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenuItems.map(
                (menu) => SidebarMenuTile(
                  menu: menu,
                  riveOnInit: (Artboard artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI<SMIBool>("active");
                  },
                  onPress: () {
                    menu.input!.change(true);
                    setState(() {
                      selectedMenu = menu;
                    });
                    Future.delayed(const Duration(seconds: 1),
                        () => menu.input!.change(false));
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 34, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SidebarMenuTile(
                  menu: menu,
                  riveOnInit: (Artboard artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI<SMIBool>("active");
                  },
                  onPress: () {
                    menu.input!.change(true);
                    setState(() {
                      selectedMenu = menu;
                    });
                    Future.delayed(const Duration(seconds: 1),
                        () => menu.input!.change(false));
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
