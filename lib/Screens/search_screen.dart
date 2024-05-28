import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Controllers/add_student_controller.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/db_model/model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  String searchQuery = '';

  List<studentmodel> searchResults = [];

  @override
  Widget build(BuildContext context) {
    // final studentProvider = Provider.of<AddStudentProvider>(context);
    final AddStudentController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              placeholder: 'Search Students...',
              onChanged: (value) {
                controller.searchStudentsgetx(value);
              },
            ),
            Expanded(
                child: Obx(() => controller.searchedStudents.isEmpty
                    ? ListView.builder(
                        itemCount: controller.studentList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading:
                                  Text(controller.studentList[index].name));
                        })
                    : ListView.builder(
                        itemCount: controller.searchedStudents.length,
                        itemBuilder: (context, index) {
                          final student = controller.searchedStudents[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => DetailScreen(
                                  index: index,
                                  name: student,
                                ),
                              ));
                            },
                            child: ListTile(
                              title: Text(student.name),
                              // Add other student details as needed
                            ),
                          );
                        },
                      ))),
          ],
        ),
      ),
    );
  }
}
