import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvertisementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdvertisementPage();

}

class _AdvertisementPage extends State<AdvertisementPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: Image.asset('assets/burger.png', height: 40,),
              )
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("3일 후면 16,800원 손해봐요!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("(광고) 고객님의 쿠폰함에 6개의 할인 쿠폰이있어요!\n 그냥 지나치실건가요...?")
            ],
          ),
          Column(
            children: [
              Text("목요일 6시"),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/coupon.png', height: 35,)
            ],
          )
        ],
      )
    );
  }
}