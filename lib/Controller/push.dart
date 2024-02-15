import 'package:flutter/material.dart';


void main() {
  runApp(
    GetMaterialApp(
      home: MyWidget(),
    ),
  );
}

Widget GetMaterialApp({required MyWidget home}) {
}
class Controller1 extends GetxController {

  void addCounter() {
    counter.value++;
  }
}

class Controller2 extends GetxController {
;
  }
}
class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final controller1 = Get.put(Controller1());
  final controller2 = Get.put(Controller2());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => (
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => controller1.addCounter(),
                  child: const Text(
                    //controller1.counter.toString(),
                      "Controller-1"),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () => controller2.addCounter(),
                  child: const Text(
                    //controller1.counter.toString(),
                      "Controller-2"),
                ),
                const Divider(),
                Text(
                  "Controller-1 = ${controller1.counter.value}",
                ),
                Text(
                  "Controller-2 = ${controller2.counter.value}",
                ),
                Text(
                  "C1 / C2 = ${controller1.counter.value / controller2.counter.value}",
                ),
              ],
            ),
          )
      )),
    );
  }
}