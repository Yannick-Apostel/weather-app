import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xfff2fa4d6),
      child: Center(
        child: Text('something gone wrong - please try again'),
      )
    );
  }
}