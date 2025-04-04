import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IAmRichScreen(),
  ));
}

class IAmRichScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I Am Rich"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/diamond.jpg'), // Đảm bảo rằng bạn đã có ảnh trong thư mục assets
            SizedBox(height: 20),
            Text(
              'I Am Rich',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
