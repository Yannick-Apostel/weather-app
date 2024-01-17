import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/home/widget/homebody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text('Good Morning',
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            backgroundColor: Colors.white,
          ),
          body: HomeBody()),
    );
  }
}
