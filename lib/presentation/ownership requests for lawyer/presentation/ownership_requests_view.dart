import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/bloc/owner_ship_requests_bloc.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/widgets/ownership_request_item.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/widgets/shimmer_ownership_request_item.dart';
import 'package:lawyer_app/untility/elevated_button_widget.dart';
import 'package:lawyer_app/untility/somthing_wrong.dart';

class OwnershipRequestsView extends StatefulWidget {
  const OwnershipRequestsView({super.key});

  @override
  State<OwnershipRequestsView> createState() => _OwnershipRequestsViewState();
}

class _OwnershipRequestsViewState extends State<OwnershipRequestsView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<OwnerShipRequestsBloc>().add(
      const GetOwnerShipRequestsEvent(),
    );

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        final state = context.read<OwnerShipRequestsBloc>().state;

        if (state is OwnerShipRequestsSuccess &&
            !state.hasReachedMax &&
            !state.isLoadingMore) {
          context.read<OwnerShipRequestsBloc>().add(
            const GetOwnerShipRequestsEvent(),
          );
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
    return BlocListener<OwnerShipRequestsBloc, OwnerShipRequestsState>(
      listener: (context, state) {
        if (state is AcceptTransferLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is AcceptTransferSuccess) {
          EasyLoading.showSuccess(state.successMessage);
        }
        if (state is AcceptTransferFailure) {
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
            'Ownership Requests',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),

          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<OwnerShipRequestsBloc, OwnerShipRequestsState>(
          builder: (context, state) {
            if (state is OwnerShipRequestsLoading ||
                state is OwnerShipRequestsInitial ||
                state is AcceptTransferLoading) {
              return ListView.builder(
                reverse: false,
                itemCount: 20,
                itemBuilder:
                    (context, index) => const ShimmerOwnershipRequestItem(),
              );
            }
            if (state is OwnerShipRequestsSuccess && state.requests.isEmpty) {
              return SomethingWrongWidget(
                title: "No requests found!",
                svgPath: 'assets/images/search.svg',
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed:
                      () => context.read<OwnerShipRequestsBloc>().add(
                        const GetOwnerShipRequestsEvent(refresh: true),
                      ),
                ),
              );
            }

            if (state is OwnerShipRequestsSuccess &&
                state.requests.isNotEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<OwnerShipRequestsBloc>().add(
                    const GetOwnerShipRequestsEvent(refresh: true),
                  );
                },
                child: ListView.builder(
                  reverse: false,
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  itemCount:
                      state.hasReachedMax
                          ? state.requests.length
                          : state.requests.length +
                              (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.requests.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8,
                        ),
                        child: ShimmerOwnershipRequestItem(),
                      );
                    }
                    final item = state.requests[index];
                    return OwnershipRequestItem(request: item);
                  },
                ),
              );
            }
            if (state is OwnerShipRequestsFailure) {
              return SomethingWrongWidget(
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed:
                      () => context.read<OwnerShipRequestsBloc>().add(
                        const GetOwnerShipRequestsEvent(refresh: true),
                      ),
                ),
              );
            }

            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed:
                    () => context.read<OwnerShipRequestsBloc>().add(
                      const GetOwnerShipRequestsEvent(refresh: true),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
