import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/signin_screen.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildPageContent(
                image: 'assets/images/slide1.png',
                title: 'Welcome to Our App',
                description: 'This is the first introduction slide.',
              ),
              _buildPageContent(
                image: 'assets/images/slide2.png',
                title: 'Explore Features',
                description: 'This is the second introduction slide.',
              ),
              _buildPageContent(
                image: 'assets/images/slide3.png',
                title: 'Get Started',
                description: 'This is the third introduction slide.',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage != 2
                    ? TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(2);
                        },
                        child: Text('SKIP'),
                      )
                    : SizedBox.shrink(),
                Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
                _currentPage == 2
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text('START'),
                      )
                    : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('NEXT'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
