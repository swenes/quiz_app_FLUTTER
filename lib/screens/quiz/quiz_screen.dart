import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../components/body.dart';

class QuicScreen extends StatelessWidget {
  const QuicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionConroller _controller = Get.put(QuestionConroller());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                _controller.nextQuestion() ;
              },
              child: const Text('Skip')),
        ],
      ),
      body: Body(),
    );
  }
}
