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
                        height: 309,
                        child: PropertyTypeWidget(),
                      ),
                      const SizedBox(height: 10),
                      SaleEstateContainer(
                        height: 575,
                        child: PropertyDescriptionWidget(),
                      ),
                      const SizedBox(height: 10),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 33.0),
                      //   child: Row(
                      //     children: [
                      //       CheckMarkBox(),
                      //       SizedBox(width: 10),
                      //       Text(
                      //         'accept all ',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 12,
                      //           fontFamily: 'Inter',
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //       Text(
                      //         'conditions',
                      //         style: TextStyle(
                      //           color: const Color(0xFF22832D),
                      //           fontSize: 12,
                      //           fontFamily: 'Inter',
                      //           fontWeight: FontWeight.w400,
                      //           decoration: TextDecoration.underline,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 8.0),
                        child: CustomSendButton(
                          buttonName: 'Done',
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
