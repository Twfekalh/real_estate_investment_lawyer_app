import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/home%20page/widget/home_page_item.dart';
import 'package:lawyer_app/presentation/home%20page/widget/title_with_divider.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';

class ComplatedPageView extends StatelessWidget {
  const ComplatedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
      {
        "mainText": "Damascus,Shalan,nora cicular,bu..!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
      {
        "mainText": "Damascus,Shalan,Nora cicular,bu..!!",
        "secondText": "bay request    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
      {
        "mainText": "Damascus,Mazaeh,Alhoda cicular,bu..!",
        "secondText": "legel check    7:45 pm 8/3/2024 ",
        "color": AppColors.pink100,
        "imageIcon": AppAssets.complate,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Twfel Alhmada',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            );
          },
        ),
        actions: [
          InkWell(
            // onTap: () {
            //   GoRouter.of(context).push(AppRouter.kCheckView);
            // },
            child: Icon(Icons.notifications, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWithDivider(title: 'completed mission'),
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
                      // if (item["imageIcon"] == AppAssets.business) {
                      //   GoRouter.of(context).push(AppRouter.kBayView);
                      // } else if (item["imageIcon"] == AppAssets.law) {
                      //   GoRouter.of(context).push(AppRouter.kCheckView);
                      // }
                    },
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
          ),
        ],
      ),
    );
  }
}
