import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 24),
          Text(title, style: AppTextStyles.heading15),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  )),
              Expanded(
                flex: 3,
                child: ProgressIndicatorWidget(value : percent)
              )
            ],
          )
        ],
      ),
    );
  }
}
