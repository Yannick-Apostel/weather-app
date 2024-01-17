import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(end: Alignment.bottomCenter, begin: Alignment.topCenter ,colors: [Colors.white, Colors.lightBlue[50]!, Colors.lightBlue[100]!, const Color.fromARGB(255, 81, 176, 253)])),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
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
              child: Center(child: Text('PLaceholder')),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text("23°C",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: Text("Rain",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 150,
              height: 25,
              
              child: Center(child: Text('NEW PAGE')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
