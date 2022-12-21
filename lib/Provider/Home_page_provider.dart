import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//the extension changeNotifier helps to keep track of the changes that occur within the class
class HomePageProvider extends ChangeNotifier{
    final Dio _dio =Dio(); //Client that pulls request
    final int _maxQuestions  = 10;
    BuildContext context;

    HomePageProvider({required this.context}){
      _dio.options.baseUrl = 'https://opentdb.com/api.php';
      _getQuestionsfromAPI();


    }

    Future<void> _getQuestionsfromAPI() async{
      var _response = await _dio.get(
        '',
        queryParameters: {
          'amount':10,
          'type':'boolean',
          'difficulty': 'easy'
        }
      );
      var _data = jsonDecode(_response.toString());
      var questions = _data["results"]
    }
}
