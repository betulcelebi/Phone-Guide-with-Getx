import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phone_guide_book_getx/controller/app_controller.dart';
import 'package:phone_guide_book_getx/model/guide_book_model.dart';
import 'package:phone_guide_book_getx/view/add_person_screen.dart';

class HomeScreen extends StatelessWidget {
  AppController appController = Get.put(AppController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: appController.guide.value.length,
              itemBuilder: (context, index) {
                GuideModel model = appController.guide.value[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                    title: Text(model.name),
                    subtitle: Text(model.number),
                    trailing: IconButton(
                        onPressed: () {
                          appController.deleteGuide(model);
                        },
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red.shade400,
                        )),
                  ),
                );
              },
            ),
          )),
          MaterialButton(
              onPressed: () {
                Get.to(AddPersonScreen());
              },
              child: Text(
                "Add Person",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple,
              minWidth: 200),
        ],
      ),
    );
  }
}
