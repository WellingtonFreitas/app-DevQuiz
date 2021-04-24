import 'package:flutter/cupertino.dart';

class ChallengeContorler{
  final currentPageNotifier = ValueNotifier<int>(1); 
  int get currentPage => currentPageNotifier.value;
  set currenPage(int value) => currentPageNotifier.value = value;

  int anwserRight = 0;
}