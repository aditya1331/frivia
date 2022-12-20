import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _deviceHeight! * 0.05),
          child: _gameUI(),
        ),
      ),
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_questionText(),
        Column(
          children: [
            _trueButton(),
            SizedBox(height: _deviceHeight!*0.01,),
            _flaseButton(),
          ],
        ),

      ],
    );
  }

  Widget _questionText() {
    return const Text("Test Question 1 ghfdhkjdhk  hsjahkj",
      style: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),);
  }

  Widget _trueButton() {
    return MaterialButton(onPressed: () {},
      color: Colors.green,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.1,
      child: const Text(
        "True",
        style: TextStyle(color: Colors.white,
            fontSize: 25),
      ),

    );
  }

  Widget _flaseButton() {
    return MaterialButton(onPressed: () {},
      color: Colors.red,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.1,
      child: const Text(
        "False",
        style: TextStyle(color: Colors.white,
            fontSize: 25),
      ),

    );
  }

}