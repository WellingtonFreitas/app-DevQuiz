import 'package:dev_quiz/Home/home_controller.dart';
import 'package:dev_quiz/Home/home_state.dart';
import 'package:dev_quiz/Home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/Home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/Home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() { 
      setState((){});
    });
  }
  @override
  Widget build(BuildContext context) {
   if(controller.state == HomeState.sucess){
      return Scaffold(
      appBar: AppBarWidget(user: controller.user!,),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height:20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Fácil",
                ),
                LevelButtonWidget(
                  label: "Médio",
                ),
                LevelButtonWidget(
                  label: "Difícil",
                ),
                LevelButtonWidget(
                  label: "Perito",
                ),
              ],
            ),
            SizedBox(
              height:20
            ),
            Expanded(
                child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: controller.quizzes!.map(
                (e) => QuizCardWidget(
                  title: e.title, 
                  percent: e.questionAnswered / e.questions.length ,
                  completed: "${e.questionAnswered} de ${e.questions.length}",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(
                      questions: e.questions,
                      title: e.title,
                    )
                    ));
                  },
                  )
                ).toList(),
            ))
          ],
        ),
      ),
    );
   }
   else{
     return Scaffold(
       body: Center(
         child: CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
         )
       )
     );
   }
  }
}
