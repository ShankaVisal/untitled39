import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/featured_heading.dart';
import '../widgets/featured_tiles.dart';
import '../widgets/floating_quick_access_bar.dart';
import '../widgets/main_heading.dart';
import '../widgets/menu_drawer.dart';
import '../widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    debugPrint(_opacity.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < 800
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.blue),
              elevation: 5,
              backgroundColor: ThemeData.dark()
                  .scaffoldBackgroundColor
                  .withOpacity(_opacity),
              title: const Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 26,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: const MenuDrawer(),
      body: screenSize.width < 800
          ? SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF213695), // Start color
                      Color(0xFF160C62), // End color
                    ],
                    stops: [0.1, 0.9],
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: screenSize.height,
                          width: screenSize.width,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/1234567.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            height: screenSize.height,
                            width: screenSize.width,
                            color: Colors
                                .transparent, // Make sure to set a transparent color
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 30, right: 30),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GradientText(
                                    'MASTERING FLUTTER',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 70,
                                      height: 0.99,
                                    ),
                                    colors: const [
                                      Color(0xff0CFF60),
                                      Color(0xff0091FB)
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Online Course',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 60,
                                      height: 0.95,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height/50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: screenSize.width,
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 23,
                                          height: 1.3, // Adjust line spacing as needed
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Welcome to Dive Deep into Flutter: A Comprehensive Guide – an immersive online course ",
                                          ),
                                          TextSpan(
                                            text: "meticulously crafted to transform you into a Flutter maestro. Whether you're ",
                                          ),
                                          TextSpan(
                                            text: "a beginner aspiring to enter the world of app development or a seasoned developer ",
                                          ),
                                          TextSpan(
                                            text: "looking to master the latest technologies, this course is your gateway to unlocking ",
                                          ),
                                          TextSpan(
                                            text: "the full potential of Flutter.",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height/50,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: screenSize.height),
                            //FloatingQuickAccessBar(screenSize: screenSize),
                            FeaturedHeading(screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize),
                            MainHeading(screenSize: screenSize),
                            MainCarousel(),
                            SizedBox(height: screenSize.height / 10),
                            const BottomBar(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF213695), // Start color
                      Color(0xFF160C62), // End color
                    ],
                    stops: [0.1, 0.9],
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: screenSize.height,
                          width: screenSize.width,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/1234567.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 30, right: 30),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GradientText(
                                    'MASTERING FLUTTER',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 95,
                                      height: 0.99,
                                    ),
                                    colors: const [
                                      Color(0xff0CFF60),
                                      Color(0xff0091FB)
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Online Course',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 70,
                                      height: 0.95,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height/50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    width: screenSize.width/2,
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25,
                                          height: 1.3, // Adjust line spacing as needed
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Welcome to Dive Deep into Flutter: A Comprehensive Guide – an immersive online course ",
                                          ),
                                          TextSpan(
                                            text: "meticulously crafted to transform you into a Flutter maestro. Whether you're ",
                                          ),
                                          TextSpan(
                                            text: "a beginner aspiring to enter the world of app development or a seasoned developer ",
                                          ),
                                          TextSpan(
                                            text: "looking to master the latest technologies, this course is your gateway to unlocking ",
                                          ),
                                          TextSpan(
                                            text: "the full potential of Flutter.",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height/50,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: screenSize.height),
                            //FloatingQuickAccessBar(screenSize: screenSize),
                            FeaturedHeading(screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize),
                            MainHeading(screenSize: screenSize),
                            MainCarousel(),
                            SizedBox(height: screenSize.height / 10),
                            const BottomBar(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
