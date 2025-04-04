import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRollScreen());
}

class DiceRollScreen extends StatelessWidget {
  const DiceRollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red, // Màu nền cho ứng dụng
        appBar: AppBar(
          backgroundColor: Colors.red, // Màu nền appBar
          title: const Text("Dicee"),
          centerTitle: true,
        ),
        body: const DiceRollPage(),
      ),
    );
  }
}

class DiceRollPage extends StatefulWidget {
  const DiceRollPage({super.key});

  @override
  State<DiceRollPage> createState() => _DiceRollPageState();
}

class _DiceRollPageState extends State<DiceRollPage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;

  // Hàm thay đổi giá trị xúc xắc bên trái hoặc phải
  void changeDice(bool side) {
    setState(() {
      if (side == true) {
        leftDiceNumber = Random().nextInt(6) + 1;
      } else {
        rightDiceNumber = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: IconButton(
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            onPressed: () {
              changeDice(true);
            },
            icon: Image.asset(
              "images/dice$leftDiceNumber.png", // Đảm bảo rằng hình ảnh xúc xắc đã được thêm vào thư mục 'images'
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              changeDice(false);
            },
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            icon: Image.asset(
              'images/dice$rightDiceNumber.png', // Đảm bảo rằng hình ảnh xúc xắc đã được thêm vào thư mục 'images'
            ),
          ),
        ),
      ],
    );
  }
}
