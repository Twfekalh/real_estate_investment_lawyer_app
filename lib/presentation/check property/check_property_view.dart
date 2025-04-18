import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/check_mark_box.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_description.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/property_type_widget.dart';
import 'package:lawyer_app/presentation/check%20property/widgets/sales_estate_container.dart';
import 'package:lawyer_app/untility/app_color.dart';

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
          SizedBox(height: 20),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 10,
                    children: [
                      SaleEstateContainer(
                        height: 90,
                        child: PropertyTypeWidget(),
                      ),

                      const SizedBox(height: 0),
                      SaleEstateContainer(
                        height: 575,
                        child: PropertyDescriptionWidget(),
                      ),
                      SaleEstateContainer(
                        height: 150,
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
                              Row(
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
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.all(8),
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        'Near Omayyad Square, Building 12, Floor 3',
                                        style: TextStyle(fontSize: 14),
                                      ),
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
                          onTap: () {},
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
