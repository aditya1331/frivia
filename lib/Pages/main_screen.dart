import 'package:flutter/material.dart';
import 'game_page.dart';

class main_screen extends StatefulWidget {
  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  String? difficultylevel = "easy";
  HomePage? home;
  double slidervalue = 0;
  double maxOfSlider = 0.6,minOfSlider = 0.0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Trivia",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Text(
                difficultylevel! ,
                style: TextStyle(fontSize: 40, color: Colors.white),
                selectionColor: Colors.yellow,
              )
            ],
          ),

          SizedBox(
            height: deviceHeight*0.15,
          ),
          Slider(
              value: slidervalue,
          min:minOfSlider,
          max: maxOfSlider,
              divisions: 2,
              onChanged: (value) {
                slidervalue=value;
                switch(slidervalue.toString())
                {
                  case "0.0" : difficultylevel="easy";break;
                  case "0.3" :difficultylevel="medium";break;
                  case "0.6": difficultylevel="hard";break;
                }

                setState(() {

                });
              }),
          SizedBox(
            height: deviceHeight*0.2,
          ),

          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue
            ),
            child: const Text('Start',
              style: TextStyle(color: Colors.white,fontSize: 50),

            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage(difficultylevel)));
            },
          ),

        ],
      ),
    );
  }
}
