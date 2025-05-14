import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/home.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/home_bloc.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/widget/home_page_item.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/widget/title_with_divider.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/untility/router.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoadedState) {
          HomeResponse homeResponse = state.homeResponse;

          final List<Map<String, dynamic>> notifications = [
            ...homeResponse.data!.legalCheck!.map(
              (legalCheck) => {
                "mainText": "${legalCheck.location}, ${legalCheck.userName}",
                "secondText":
                    "Legal Check - ${legalCheck.status} - ${legalCheck.createdAt}",
                "startColor": AppColors.lightPurple50,
                "endColor": AppColors.lightPurple,
                "imageIcon": AppAssets.law,
                "legalCheckObject": legalCheck,
              },
            ),
            ...homeResponse.data!.buyRequests!.map(
              (buyRequest) => {
                "mainText": "${buyRequest.location}, ${buyRequest.userName}",
                "secondText":
                    "Buy Request - ${buyRequest.status} - ${buyRequest.createdAt}",
                "startColor": AppColors.teal,
                "endColor": AppColors.darkGreen,
                "imageIcon": AppAssets.business,
              },
            ),
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
                              final legalCheck = item["legalCheckObject"];
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kCheckView, extra: legalCheck);
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
        } else if (state is HomeErrorState) {
          return Center(
            child: Text(" An error occurred: ${state.helperResponse.response}"),
          );
        }

        return const Center(child: Text("No Data "));
      },
    );
  }
}
