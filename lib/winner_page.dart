import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mathpuzzle/continue_page.dart';
import 'package:mathpuzzle/getx_class.dart';
import 'package:mathpuzzle/main.dart';

class winner_page extends StatelessWidget {
  const winner_page({super.key});

  @override
  Widget build(BuildContext context) {
    double selectpuzwidth = MediaQuery
        .of(context)
        .size
        .width;
    double selectpuzheight = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/background.jpg'), fit: BoxFit.cover)
      ), child: Scaffold(
      backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: min(selectpuzwidth * 0.05, selectpuzheight * 0.05)),
                  child: Text(
                    "PUZZLE ${getXclass.index1.value} COMPLETED",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "chalk",
                        fontSize:
                        min(selectpuzwidth * 0.07, selectpuzheight * 0.07)),
                  ),
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.all(selectpuzwidth * 0.12),
                  child: Image.asset("image/trophy.png"),
                ),
                GestureDetector(
                  onTap: () {
                    getXclass.ans.value='';
                    Get.off(continue_page());
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: min(selectpuzheight * 0.5, selectpuzwidth * 0.5),
                      height: min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Colors.white,
                          Colors.grey,
                        ]),
                      ),
                      child: Text("CONTINUE")),
                ),
                SizedBox(
                  height: min(selectpuzheight * 0.033, selectpuzwidth * 0.033),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(home_page());
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: min(selectpuzheight * 0.5, selectpuzwidth * 0.5),
                      height: min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Colors.white,
                          Colors.grey,
                        ]),
                      ),
                      child: Text("MAIN MENU")),
                ),
                SizedBox(
                  height: min(selectpuzheight * 0.033, selectpuzwidth * 0.033),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: min(selectpuzheight * 0.5, selectpuzwidth * 0.5),
                    height: min(selectpuzheight * 0.1, selectpuzwidth * 0.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      gradient: LinearGradient(colors: [
                        Colors.grey,
                        Colors.white,
                        Colors.grey,
                      ]),
                    ),
                    child: Text("BUY PRO")),
              ]),
            ),
          ),
        )),
    );
  }
}
