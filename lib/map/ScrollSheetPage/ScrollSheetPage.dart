import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollSheetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollSheetPage();
}

class _ScrollSheetPage extends State<ScrollSheetPage> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    List<String> titles = ['Name', 'PHONE', 'POSITION'];
    List<String> subTitle = ['김민제', '010-7162-9541', '경기도 용신시'];

    // void _callEmergencyNumber() async {
    //   const phoneNumber = 'tel:119'; // 119로 전화
    //   if (await canLaunch(phoneNumber)) {
    //     await launch(phoneNumber);
    //   } else {
    //     // 전화 기능이 지원되지 않는 경우 메시지 출력
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("전화 기능을 사용할 수 없습니다.")),
    //     );
    //   }
    // }

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            width: screenWidth,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
              )
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/grandmother.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('PROFILE PHOTO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                    ],
                  ),
                ),
                Positioned(
                  top: 220,
                  right: 290,
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Image.asset('assets/siren.png',height: 40,),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("신고"),
                                content: Text("119에 연결하시겠습니까?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인', style: TextStyle(color: Colors.black),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('취소', style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      )
                    ],
                  )
                ),
              ],
            )
          ),
          ...List.generate(3, (i) {
            return Container(
              width: screenWidth,
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[i],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    subTitle[i],
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 1,
                    child: Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}