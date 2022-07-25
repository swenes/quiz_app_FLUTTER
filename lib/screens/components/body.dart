import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/constants.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';
import 'package:quiz_app_project/models/questions.dart';
import 'package:quiz_app_project/screens/components/progress_bar.dart';
import 'package:quiz_app_project/screens/components/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionConroller _questionController = Get.put(QuestionConroller());
    return Stack(
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.none),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  (() => Text.rich(
                        TextSpan(
                          text: 'Question ${_questionController.questionNumber}',
                          style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
                          children: [
                            TextSpan(
                                text: "/${_questionController.questions.length}",
                                style: Theme.of(context).textTheme.headline5?.copyWith(color: kSecondaryColor)),
                          ],
                        ),
                      )),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQuestionumber,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
