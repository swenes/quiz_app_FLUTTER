import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/models/questions.dart';
import 'package:quiz_app_project/screens/score/score_screen.dart';

class QuestionConroller extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  // so that we can access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswerd = false;
  bool get isAnswerd => this._isAnswerd;

  late int _correctAnswer = 0;
  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAnswer = 0;
  int get numOfCorrectAnswer => this._numOfCorrectAnswer;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    _animationController = AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete((nextQuestion));

    _pageController = PageController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswerd = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) _numOfCorrectAnswer++;

    // It will stop the counter
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswerd = false;
      _pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(const ScoreScreen());
    }
  }

  void updateQuestionumber(int index) {
    _questionNumber.value = index + 1;
  }
}
