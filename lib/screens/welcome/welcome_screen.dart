import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_project/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.none),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2), // it will take 2/6
                Text("Let's Play Quiz",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const Text('Enter your information below '),
                const Spacer(), //   1/6
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                const Spacer(), //   1/6
                InkWell(
                  onTap: () => Get.to(const QuicScreen()),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75), // it takes 15,
                    decoration: const BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Text("Let's Start Quiz",
                        style: Theme.of(context).textTheme.button?.copyWith(color: Colors.black)),
                  ),
                ),
                const Spacer(flex: 2), //    2/6
              ],
            ),
          ))
        ],
      ),
    );
  }
}
