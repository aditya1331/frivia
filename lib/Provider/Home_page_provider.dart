import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:Frivia/Pages/main_screen.dart';

//the extension changeNotifier helps to keep track of the changes that occur within the class
class HomePageProvider extends ChangeNotifier {
  final Dio _dio = Dio(); //Client that pulls request
  final int _maxQuestions = 3;
  int correctAnswerCount=0;
  List? questions;
  int _currentQuestion = 0;
  String? difficulty_level = "easy";
  BuildContext context;

  HomePageProvider({required this.context, required this.difficulty_level}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsfromAPI();
  }

  Future<void> _getQuestionsfromAPI() async {
    var _response = await _dio.get('', queryParameters: {
      'amount': 10,
      'type': 'boolean',
      'difficulty': difficulty_level,
    });
    var _data = jsonDecode(_response.toString());
    questions = _data["results"];
    questions?.add({
      "question":""
    });
    notifyListeners(); //Indiacting chanfe has occured so that rebild is called
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestion]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect = questions![_currentQuestion]["correct_answer"] == _answer;
    if(isCorrect)
      {
        correctAnswerCount++;
      }
    _currentQuestion++;
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        });
    await Future.delayed(const Duration(
        seconds: 1)); //Delaying the notifier for 1 second and closing it
    Navigator.pop(context);
    if (_currentQuestion == _maxQuestions) {
      endGame();
    }

    notifyListeners();
  }

  Future<void> endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return  AlertDialog(
            backgroundColor: Colors.blue,
            title: Text(
              "End Game ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            content: Text("Score: "+correctAnswerCount.toString()+"/"+_maxQuestions.toString()),
          );
        });
    await Future.delayed(const Duration(seconds: 2));
    correctAnswerCount=0;
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => main_screen()));
    _currentQuestion = 0;
  }
}
