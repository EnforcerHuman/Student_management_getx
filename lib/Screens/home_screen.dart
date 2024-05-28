import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Controllers/add_student_controller.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/Screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddStudentController controller = Get.find<AddStudentController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            // Example action for the leading icon
          },
          icon: const Icon(Icons.access_alarm_outlined),
        ),
        title: const Center(child: Text('Student Data')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SearchScreen()));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          controller.fetchStudents();
          return const Center(child: Center(child: Text("Add Students")));
        }

        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final student = controller.studentList[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => DetailScreen(
                    name: student,
                    index: index,
                  ),
                ));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: student.image != null
                      ? FileImage(File(student.image!))
                      : const AssetImage('assets/images/student.png'),
                ),
                title: Text(student.name),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AddStudent(
                          title: 'Edit Details',
                          name: student.name,
                          age: student.age,
                          place: student.email,
                          phone: student.phone,
                          id: student.id,
                        ),
                      ));
                    } else if (value == 2) {
                      controller.deleteStudentgetx(student.id);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Delete'),
                    ),
                  ],
                  child: Icon(Icons.more_vert),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AddStudent(
                title: 'Add student',
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, -1.0); // Slide in from the top
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end);
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );

              return SlideTransition(
                position: tween.animate(curvedAnimation),
                child: child,
              );
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
