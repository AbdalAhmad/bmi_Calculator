import 'package:flutter/material.dart';

// ReusableCard hai kafi jagah use kr sake aur baar code na likhna pade aur code improve hu jaye accha hu jaye
class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour,
      this.cardChild,
     this.onPress}); // this is like parameter

  final Color colour; //sbke apne apne logo clour banane ke liye kra ja rha  hai
  final Widget? cardChild; // question if for to make  parameter optional
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      
      child: Container(
        child: cardChild, //Icon daal diya hai
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
