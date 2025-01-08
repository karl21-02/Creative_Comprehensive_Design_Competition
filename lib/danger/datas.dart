import 'package:firebase_database/firebase_database.dart';

class Datas {
  final String? key;
  final String alarm;

  Datas({required this.alarm, this.key});

  // Firebase 데이터에서 message 값을 안전하게 가져오기
  factory Datas.fromSnapshot(DataSnapshot snapshot) {
    final value = snapshot.value as Map<dynamic, dynamic>?; // Optional로 변경
    return Datas(
      key: snapshot.key,
      alarm: value?['message'] ?? '알림 없음', // null 안전 체크
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': alarm,
    };
  }
}
