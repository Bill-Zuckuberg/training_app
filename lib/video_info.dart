import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_app/colors.dart' as color;
import 'package:training_app/separator.dart';

class VideosInfo extends StatefulWidget {
  const VideosInfo({Key? key}) : super(key: key);

  @override
  _VideosInfoState createState() => _VideosInfoState();
}

class _VideosInfoState extends State<VideosInfo> {
  List videoInfo = [];

  _inniState() {
    DefaultAssetBundle.of(context)
        .loadString("../lib/json/info_videos.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _inniState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        color.AppColor.gradientFirst,
        color.AppColor.gradientSecond.withOpacity(0.9)
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.8),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Legs Toning \nand Glutes Workoyt',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Container(
                      width: 95,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              color
                                  .AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor
                            ],
                          )),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.timer_sharp,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '68 min',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor
                                    .secondPageContainerGradient1stColor,
                                color.AppColor
                                    .secondPageContainerGradient2ndColor
                              ],
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.handyman_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Resistent band, kettebell',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Circuit 1 : Legs Toning',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.loop,
                        color: color.AppColor.loopColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '3 sets',
                        style: TextStyle(
                            color: color.AppColor.homePagePlanColor,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: videoInfo.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              videoInfo[index]["thumbnail"]),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videoInfo[index]["title"],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      videoInfo[index]["time"],
                                      style: TextStyle(
                                          color:
                                              color.AppColor.homePagePlanColor,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: color.AppColor
                                          .secondPageContainerGradient1stColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      '15s rest',
                                      style: TextStyle(
                                          color:
                                              color.AppColor.homePageSubTitle,
                                          fontSize: 12,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                const Expanded(child: MySeparator())
                              ],
                            )
                          ]);
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
