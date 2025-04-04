import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF0F4FF),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Flutter là gì?',
      'answers': ['Framework', 'Ngôn ngữ lập trình', 'Trình duyệt'],
      'correctAnswer': 'Framework',
    },
    {
      'question': 'Dart là ngôn ngữ lập trình của Flutter?',
      'answers': ['Đúng', 'Sai'],
      'correctAnswer': 'Đúng',
    },
    {
      'question': 'Flutter chỉ chạy trên Android?',
      'answers': ['Đúng', 'Sai'],
      'correctAnswer': 'Sai',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[questionIndex]['correctAnswer']) {
      score++;
    }
    setState(() {
      if (questionIndex < _questions.length - 1) {
        questionIndex++;
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          '🎉 Kết quả Quiz!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        content: Text(
          'Điểm của bạn là: $score/${_questions.length}',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                questionIndex = 0;
                score = 0;
              });
            },
            child: Text(
              '🔁 Bắt đầu lại',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text('🧠 Ứng Dụng Quiz')),
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Câu hỏi
                  Container(
                    padding: EdgeInsets.all(24),
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Text(
                      _questions[questionIndex]['question'] as String,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Các lựa chọn
                  ...( _questions[questionIndex]['answers'] as List<String> ).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadowColor: Colors.black26,
                          elevation: 4,
                        ),
                        child: Center(
                          child: Text(
                            answer,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
