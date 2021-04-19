import 'package:dev_quiz/Home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 161,                      
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                  text: "Wellington",
                                  style: AppTextStyles.titleBold)
                            ])),
                        Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/72938207?v=4")),
                            ))
                      ],
                    ),
                  ),
                  Align(alignment: Alignment(0.0, 1.0),child: ScoreCardWidget())
                ],
              ),
            ));
}
