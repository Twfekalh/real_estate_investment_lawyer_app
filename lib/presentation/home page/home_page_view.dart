import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lawyer_app/presentation/home%20page/widget/custom_drawer.dart'
    show CustomDrawer;
import 'package:lawyer_app/presentation/home%20page/widget/home_page_view_body.dart';

import 'package:lawyer_app/untility/app_color.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0.0,
      borderRadius: 30.0,
      menuBackgroundColor: AppColors.lightPurple,
      menuScreen: CustomDrawer(),
      mainScreen: HomePageViewBody(),
    );
  }
}
