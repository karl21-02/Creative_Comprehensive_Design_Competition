import 'package:flutter/material.dart';

class CardViewSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardViewSlider();
}

class _CardViewSlider extends State<CardViewSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

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
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - value.abs()).clamp(0.0, 1.0);
              }

              final double translationY = (1 - value) * 30;
              final double scale = (0.8 + (value * 0.2)).clamp(0.8, 1.0);

              bool isCurrentPage = (_pageController.page?.round() ?? 0) == index;

              return Transform.translate(
                offset: Offset(0, translationY),
                child: Transform.scale(
                  scale: scale,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isCurrentPage
                            ? Colors.orange[200]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/car${index + 1}.png',
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
