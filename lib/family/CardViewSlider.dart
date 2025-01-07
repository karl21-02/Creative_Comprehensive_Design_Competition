import 'package:flutter/material.dart';

class CardViewSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardViewSlider();
}

class _CardViewSlider extends State<CardViewSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.orange[200] : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  'assets/car${index + 1}.png',
                  height: 200,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
