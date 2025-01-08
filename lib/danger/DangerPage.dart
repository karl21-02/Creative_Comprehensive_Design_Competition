import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'datas.dart';

class DangerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DangerPageState();
}

class _DangerPageState extends State<DangerPage> {
  late DatabaseReference _reference;
  final List<Datas> _datas = [];

  @override
  void initState() {
    super.initState();

    // FirebaseDatabase 참조 초기화
    _reference = FirebaseDatabase.instance.ref('message');

    // 데이터 변경 리스너 추가
    _reference.onChildAdded.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _datas.add(Datas.fromSnapshot(event.snapshot));
        });
      }
    }, onError: (error) {
      // 오류 처리
      print('Error: $error');
    });
  }

  @override
  void dispose() {
    // 리스너 해제 등 필요한 정리 작업
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('위험 알림')),
      body: _datas.isEmpty
          ? const Center(child: Text('현재 알림이 없습니다.', style: TextStyle(fontSize: 18),))
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          final data = _datas[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Center(
              child: Text(
                data.alarm,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
