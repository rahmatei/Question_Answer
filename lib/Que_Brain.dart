import 'package:flutter/material.dart';
import 'package:que_project/Questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizeBrain {
  List<Questions> _questionBank = [
    Questions(q: 'Where Are You From Iran?', a: true),
    Questions(q: 'You Student', a: false),
    Questions(q: 'Age Bigger', a: true)
  ];
  List<Icon> result = [];
  int current_question = 0;
  String getQuestion() {
    return _questionBank[current_question].question;
  }

  bool getAnswer() {
    return _questionBank[current_question].answer;
  }

  void nextQuestion() {
    if (_questionBank.length - 1 > current_question) {
      current_question++;
    } else {
      current_question = 0;
    }
    /*if (_questionBank.length - 1 < current_question) {
      current_question++;
    }*/
  }

  int count_Question() {
    return _questionBank.length;
  }

  bool que_Finished() {
    if (_questionBank.length - 1 <= current_question) {
      return true;
    } else
      return false;
  }

  void resetQuize() {
    result = [];
    current_question = 0;
  }
}
