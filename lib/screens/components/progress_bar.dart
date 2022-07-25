import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/constants.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFF3F4768), width: 3), borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionConroller>(
        init: QuestionConroller(),
        builder: (controller) {
          print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var value2 = controller.animation.value;
                  return Container(
                    width: constraints.maxWidth * value2,
                    decoration: BoxDecoration(gradient: kPrimaryGradient, borderRadius: BorderRadius.circular(50)),
                  );
                },
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${(controller.animation.value * 60).round()} sec'),
                      WebsafeSvg.asset('assets/icons/clock.svg')
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
