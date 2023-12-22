import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mathpuzzle/continue_page.dart';
import 'package:mathpuzzle/getx_class.dart';
import 'package:mathpuzzle/puzzlespage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: home_page(),
  ));
}

class home_page extends StatelessWidget {
  home_page({super.key});

  getXclass getx = Get.put(getXclass());
  RxBool boxdecorcon = false.obs;

  RxBool boxdecorpuz = false.obs;

  RxBool boxdecorbup = false.obs;

  @override
  Widget build(BuildContext context) {
    double selectpuzwidth = MediaQuery.of(context).size.width;
    double selectpuzheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "MATH PUZZLES",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 40,
                        fontFamily: "chalk",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                alignment: Alignment.center,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/blackboard_main_menu.png"),
                        fit: BoxFit.fill)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Listener(
                        onPointerDown: (details) {
                          boxdecorcon.value = true;
                        },
                        onPointerUp: (details) {
                          boxdecorcon.value = false;

                          Get.to(continue_page());
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(10),
                            decoration: boxdecorcon.value
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.white))
                                : null,
                            child: Text("CONTINUE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "chalk",
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Divider(),
                      Listener(
                        onPointerDown: (details) {
                          boxdecorpuz.value = true;
                          Get.to(puzzlespage());
                        },
                        onPointerUp: (details) {
                          boxdecorpuz.value = false;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(10),
                            decoration: boxdecorpuz.value
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.white))
                                : null,
                            child: Text("PUZZLES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "chalk",
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Divider(),
                      Listener(
                        onPointerDown: (details) {
                          boxdecorbup.value = true;
                        },
                        onPointerUp: (details) {
                          boxdecorbup.value = false;
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.all(10),
                            decoration: boxdecorbup.value
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.white))
                                : null,
                            child: Text("BUY PRO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "chalk",
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ad valu
                    Column(
                      children: [
                        Text("AD",
                            style: TextStyle(
                                color: Colors.indigoAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/ltlicon.png"),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),

                    //policy ,shere
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                                gradient: LinearGradient(colors: [
                                  Colors.grey,
                                  Colors.white,
                                  Colors.grey,
                                ]),
                              ),
                              child: Image(
                                  image: AssetImage("image/shareus.png"),
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                                gradient: LinearGradient(colors: [
                                  Colors.grey,
                                  Colors.white,
                                  Colors.grey,
                                ]),
                              ),
                              child: Image(
                                  color: Colors.black,
                                  image: AssetImage("image/emailus.png"),
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid)),
                          alignment: Alignment.center,
                          child: Text("PRIVATE POLICY",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15)),
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
