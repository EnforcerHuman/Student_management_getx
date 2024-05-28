import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Controllers/add_student_controller.dart';
import 'package:studentapp/Controllers/image_controlller.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/widgets/student_detail_text.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final studentmodel name;
  const DetailScreen({super.key, required this.index, required this.name});
  @override
  Widget build(BuildContext context) {
    final AddStudentController controller = Get.find();
    final ImageController imagecontroller = Get.find();
    var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.red.withOpacity(0.90),
        ),
        body: Obx(() => Column(
              children: [
                Center(
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                          backgroundImage: FileImage(File(
                              controller.studentList[index].image ?? '')))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.withOpacity(0.40),
                  ),
                  width: 350,
                  height: 400,
                  child: Center(
                    child: Column(
                      children: [
                        StudentdetailText(
                          text: controller.studentList[index].name,
                          leading: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: controller.studentList[index].email,
                          leading: 'Place',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: controller.studentList[index].age,
                          leading: 'Age',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: controller.studentList[index].phone,
                          leading: 'Phone',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                            text: controller.studentList[index].id.toString(),
                            leading: 'Student Id'),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: Row(
                            children: [
                              CupertinoButton(
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    imagecontroller.setImage(File(
                                        controller.studentList[index].image!));
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (ctx) => AddStudent(
                                                  title: 'Edit Details',
                                                  name: controller
                                                      .studentList[index].name,
                                                  age: controller
                                                      .studentList[index].age,
                                                  place: controller
                                                      .studentList[index].email,
                                                  phone: controller
                                                      .studentList[index].phone,
                                                  id: controller
                                                      .studentList[index].id,
                                                )));
                                  }),
                              CupertinoButton(
                                  color: Color.fromRGBO(223, 217, 163, 1)
                                      .withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Text('Delete'),
                                  onPressed: () {
                                    controller.deleteStudentgetx(
                                        controller.studentList[index].id);
                                    Get.back();
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
