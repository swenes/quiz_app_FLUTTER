import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/constants.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionConroller _qnController = Get.put(QuestionConroller());
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.none),
        Column(
          children: [
            const Spacer(flex: 3),
            Text(
              'Score',
              style: Theme.of(context).textTheme.headline3?.copyWith(color: kSecondaryColor),
            ),
            const Spacer(),
            Text(
              '${_qnController.numOfCorrectAnswer * 10}/${_qnController.questions.length * 10}',
              style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
            ),
            const Spacer(flex: 3)
          ],
        )
      ]),
    );
  }
}
