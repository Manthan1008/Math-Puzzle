import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mathpuzzle/continue_page.dart';
import 'package:mathpuzzle/getx_class.dart';

class puzzlespage extends StatelessWidget {
  puzzlespage({super.key});

  @override
  Widget build(BuildContext context) {
    double selectpuzwidth = MediaQuery.of(context).size.width;
    double selectpuzheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    "SELECT PUZZLES",
                    style: TextStyle(
                        fontSize:
                            min(selectpuzheight * 0.07, selectpuzwidth * 0.07),
                        fontWeight: FontWeight.bold,
                        fontFamily: "chalk"),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              child: GridView.builder(
                itemCount: getXclass.lavels.value.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        int.parse((selectpuzwidth * 0.008).floor().toString()),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  if (getXclass.lavels.value[index] == "clear") {
                    return Center(
                        child: GestureDetector(
                      onTap: () {
                        getXclass.ans.value='';
                        Get.off(continue_page(
                          opsindex: index + 1,
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/tick.png")),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black)),
                        height: 75,
                        width: 75,
                        child: Text("${index + 1}",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "chalk")),
                      ),
                    ));
                  } else if (getXclass.lavels[index] == "current") {
                    return Center(
                        child: GestureDetector(
                      onTap: () {
                        Get.off(continue_page(
                          opsindex: index + 1,
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black)),
                        height: 75,
                        width: 75,
                        child: Text("${index + 1}",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "chalk")),
                      ),
                    ));
                  } else if (getXclass.lavels[index] == "panding") {
                    return Center(
                        child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/lock.png")),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 75,
                      width: 75,
                    ));
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
