import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phone_guide_book_getx/controller/app_controller.dart';
import 'package:phone_guide_book_getx/model/guide_book_model.dart';

class AddPersonScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Add Person"),
        //  actions: [IconButton(onPressed: () {
        //   Get.changeTheme(appController.temaDegistir());

        // }, icon: Icon(Icons.light_mode_sharp), iconSize: 20,)],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter your name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter your phone number"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter your e-mail"),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                GuideModel model = GuideModel(
                    name: nameController.text,
                    number: numberController.text,
                    email: emailController.text);
                appController.addGuide(model);
              },
              child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
