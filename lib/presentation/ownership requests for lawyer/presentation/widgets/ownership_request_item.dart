import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lawyer_app/untility/app_color.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/data/models/owner_ships_requests_response/request.dart';
import 'package:lawyer_app/presentation/ownership requests for lawyer/presentation/bloc/owner_ship_requests_bloc.dart';

class OwnershipRequestItem extends StatelessWidget {
  final Request request;
  const OwnershipRequestItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final isApproved = (request.status ?? '').toLowerCase() == 'approved';

    return Card(
      color: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green.shade100,
          child: const Icon(Icons.real_estate_agent, color: Colors.green),
        ),
        title: Text(
          request.propertyLocation ?? '-',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seller: ${request.sellerName ?? '-'} (#${request.sellerId ?? '-'} )"),
            Text("Buyer: ${request.buyerName ?? '-'} (#${request.buyerId ?? '-'})"),
            Text("Tax: ${request.tax?.toString() ?? '-'}"),
            Text(
              "Status: ${request.status ?? '-'}",
              style: TextStyle(
                color: (request.status ?? '').toLowerCase() == 'pending'
                    ? Colors.orange
                    : Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (request.createdAt != null)
              Text(
                "Created at: ${request.createdAt!.toIso8601String().split('T').first}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black54,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder: (_) => Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ownership Request Details",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Text("Property: ${request.propertyLocation ?? '-'}"),
                    const SizedBox(height: 6),
                    Text("Seller: ${request.sellerName ?? '-'} (#${request.sellerId ?? '-'})"),
                    const SizedBox(height: 6),
                    Text("Buyer: ${request.buyerName ?? '-'} (#${request.buyerId ?? '-'})"),
                    const SizedBox(height: 6),
                    Text("Tax: ${request.tax?.toString() ?? '-'}"),
                    const SizedBox(height: 6),
                    Text("Status: ${request.status ?? '-'}"),
                    const SizedBox(height: 16),
                    if (!isApproved)
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () {
                            context.read<OwnerShipRequestsBloc>().add(
                                  AcceptTransferOwnershipEvent(
                                    id: (request.id ?? '').toString(),
                                  ),
                                );
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Accept Transfer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 