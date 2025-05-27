import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:bmi_calculator/components.dart/BottomButton.dart';
import '../components.dart/Reusable_Card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resulttext});

  final String bmiResult;
  final String resulttext;
  final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bmi Calculator"),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children:[
                   Expanded(
                     child: Container(
                                   padding: EdgeInsets.all(5.0),
                                   alignment: Alignment.bottomLeft,
                                   child: Text(
                                     "Your Result",
                                     style: titletextstyle,
                                   ),
                                 ),
                   ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                    colour: activecardcolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resulttext,
                          style: resultTextStyle,
                        ),
                        Text(
                          bmiResult,
                          style: bmitextstyle,
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: bodytextstyle,
                        ),
                      ],
                    ),
                  ),
              ),
              
              BottomButton(
                  buttonTitle: 'Re-Calculate',
                  onTap: () {
                    Navigator.pop(context);
                  },  
                  )
          ]
          ),
        
        );
  }
}
