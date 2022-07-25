import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';

import '../../constants.dart';
import '../../models/questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionConroller _controller = Get.put(QuestionConroller());

    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding, left: kDefaultPadding, bottom: 30),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAnswer(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
