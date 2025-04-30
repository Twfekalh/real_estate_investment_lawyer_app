import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/home%20page/widget/drawer_item.dart';
import 'package:lawyer_app/untility/app_color.dart' show AppColors;
import 'package:lawyer_app/untility/router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple, // Light purple background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        //  padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerItem(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHomePageView);
            },
          ),
          DrawerItem(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProfileView);
            },
          ),
          DrawerItem(
            icon: Icons.history,
            title: 'History',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kComplatedPageView);
            },
          ),
          //highlight_off_sharp
          DrawerItem(
            icon: Icons.help,
            title: 'Help',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHelpView);
            },
          ),
          const Divider(thickness: 4, color: AppColors.white, indent: 19),
          DrawerItem(icon: Icons.settings, title: 'Setting', onTap: () {}),

          DrawerItem(icon: Icons.logout, title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}
