import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/deputization/presentation/bloc/deputizations_bloc.dart';
import 'package:lawyer_app/presentation/deputization/presentation/widgets/deputizations_item.dart';
import 'package:lawyer_app/presentation/deputization/presentation/widgets/shimmer_deputization_Item.dart';
import 'package:lawyer_app/untility/elevated_button_widget.dart';
import 'package:lawyer_app/untility/somthing_wrong.dart';

class DeputizationsView extends StatefulWidget {
  const DeputizationsView({super.key});

  @override
  State<DeputizationsView> createState() => _DeputizationsViewState();
}

class _DeputizationsViewState extends State<DeputizationsView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<DeputizationsBloc>().add(const GetDeputizationsEvent());

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        final state = context.read<DeputizationsBloc>().state;

        if (state is DeputizationsSuccess &&
            !state.hasReachedMax &&
            !state.isLoadingMore) {
          context.read<DeputizationsBloc>().add(const GetDeputizationsEvent());
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeputizationsBloc, DeputizationsState>(
      listener: (context, state) {
        if (state is ProccessDeputizationsLoading) {
          EasyLoading.show(status: 'loading...');
          context.read<DeputizationsBloc>().add(const GetDeputizationsEvent());
        }
        if (state is ProccessDeputizationsSuccesss) {
          EasyLoading.showSuccess(state.successMessage);
        }
        if (state is ProccessDeputizationsFailure) {
          EasyLoading.showError(state.errMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),

          title: const Text(
            'Deputizations',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),

          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<DeputizationsBloc, DeputizationsState>(
          builder: (context, state) {
            if (state is DeputizationsLoading ||
                state is DeputizationsInitial) {
              return ListView.builder(
                reverse: false,
                itemCount: 20, // number of shimmer items while loading
                itemBuilder:
                    (context, index) => const ShimmerDeputizationItem(),
              );
            }
            if (state is DeputizationsSuccess && state.deputizations.isEmpty) {
              return SomethingWrongWidget(
                title: "No investments found!",
                svgPath: 'assets/images/search.svg',
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed:
                      () => context.read<DeputizationsBloc>().add(
                        const GetDeputizationsEvent(refresh: true),
                      ),
                ),
              );
            }

            if (state is DeputizationsSuccess &&
                state.deputizations.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<DeputizationsBloc>().add(
                    const GetDeputizationsEvent(refresh: true),
                  );
                },
                child: ListView.builder(
                  reverse: false,
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  itemCount:
                      state.hasReachedMax
                          ? state.deputizations.length
                          : state.deputizations.length +
                              (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.deputizations!.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8,
                        ),
                        child: ShimmerDeputizationItem(),
                      );
                    }
                    final item = state.deputizations[index];
                    return DeputizationItem(
                      userId: item.id.toString(),
                      createdAt: item.createdAt.toString(),
                      deputizationContent: item.deputizationContent!,
                      idNumber: item.idNumber!,
                      status: item.status!,
                      userName: item.userName!,
                    );
                  },
                ),
              );
            }
            if (state is DeputizationsFailure) {
              SomethingWrongWidget(
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed:
                      () => context.read<DeputizationsBloc>().add(
                        const GetDeputizationsEvent(refresh: true),
                      ),
                ),
              );
            }

            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed:
                    () => context.read<DeputizationsBloc>().add(
                      const GetDeputizationsEvent(refresh: true),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
