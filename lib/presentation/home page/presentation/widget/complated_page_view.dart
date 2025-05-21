import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:lawyer_app/presentation/home%20page/presentation/bloc/complate%20bloc/complate_bloc.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/complate%20bloc/complate_event.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/bloc/complate%20bloc/complate_state.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/widget/home_page_item.dart';
import 'package:lawyer_app/presentation/home%20page/presentation/widget/title_with_divider.dart';
import 'package:lawyer_app/untility/app_assests.dart';
import 'package:lawyer_app/untility/app_color.dart';

class ComplatedPageView extends StatelessWidget {
  const ComplatedPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger fetch once when this screen is built
    context.read<ComplateBloc>().add(FetchComplateEvent());

    return BlocBuilder<ComplateBloc, ComplateState>(
      builder: (context, state) {
        if (state is ComplateLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ComplateLoadedState) {
          final items = state.complateResponse.data ?? [];

          // Map your model into notification maps
          final notifications =
              items.map((c) {
                final prop = c.property;
                final location =
                    prop != null ? "${prop.state}, ${prop.exactPosition}" : "";
                return {
                  "mainText": location,
                  "secondText": "${c.typeRequest}    ${c.status}",
                  "startColor": AppColors.pink200,
                  "endColor": AppColors.pink900,
                  "imageIcon": AppAssets.complate,
                };
              }).toList();

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
                builder: (ctx) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => GoRouter.of(ctx).pop(),
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
                const TitleWithDivider(title: 'completed mission'),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: notifications.length,
                    itemBuilder: (ctx, i) {
                      final item = notifications[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        child: InkWell(
                          onTap: () {
                            /* … */
                          },
                          child: HomePageItem(
                            mainText: item["mainText"] as String,
                            secondText: item["secondText"] as String,
                            startColor: item["startColor"] as Color,
                            endColor: item["endColor"] as Color,
                            imageICon: item["imageIcon"] as String,
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

        if (state is ComplateErrorState) {
          return Scaffold(
            body: Center(
              child: Text(
                "An error occurred: ${state.helperResponse.servicesResponse}",
              ),
            ),
          );
        }

        // Fallback initial
        return const Scaffold(body: Center(child: Text("No data.")));
      },
    );
  }
}
