import 'package:flutter/material.dart';
import 'package:robot/family/CardViewSlider.dart';
import 'package:robot/family/title/FamilyTitle.dart';

class FamilyManagePage extends StatefulWidget {
  const FamilyManagePage({super.key});

  @override
  State<StatefulWidget> createState() => _FamilyManagePage();
}

class _FamilyManagePage extends State<FamilyManagePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FamilyTitle(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(30),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  style: const TextStyle(fontSize: 15.0),
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'search',
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 16.0),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '#Special For You',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          // 버튼 클릭 이벤트 처리
                        },
                        child: const Text('see all'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: 720,
                height: 300,
                child: CardViewSlider()
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child:  Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMenu(
                          icon: Icons.calendar_month,
                          color: Colors.blueAccent,
                          title: '일정 관리',
                          subTitle: '',
                        ),
                        _buildMenu(
                          icon: Icons.question_mark,
                          color: Colors.blueAccent,
                          title: '키트 사용 설명서',
                          subTitle: '',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMenu(
                          icon: Icons.favorite,
                          color: Colors.blueAccent,
                          title: '자주 가는 곳',
                          subTitle: '',
                        ),
                        _buildMenu(
                          icon: Icons.settings,
                          color: Colors.blueAccent,
                          title: '설정',
                          subTitle: '',
                        ),
                      ],
                    )
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildMenu({
    required IconData icon,
    required Color color,
    required String title,
    required String subTitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 40,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}