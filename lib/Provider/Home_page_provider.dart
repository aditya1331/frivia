import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//the extension changeNotifier helps to keep track of the changes that occur within the class
class HomePageProvider extends ChangeNotifier {
  final Dio _dio = Dio(); //Client that pulls request
  final int _maxQuestions = 10;
  List? questions;
  int _currentQuestion = 0;
  BuildContext context;

  HomePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsfromAPI();
  }

  Future<void> _getQuestionsfromAPI() async {
    var _response = await _dio.get('', queryParameters: {
      'amount': 10,
      'type': 'boolean',
      'difficulty': 'easy'
    });
    var _data = jsonDecode(_response.toString());
    questions = _data["results"];
    notifyListeners(); //Indiacting chanfe has occured so that rebild is called
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestion]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect = questions![_currentQuestion]["correct_answer"] == _answer;
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
    await Future.delayed(Duration(
        seconds: 1)); //Delaying the notifier for 1 second and closing it
    Navigator.pop(context);
    notifyListeners();
  }
}
