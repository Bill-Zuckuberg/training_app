import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_app/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _innitState() async {
    await DefaultAssetBundle.of(context)
        .loadString("../lib/json/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  initState() {
    super.initState();
    _innitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('your program',
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubTitle,
                    )),
                Expanded(child: Container()),
                Text(
                  'Detail',
                  style: TextStyle(
                      fontSize: 20, color: color.AppColor.homePageDetail),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9)
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(10, 10),
                        blurRadius: 20,
                        color: color.AppColor.gradientSecond.withOpacity(0.5))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Workout',
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Legs Tonong \nand Glutes Workout',
                    style: TextStyle(
                        fontSize: 30,
                        color: color.AppColor.homePageContainerTextBig),
                  ),
                  Expanded(child: Container()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.timer,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '60 min',
                        style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontSize: 14),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                  color: color.AppColor.gradientFirst,
                                  offset: const Offset(4, 8),
                                  blurRadius: 10)
                            ]),
                        child: Icon(
                          Icons.play_circle_fill,
                          color: color.AppColor.homePageContainerTextSmall,
                          size: 60,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              color:
                                  color.AppColor.gradientFirst.withOpacity(0.2),
                              offset: const Offset(3, 4)),
                          BoxShadow(
                              blurRadius: 30,
                              color:
                                  color.AppColor.gradientFirst.withOpacity(0.2),
                              offset: const Offset(-4, -5))
                        ],
                        image: const DecorationImage(
                            image: AssetImage('img/card.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    width: 150,
                    height: 120,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('img/figure.png'))),
                  ),
                  Container(
                      // color: Colors.red.withOpacity(0.2),
                      width: 240,
                      height: 100,
                      margin: const EdgeInsets.only(top: 30, left: 175),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You are doing great',
                            style: TextStyle(
                                color: color.AppColor.homePageDetail,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'keep it up \nstick to your plan',
                            style: TextStyle(
                                color: color.AppColor.homePagePlanColor,
                                fontSize: 16),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Text(
              'Area of Foucs',
              style: TextStyle(
                  color: color.AppColor.homePageTitle,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: (info.length / 2).round(),
                  itemBuilder: (conttext, i) {
                    int a = 2 * i;
                    int b = 2 * i + 1;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: 150,
                          margin: const EdgeInsets.only(left: 30, bottom: 20),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                    blurRadius: 3,
                                    offset: const Offset(5, 5)),
                                BoxShadow(
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5)),
                              ],
                              image: DecorationImage(
                                  image: AssetImage(info[a]["img"]))),
                          child: Center(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]["title"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.homePageDetail),
                                )),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: 150,
                          margin: const EdgeInsets.only(bottom: 20, right: 30),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                    blurRadius: 3,
                                    offset: const Offset(5, 5)),
                                BoxShadow(
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                    blurRadius: 3,
                                    offset: const Offset(-5, -5)),
                              ],
                              image: DecorationImage(
                                  image: AssetImage(info[b]["img"]))),
                          child: Center(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]["title"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.homePageDetail),
                                )),
                          ),
                        ),
                      ],
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
