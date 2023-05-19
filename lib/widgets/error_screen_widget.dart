import 'package:flutter/material.dart';
import 'package:gumtree_hr_management/utils/font_style_util.dart';
import 'package:gumtree_hr_management/utils/lottie_util.dart';
import 'package:lottie/lottie.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                LottieUtil.errorLottie,
              ),
            ),
            Text(
              message!,
              style: gumtreeFontSize28Red,
            )
          ]),
    );
  }
}
