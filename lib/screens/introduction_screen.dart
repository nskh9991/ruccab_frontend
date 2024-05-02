import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/screens/auth/signin_screen.dart';
import 'package:senior_project_ruccab/screens/book_ride_main_screen.dart';
import 'package:senior_project_ruccab/screens/car_ride_screen.dart';
import '../constant.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int selectedIndex = 0;
  CarouselController controller = CarouselController();
  Widget firstPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 370,
            child: Image.asset(
              'assets/images/request_ride.png',
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Request Ride',
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            width: 350,
            child: Text(
              'Request a ride get picked up by a nearby driver',
              style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 0.5),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget secondPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/tracking.png',
            width: 370,
          ),
          const Text(
            'Realtime Tracking',
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            width: 370,
            child: Text(
              'Know your driver in advance and be able to view current location real on the map',
              style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/earn_money.png',
            width: 370,
          ),
          const Text(
            'Earn Money',
            style: TextStyle(
                color: mainColor, fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            width: 340,
            child: Text(
              'Give Rides to nearby passenger, use promo codes & earn money.',
              style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 0.5),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: kIsWeb
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 500,
                    child: CarouselSlider(
                      carouselController: controller,
                      items: [firstPage(), secondPage(), thirdPage()],
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        aspectRatio: 0.7,
                        viewportFraction: 1.1,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 400),
                        scrollDirection: Axis.horizontal,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                            controller.jumpToPage(0);
                          });
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: selectedIndex == 0 ? mainColor : darkGrey,
                              shape: BoxShape.circle),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                            controller.jumpToPage(1);
                          });
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: selectedIndex == 1 ? mainColor : darkGrey,
                              shape: BoxShape.circle),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                            controller.jumpToPage(2);
                          });
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: selectedIndex == 2 ? mainColor : darkGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex < 2) {
                          selectedIndex++;
                          controller.jumpToPage(selectedIndex);
                        } else {
                          sharedPrefenrece.setString("initial", 'false');
                          sharedPrefenrece.getString('signed') == 'true'
                              ? sharedPrefenrece.getString('role') == 'driver'
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CarRideScreen(),
                                      ),
                                      (route) => false)
                                  : Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookRideMainScreen(),
                                      ),
                                      (route) => false)
                              : Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ),
                                  (route) => false);
                        }
                      });
                    },
                    child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 2 ? mainColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          selectedIndex == 2 ? 'Get Started' : 'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedIndex == 2 ? Colors.white : darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                  child: CarouselSlider(
                    carouselController: controller,
                    items: [firstPage(), secondPage(), thirdPage()],
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      aspectRatio: 0.7,
                      viewportFraction: 1.1,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 400),
                      scrollDirection: Axis.horizontal,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                          controller.jumpToPage(0);
                        });
                      },
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: selectedIndex == 0 ? mainColor : darkGrey,
                            shape: BoxShape.circle),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                          controller.jumpToPage(1);
                        });
                      },
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: selectedIndex == 1 ? mainColor : darkGrey,
                            shape: BoxShape.circle),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                          controller.jumpToPage(2);
                        });
                      },
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2 ? mainColor : darkGrey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedIndex < 2) {
                        selectedIndex++;
                        controller.jumpToPage(selectedIndex);
                      } else {
                        sharedPrefenrece.setString("initial", 'false');
                        sharedPrefenrece.getString('signed') == 'true'
                            ? sharedPrefenrece.getString('role') == 'driver'
                                ? Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CarRideScreen(),
                                    ),
                                    (route) => false)
                                : Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           BookRideMainScreen(),
                                    ),
                                    (route) => false)
                            : Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                                (route) => false);
                      }
                    });
                  },
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 2 ? mainColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        selectedIndex == 2 ? 'Get Started' : 'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedIndex == 2 ? Colors.white : darkGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
