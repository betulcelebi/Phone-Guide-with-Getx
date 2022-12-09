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
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Phone Guide App"),
        actions: [IconButton(onPressed: () {
          appController.temaDegistir();
          
        }, icon: Icon(Icons.light_mode_sharp), iconSize: 20,)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Expanded(
                child: Obx(
              () => ListView.builder(
                itemCount: appController.guide.value.length,
                itemBuilder: (context, index) {
                  GuideModel model = appController.guide.value[index];

                  return Container(
                    padding: EdgeInsets.all(0),
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
            InkWell(
                onTap: () {
                Get.to(() => AddPersonScreen());
              },
              child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Add Person",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
