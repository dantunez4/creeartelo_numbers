import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:numbers/screens/screens.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final controller = PageController();

  final List<Widget> pages = [
    TriviaScreen(),
    DateScreen(),
    MathScreen(),
    YearScreen()
  ];
  double currentPageValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: PageView.builder(
        itemCount: pages.length,
        controller: controller,
        onPageChanged: (int page) {
          setState(
            () {
              currentPageValue = page.toDouble();
            },
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: pages[index],
                ),
                DotsIndicator(
                  dotsCount: pages.length,
                  position: currentPageValue,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
