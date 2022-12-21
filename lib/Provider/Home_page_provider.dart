import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//the extension changeNotifier helps to keep track of the changes that occur within the class
class HomePageProvider extends ChangeNotifier{
    final Dio _dio =Dio(); //Client that pulls request
    BuildContext context;

    HomePageProvider({required this.context}){
      _dio.options.baseUrl = 'https://opentdb.com/api.php';
      print("hello");
    }


}
