import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lawyer_app/presentation/home%20page/widget/home_page_item.dart'
    show HomePageItem;
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart' show AppRouter;

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.teal,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Shalan,nora cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.teal,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.law,
      },
      {
        "mainText": "Damascus,Shalan,Nora cicular,bu..!!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.teal,
        "imageIcon": AppAssets.business,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.law,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.lightBlue,
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
        actions: [
          InkWell(
            // onTap: () {
            //   GoRouter.of(context).push(AppRouter.kNotificationView);
            // },
            child: Icon(Icons.notifications, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: InkWell(
              // onTap: () {
              //   if (item["imageIcon"] == AppAssets.negotiationICon) {
              //     GoRouter.of(
              //       context,
              //     ).push(AppRouter.kNegotiationNotificationView);
              //   }
              // },
              child: HomePageItem(
                mainText: item["mainText"],
                secondText: item["secondText"],
                color: item["color"],
                imageICon: item["imageIcon"],
              ),
            ),
          );
        },
      ),
    );
  }
}
