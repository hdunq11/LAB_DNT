import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MiCard(),
  ));
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Màu nền nhẹ nhàng
      appBar: AppBar(
        title: const Text("MiCard"),
        backgroundColor: Colors.blueAccent, // Màu nền appBar
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: Colors.blueAccent, // Màu của Card
          margin: const EdgeInsets.all(20.0),
          elevation: 10, // Độ bóng cho card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Bo góc cho card
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding lớn hơn để tạo không gian
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Ảnh đại diện với đường viền bo tròn
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('images/dungh.jpg'), // Đảm bảo bạn có ảnh này
                ),
                const SizedBox(height: 15), // Khoảng cách giữa ảnh và văn bản
                Text(
                  'Dung Hoang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Backend Developer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20), // Khoảng cách giữa phần mô tả và liên hệ
                Divider(
                  color: Colors.white70,
                  thickness: 1, // Đường phân cách mỏng
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(height: 10),
                // Thông tin liên lạc
                Text(
                  'Contact Info:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Gmail: dungh@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Phone: 0005555',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Address: 470 Tran Dai Nghia',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
