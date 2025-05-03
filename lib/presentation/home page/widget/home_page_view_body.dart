import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lawyer_app/presentation/home%20page/widget/home_page_item.dart'
    show HomePageItem;
import 'package:lawyer_app/presentation/home%20page/widget/title_with_divider.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;
import 'package:go_router/go_router.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({
    super.key,
    //required ZoomDrawerController drawerController,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "startColor": AppColors.teal,
        "endColor": AppColors.darkGreen,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Shalan,nora cicular,bu..!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "startColor": AppColors.teal,
        "endColor": AppColors.darkGreen,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "startColor": AppColors.lightPurple50,
        "endColor": AppColors.lightPurple,
        "imageIcon": AppAssets.law,
      },
      {
        "mainText": "Damascus,Shalan,Nora cicular,bu..!!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "startColor": AppColors.teal,
        "endColor": AppColors.darkGreen,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "startColor": AppColors.lightPurple50,
        "endColor": AppColors.lightPurple,
        "imageIcon": AppAssets.law,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "startColor": AppColors.lightPurple50,
        "endColor": AppColors.lightPurple,
        "imageIcon": AppAssets.law,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Twfek Alhmada',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
            );
          },
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWithDivider(title: 'mission'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (item["imageIcon"] == AppAssets.business) {
                        GoRouter.of(context).push(AppRouter.kBayView);
                      } else if (item["imageIcon"] == AppAssets.law) {
                        GoRouter.of(context).push(AppRouter.kCheckView);
                      }
                    },
                    child: HomePageItem(
                      mainText: item["mainText"],
                      secondText: item["secondText"],
                      startColor: item["startColor"] ?? Colors.grey,
                      endColor: item["endColor"] ?? Colors.blueGrey,
                      imageICon: item["imageIcon"],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
