import 'package:bmi_calculator/screens.dart/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components.dart/icon_data.dart';
import '../components.dart/Reusable_Card.dart';
import '../constant.dart';
import '../components.dart/BottomButton.dart';
import '../components.dart/roundiconbutton.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender {
  male,
  female;
}

int height = 180;
int wieght = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                      print("object 1 pressed");
                    },
                    colour: selectedgender == Gender.male
                        ? activecardcolour
                        : InactiveCardColour,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                  // )
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                      print("object 2 is pressed");
                    },
                    colour: selectedgender == Gender.female
                        ? activecardcolour
                        : InactiveCardColour,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
                // ),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activecardcolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: NumberTextStyle),
                      Text("cm", style: labelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        }),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activecardcolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: labelTextStyle,
                      ),
                      Text(
                        wieght.toString(),
                        style: NumberTextStyle,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                wieght--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                wieght++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    colour: activecardcolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrian calc =
                      CalculatorBrian(height: height, weight: wieght);

                  Navigator.push(  context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: calc.calculateBMI(),
                                resulttext: calc.getResult(),
                                interpretation: calc.getInterpretation(),
                              )));
                }
                ),
          ],
        ));
  }
}



























// Container(
//   margin: EdgeInsets.all(15.0),
//    decoration: BoxDecoration(
//    color:activecardcolour ,
//    borderRadius: BorderRadius.circular(10)
//    ),
//       )

  // Color maleCardColour = InactiveCardColour;
  // Color femaleCardColour = InactiveCardColour;

  // male =1 , female =2
  // void updateColour(Gender selectedgender) {
  //   if (selectedgender== Gender.male) {
  //     if (maleCardColour == InactiveCardColour) {
  //       maleCardColour = activecardcolour;
  //       femaleCardColour = InactiveCardColour;
  //     } else {
  //       maleCardColour = InactiveCardColour;
  //     }
  //   }
  //   if (selectedgender == Gender.female) {
  //     if (femaleCardColour == InactiveCardColour) {
  //       femaleCardColour = activecardcolour;
  //       maleCardColour = InactiveCardColour;
  //     } else {
  //       femaleCardColour = InactiveCardColour;
  //     }
  //   }
  // }



    // child: GestureDetector(
                  // onTap: () {
                  //   setState(() {
                  //     // updateColour(Gender.male);
                  //     selectedgender = Gender.male;
                  //   });
                  //   print("object");
                  // },

                  