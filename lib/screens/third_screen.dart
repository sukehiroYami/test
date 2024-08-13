import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujii/screens/second_screen.dart';
import '../controllers/user_controller.dart';

class ThirdScreen extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.blue[200]), // Ganti ikon dengan yang diinginkan
          onPressed: () {
            Get.to(SecondScreen()); // Kembali ke First Screen
          },
        ),
      ),
      body: Obx(() {
        if (userController.isLoading.value && userController.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (userController.users.isEmpty) {
          return const Center(child: Text("No Users Available"));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              userController.page.value = 1;
              userController.users.clear();
              userController.fetchUsers();
            },
            child: ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                var user = userController.users[index];
                return ListTile(
                  leading: Image.network(user.avatar),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    userController.selectUser(user);
                    Get.back();
                  },
                );
              },
            ),
          );
        }
      }),
    );
  }
}
