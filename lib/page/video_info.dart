import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart' as color;
import 'package:training_app/separator.dart';
import 'package:video_player/video_player.dart';

class VideosInfo extends StatefulWidget {
  const VideosInfo({Key? key}) : super(key: key);

  @override
  _VideosInfoState createState() => _VideosInfoState();
}

class _VideosInfoState extends State<VideosInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool? _isPlaying = false;
  bool _dispose = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _playerController;

  _inniData() {
    DefaultAssetBundle.of(context)
        .loadString("json/info_videos.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _inniData();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
    _playerController?.pause();
    _playerController?.dispose();
    _playerController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          color.AppColor.gradientFirst,
          color.AppColor.gradientSecond.withOpacity(0.9)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Column(
          children: [
            _playArea == false ? _buildVideoInfoView() : _buildVideoView(),
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
                    Expanded(child: _buildListView())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildVideoInfoView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white.withOpacity(0.8),
                ),
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
                        color.AppColor.secondPageContainerGradient1stColor,
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
                          color.AppColor.secondPageContainerGradient1stColor,
                          color.AppColor.secondPageContainerGradient2ndColor
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
    );
  }

  _buildVideoView() {
    final controller = _playerController;

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => {
                  setState(() {
                    _playArea = false;
                  })
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.info_outline,
                color: Colors.white.withOpacity(0.8),
              )
            ],
          ),
          if (controller != null && controller.value.isInitialized)
            Column(
              children: [
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: VideoPlayer(controller),
                    )),
                _controllView(context)
              ],
            )
          else
            Container(
              child: const Center(
                child: Text(
                  "Preparing...",
                  style: TextStyle(color: Colors.white30, fontSize: 20),
                ),
              ),
            )
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                _buildCard(index),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                          color: color
                              .AppColor.secondPageContainerGradient1stColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '15s rest',
                          style: TextStyle(
                              color: color.AppColor.homePageSubTitle,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Expanded(child: MySeparator())
                  ],
                )
              ]));
        });
  }

  _controllView(BuildContext context) {
    final noMute = (_playerController?.value.volume ?? 0) > 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (noMute == true) {
                  _playerController?.setVolume(0);
                } else {
                  _playerController?.setVolume(1.0);
                }
              });
            },
            icon: Icon(
              noMute ? Icons.volume_up : Icons.volume_off,
              size: 36,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videoInfo.length >= 0) {
                initializeVideo(index);
              } else {
                Get.snackbar("Video", "No more video to play",
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            icon: const Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () async {
              setState(() {
                if (_isPlaying == false) {
                  _playerController?.play();
                  _isPlaying = true;
                } else {
                  _playerController?.pause();
                  _isPlaying = false;
                }
              });
            },
            icon: Icon(_isPlaying == true ? Icons.pause : Icons.play_arrow,
                size: 36, color: Colors.white)),
        IconButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index >= 0 &&
                  videoInfo.length >= 0 &&
                  index < videoInfo.length) {
                initializeVideo(index);
              } else {
                Get.snackbar("Video", "No more video to play",
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            icon: const Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            )),
        const Text(
          "00:15",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }

  _buildCard(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (_playArea == false) {
              _playArea = true;
              initializeVideo(index);
            }
          });
        },
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/img/thumbnail/" +
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
                        color: color.AppColor.homePagePlanColor,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ));
  }

  initializeVideo(int index) async {
    final controller = VideoPlayerController.network(videoInfo[index]["video"]);
    final old = _playerController;
    _playerController = controller;
    _isPlayingIndex = index;

    if (old != null) {
      old.removeListener(_onControllUpdate);
      old.pause();
    }

    setState(() {});

    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..initialize().then((value) {
        old?.dispose();
        // controller.play();
        setState(() {});
        controller.addListener(_onControllUpdate);
      });
  }

  var _onUpdateControllerTime;

  _onControllUpdate() async {
    final controller = _playerController;
    final playing = _playerController?.value.isPlaying;
    final now = DateTime.now().microsecondsSinceEpoch;
    _onUpdateControllerTime = 0;
    _isPlaying = playing;

    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    if (_dispose) {
      return;
    }

    if (controller == null) {
      debugPrint("[ Controller is Null ]");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("[ Controller can not be initialized ]");
      return;
    }
  }
}
