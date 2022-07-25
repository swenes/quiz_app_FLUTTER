import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';

import '../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionConroller>(
        init: QuestionConroller(),
        builder: (qnController) {
          Color getRightColor() {
            if (qnController.isAnswerd) {
              if (index == qnController.correctAnswer) {
                return kGreenColor;
              } else if (index == qnController.selectedAnswer &&
                  qnController.selectedAnswer != qnController.correctAnswer) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getRightIcon() {
            return getRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration:
                  BoxDecoration(border: Border.all(color: getRightColor()), borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. $text',
                    style: TextStyle(color: getRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getRightColor() == kGrayColor ? Colors.transparent : getRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: getRightColor(),
                      ),
                    ),
                    child: getRightColor() == kGrayColor
                        ? null
                        : Icon(
                            getRightIcon(),
                            size: 16,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
