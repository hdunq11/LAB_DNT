import 'package:flutter/material.dart';
import 'package:lab_flutter/lab5.dart';
import 'package:lab_flutter/lab6.dart';
import 'lab1.dart'; // Thêm các import cho các lab
import 'lab2.dart';
import 'lab3.dart';
import 'lab4.dart';
import 'lab5.dart';
import 'lab6.dart';
import 'lab7.dart';
// ...

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Labs")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    switch (index) {
                      case 0: return IAmRichScreen();
                      case 1: return MiCard();
                      case 2: return DiceRollScreen();
                      case 3: return BallPage();
                      case 4: return XylophoneApp();
                      case 5: return QuizPage();
                      case 6: return StoryPage();
                    // Thêm các màn hình khác vào đây
                      default: return Scaffold();
                    }
                  },
                ),
              );
            },
            child: Container(
              color: Colors.blueAccent,
              child: Center(child: Text("Lab ${index + 1}", style: TextStyle(color: Colors.white))),
            ),
          );
        },
      ),
    );
  }
}
