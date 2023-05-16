import 'package:e_commerce/nav_switcher.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'boardingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/boarding.png"),
                  fit: BoxFit.cover)),
        ),
        IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          done: Container(
            width: 100,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "DONE",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MyTheme.darkGreyColor),
          ),
          onDone: () {
            Navigator.pushReplacementNamed(context, NavSwitcher.routeName);
          },
          animationDuration: 10,
          dotsDecorator: DotsDecorator(
              activeColor: MyTheme.darkGreyColor, color: Colors.white),
          next: Container(
            width: 50,
            height: 50,
            child: Icon(
              IconlyLight.arrow_right_2,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MyTheme.darkGreyColor),
          ),
          pages: [
            PageViewModel(
                useScrollView: false,
                decoration: PageDecoration(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: MyTheme.darkGreyColor),
                  bodyAlignment: Alignment.bottomCenter,
                  imageFlex: 2,
                  bodyTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: 17,
                          color: Colors.black54),
                ),
                body: "all your personal details and information are safe",
                image: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SafeArea(
                      child: Image.asset(
                        "assets/images/boarding1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                title: "Secured and Fast Payment"),
            PageViewModel(
                useScrollView: false,
                decoration: PageDecoration(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: MyTheme.darkGreyColor),
                  bodyAlignment: Alignment.bottomCenter,
                  imageFlex: 2,
                  bodyTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: 17,
                          color: Colors.black54),
                ),
                body: "Find and cart all your needs by one click",
                image: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SafeArea(
                        child: Image.asset("assets/images/boarding2.png")),
                  ),
                ),
                title: "All Products in One Place"),
            PageViewModel(
                useScrollView: false,
                decoration: PageDecoration(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: MyTheme.darkGreyColor),
                  bodyAlignment: Alignment.bottomCenter,
                  imageFlex: 2,
                  bodyTextStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: 17,
                          color: Colors.black54),
                ),
                body: "Just few time and your stuff we be in your hands",
                image: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  padding: EdgeInsets.all(50),
                  child: Image.asset("assets/images/boarding3.png"),
                ),
                title: "Fast and Secure Delivery"),
          ],
        ),
      ]),
    );
  }
}
