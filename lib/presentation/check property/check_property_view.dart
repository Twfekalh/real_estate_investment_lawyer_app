import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/bloc/check_proparty_bloc.dart';

import 'package:lawyer_app/presentation/check%20property/presentation/widgets/check_property_container.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/custom_button.dart';
import 'package:lawyer_app/presentation/check%20property/presentation/widgets/property_description.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/untility/router.dart';

class CheckPropertyView extends StatelessWidget {
  const CheckPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckPropertyBloc, CheckPropertyState>(
      listener: (context, state) {
        if (state is CheckPropertyErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطأ: ${state.helperResponse.response}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => GoRouter.of(context).pop(),
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
            const Padding(
              padding: EdgeInsets.only(left: 38.0),
              child: Text(
                'Enter Real Estate Information:',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CheckPropertyBloc, CheckPropertyState>(
                builder: (context, state) {
                  if (state is CheckPropertyLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CheckPropertyLoadedState) {
                    final property = state.checkPropertyResponse.data!;
                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              CheckPropertyContainer(
                                child: Text(
                                  'Type: ${property.propertyType}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CheckPropertyContainer(
                                child: PropertyDescriptionWidget(
                                  property: property,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CheckPropertyContainer(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Position Information:',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text('State:'),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(property.state ?? ''),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Text('Exact Position:'),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          property.exactPosition ?? '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: CustomSendButton(
                                  buttonName: 'Confirm',
                                  onTap: () {
                                    GoRouter.of(
                                      context,
                                    ).push(AppRouter.kCheckView);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('لم يتم تحميل البيانات بعد.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
