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
            title: Center(
                child: Text(getDaytime(),
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            backgroundColor: Colors.white,
          ),
          body: HomeBody()),
    );
  }

  String getDaytime() {
    TimeOfDay nowTime = TimeOfDay.now();

    if (nowTime.hour >= 0 && nowTime.hour < 12) {
      return 'good morning';
    } else if (nowTime.hour >= 12 && nowTime.hour < 18) {
      return 'good afternoon';
    }else if (nowTime.hour >= 18 && nowTime.hour < 24) {
      return 'good evening';
    } else {
      return 'hello';
    }
  }
}
