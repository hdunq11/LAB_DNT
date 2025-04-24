import 'package:flutter/material.dart';

void main() {
  runApp(DestinyApp());
}

class DestinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boss Level Challenge 2 - Destiny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF0F4FF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStep = 0;
  String storyText = "Bạn tỉnh dậy trong một căn phòng tối và không biết mình đang ở đâu.";

  List<Map<String, Object>> storySteps = [
    {
      'text': "Bạn tỉnh dậy trong một căn phòng tối và không biết mình đang ở đâu.",
      'choices': [
        {'text': 'Khám phá xung quanh', 'nextStep': 1},
        {'text': 'Hướng về cửa sổ', 'nextStep': 2},
      ]
    },
    {
      'text': "Bạn tìm thấy một chiếc hộp bí ẩn trong góc phòng.",
      'choices': [
        {'text': 'Mở hộp', 'nextStep': 3},
        {'text': 'Bỏ qua hộp và đi ra ngoài', 'nextStep': 4},
      ]
    },
    {
      'text': "Bạn nhìn qua cửa sổ và thấy một thế giới lạ lẫm, một cánh cổng xuất hiện từ xa.",
      'choices': [
        {'text': 'Đi ra ngoài', 'nextStep': 4},
        {'text': 'Chờ đợi và nhìn thêm', 'nextStep': 5},
      ]
    },
    {
      'text': "Hộp chứa một viên đá kỳ lạ, và khi bạn chạm vào, một ánh sáng chói lóa bắn ra.",
      'choices': [
        {'text': 'Cầm viên đá và khám phá', 'nextStep': 6},
        {'text': 'Bỏ viên đá và rời khỏi phòng', 'nextStep': 7},
      ]
    },
    {
      'text': "Bạn quyết định bỏ qua hộp và rời khỏi phòng, nhưng gặp một cánh cổng bí ẩn.",
      'choices': [
        {'text': 'Vượt qua cổng', 'nextStep': 8},
        {'text': 'Quay lại và kiểm tra lại chiếc hộp', 'nextStep': 3},
      ]
    },
    {
      'text': "Bạn chờ đợi lâu hơn và nhận ra có ai đó đang đến gần.",
      'choices': [
        {'text': 'Chạy trốn', 'nextStep': 9},
        {'text': 'Chào đón người đó', 'nextStep': 10},
      ]
    },
    {
      'text': "Bạn cầm viên đá và được đưa đến một thế giới mới, nơi bạn phải đối đầu với một thử thách lớn.",
      'choices': [
        {'text': 'Chiến đấu', 'nextStep': 11},
        {'text': 'Chạy trốn', 'nextStep': 12},
      ]
    },
    {
      'text': "Bạn bỏ viên đá và rời khỏi phòng, nhưng thấy mình đang đứng giữa một mê cung.",
      'choices': [
        {'text': 'Đi vào mê cung', 'nextStep': 13},
        {'text': 'Quay lại và thử lại viên đá', 'nextStep': 6},
      ]
    },
    {
      'text': "Cánh cổng dẫn bạn đến một thế giới kỳ lạ, nơi bạn bắt đầu hành trình mới.",
      'choices': [
        {'text': 'Khám phá thế giới mới', 'nextStep': 14},
        {'text': 'Quay lại thế giới cũ', 'nextStep': 7},
      ]
    },
    {
      'text': "Bạn chạy trốn nhưng bị bắt lại và kết thúc hành trình ở đây.",
      'choices': []
    },
    {
      'text': "Bạn chào đón người đó và phát hiện ra rằng họ là một người bạn cũ, cùng nhau bắt đầu một hành trình mới.",
      'choices': [
        {'text': 'Cùng nhau khám phá', 'nextStep': 14},
        {'text': 'Trở về nhà', 'nextStep': 7},
      ]
    },
    {
      'text': "Cuối cùng, bạn chiến đấu và giành chiến thắng, trở thành anh hùng của thế giới này.",
      'choices': []
    },
    {
      'text': "Bạn chạy trốn và cuối cùng bị mắc kẹt trong một không gian vĩnh viễn.",
      'choices': []
    },
    {
      'text': "Bạn bắt đầu khám phá vùng đất mới, với hy vọng tìm ra vận mệnh của chính mình.",
      'choices': []
    },
  ];

  void _nextStep(int nextStep) {
    if (nextStep < 0 || nextStep >= storySteps.length) return;

    setState(() {
      currentStep = nextStep;
      storyText = storySteps[currentStep]['text'] as String;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      if (!mounted) return;

      final choices = storySteps[currentStep]['choices'] as List?;
      if (choices == null || choices.isEmpty) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('🎬 Kết thúc câu chuyện'),
            content: Text('Cảm ơn bạn đã tham gia cuộc hành trình.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  setState(() {
                    currentStep = 0;
                    storyText = storySteps[0]['text'] as String;
                  });
                },
                child: Text('🔁 Bắt đầu lại'),
              )
            ],
          ),
        );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boss Level Challenge 2 - Destiny'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 8),
                  ],
                ),
                child: Text(
                  storyText,
                  style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              ..._choices(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _choices() {
    var rawChoices = storySteps[currentStep]['choices'];
    if (rawChoices == null || (rawChoices as List).isEmpty) {
      return [];
    }

    List<Map<String, Object>> choices = List<Map<String, Object>>.from(
        rawChoices);

    return choices.map((choice) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: () => _nextStep(choice['nextStep'] as int),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 3,
          ),
          child: Text(
            choice['text'] as String,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }
}