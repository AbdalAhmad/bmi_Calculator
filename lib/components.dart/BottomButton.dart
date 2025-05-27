import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: Center(
              child: Text(
               buttonTitle, // buttonTitle;
                  style: largebuttontextstyle)),
          color: bottomContainerColur,
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          height: bottomContainerHeight,
        ));
  }
}




 //() {
        //   // onTap
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => ResultsPage()));
        // },