import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/check_property_container.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_description.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_type_widget.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart';

class CheckPropertyView extends StatelessWidget {
  const CheckPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Check Property',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: Text(
              'Enter Real Estate Informatidon:',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 102),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 10,
                    children: [
                      CheckPropertyContainer(
                        //    height: 90,
                        child: PropertyTypeWidget(),
                      ),

                      const SizedBox(height: 0),
                      CheckPropertyContainer(
                        //  height: 575,
                        child: PropertyDescriptionWidget(),
                      ),
                      SizedBox(height: 4),
                      CheckPropertyContainer(
                        //height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Position Information:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'State:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 107,
                                    height: 26.63,
                                    padding: const EdgeInsets.only(left: 12),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Damascus',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Exact Position:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ), // مسافة صغيرة بين العنوان والصندوق
                                  Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      minHeight: 12,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Near Omayyad Square,Building 12, Floor 3',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 8.0),
                        child: CustomSendButton(
                          buttonName: 'Confirm',
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kCheckView);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
