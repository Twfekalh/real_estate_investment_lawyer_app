import 'package:flutter/material.dart';
import 'package:lawyer_app/presentation/buy/presentation/widgets/buy_view_body.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/buy_request.page.model.dart';
import 'package:lawyer_app/presentation/home%20page/data/model/home/legal_check.page.model.dart';

class BuyView extends StatelessWidget {
  final BuyRequest buyRequest;
  const BuyView({super.key, required this.buyRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BuyViewBody(buyRequest: buyRequest),
    );
  }
}
