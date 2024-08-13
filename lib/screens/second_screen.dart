import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'third_screen.dart';
import 'first_screen.dart';
import '../controllers/home_controller.dart';
import '../controllers/user_controller.dart';

class SecondScreen extends StatelessWidget {
  final HomeController homeController = Get.find();
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.blue[200]), // Ganti ikon dengan yang diinginkan
          onPressed: () {
            Get.to(FirstScreen()); // Kembali ke First Screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text("Welcome"),
                //const SizedBox(height: 5),
                Obx(() => Text(
                      "${homeController.name.value}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Obx(
                () => Text(
                  "Selected User Name ${userController.selectedUserName.value}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(ThirdScreen());
                  },
                  child: const Text(
                    "Choose a User",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x2B637B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
