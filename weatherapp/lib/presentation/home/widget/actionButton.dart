import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function callback;
  const ActionButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        debugPrint('Button pressed');},
      child: Container(
        height: screenSize.width/15,
        width: screenSize.width/2.5,
        child: Center(child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white),)),
        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
      ),
    );
  }
}