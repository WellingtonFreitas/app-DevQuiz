import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/nest_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'widgets/question_indicator/question_indicator_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeContorler();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currenPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length)
    pageController.nextPage(
        duration: Duration(microseconds: 300000), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(86),
          child: SafeArea(
              top: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                      currentPage: value,
                      length: widget.questions.length,
                    ),
                  )
                ],
              ))),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: nextPage,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if(value < widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.white(
                            label: "Pular",
                            onTap: nextPage,
                          )),
                        if(value == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )),
                      ],
                    ))),
      ),
    );
  }
}
