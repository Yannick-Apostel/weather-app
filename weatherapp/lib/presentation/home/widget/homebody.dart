import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/home/widget/actionButton.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
              Colors.white,
              Colors.lightBlue[50]!,
              Colors.lightBlue[100]!,
              const Color.fromARGB(255, 81, 176, 253)
            ])),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Center(
                child: Text(
                  'Berlin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 350,
              color: Colors.grey,
              child: const Center(child: Text('PLaceholder')),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text("23°C",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: const Text("Rain",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                child: ActionButton(
              text: 'more information',
              callback: () {},
            ))
          ],
        ),
      ),
    );
  }
}
