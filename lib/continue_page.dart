import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathpuzzle/getx_class.dart';
import 'package:mathpuzzle/winner_page.dart';

import 'main.dart';

class continue_page extends StatelessWidget {
  getXclass onint = Get.put(getXclass());
  int? opsindex;

  final DateTime dateTime = DateTime.now();

  continue_page({super.key, this.opsindex}) {}

  late double selectpuzwidth;
  late double selectpuzheight;
  late Timer _timer;
  static RxInt remainingSeconds = 0.obs;

  @override
  Widget build(BuildContext context) {
    getXclass.srf!.setString("${getXclass.index1.value}", "current");
    getXclass.lavels[getXclass.index1.value] = "current";
    selectpuzwidth = MediaQuery.of(context).size.width;
    selectpuzheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height:
                    min(selectpuzheight * 0.3, selectpuzwidth * 0.3),
                    width:
                    min(selectpuzheight * 0.3, selectpuzwidth * 0.3),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/level_board.png"))),
                    child: opsindex != null
                        ? getText(title: "LAVEL ${opsindex}")
                        : Obx(
                          () => getText(
                          title:
                          "LAVEL ${getXclass.index1.value + 1}"),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            min(selectpuzheight * 0.06, selectpuzwidth * 0.06)),
                    child: Container(
                        height:
                            min(selectpuzheight * 0.8, selectpuzwidth * 0.8),
                        width: max(selectpuzheight * 0.5, selectpuzwidth * 0.5),
                        alignment: Alignment.center,
                        child: opsindex != null
                            ? Image(
                                image: AssetImage("levels/p${opsindex}.png"))
                            : Obx(
                                () => Image(
                                    image: AssetImage(
                                        "levels/p${getXclass.index1.value + 1}.png")),
                              ))),
              ],
            ),
            Container(
              color: Colors.black,
              height: min(selectpuzheight * 0.3, selectpuzwidth * 0.3),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Obx(
                          () => Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.white,
                              height: min(
                                  selectpuzheight * 0.1, selectpuzwidth * 0.1),
                              width: min(
                                  selectpuzheight * 0.1, selectpuzwidth * 0.1),
                              child: Text(
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                getXclass.ans.value,
                              )),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                if (getXclass.ans.value.length > 0) {
                                  getXclass.ans.value = getXclass.ans.value
                                      .substring(
                                          0, getXclass.ans.value.length - 1);
                                }
                              },
                              icon: Image.asset("image/delete.png"))),
                      Expanded(
                          flex: 2,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey)),
                            onPressed: () {
                              if (opsindex == null&&getXclass.ans.value.isNotEmpty) {
                                getXclass.srf!.setString(
                                    "${getXclass.index1.value}", "clear");
                                getXclass.lavels[getXclass.index1.value] =
                                    "clear";
                                getXclass.index1.value++;
                                getXclass.srf!
                                    .setInt("lavel", getXclass.index1.value);
                                Get.off(winner_page());
                              } else {
                                if(getXclass.ans.value.isNotEmpty){
                                  getXclass.ans.value='';
                                  getXclass.srf!
                                      .setString("${opsindex! - 1}", "clear");
                                  getXclass.lavels[opsindex! - 1] = "clear";
                                  Get.off(home_page());
                                }
                              }
                            },
                            child: Text("SUBMIT",
                                style: TextStyle(
                                  fontSize: min(selectpuzheight * 0.02,
                                      selectpuzwidth * 0.02),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "chalk",
                                )),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "1";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "2";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "3";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "4";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("4",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "5";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("5",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "6";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("6",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "7";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("7",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "8";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("8",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "9";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("9",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getXclass.ans.value += "0";
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width:
                              min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                          height: min(
                              selectpuzheight * 0.13, selectpuzwidth * 0.13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.red,
                              )),
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget getImage() {
  //   return
  // }

  Widget getText({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: min(selectpuzheight * 0.04, selectpuzwidth * 0.04),
      ),
    );
  }

  void startCountdown() {
    if (remainingSeconds.value == 60) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
        } else {
          _timer.cancel();
        }
      });
    }
  }

  String ConverTime(int second) {
    int hour = second ~/ 3600;
    int minutes = (second % 3600) ~/ 60;
    int seconds = second % 60;

    String finalTime = "${hour} : ${minutes} : ${seconds}";
    return finalTime;
  }
}
