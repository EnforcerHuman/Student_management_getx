import 'package:get/get.dart';
import 'package:studentapp/Controllers/add_student_controller.dart';
import 'package:studentapp/db_model/model.dart';

Future<void> addOrEdit(
    String title, context, studentmodel student, int id) async {
  final AddStudentController controller = Get.find();
  if (title == 'Edit Details') {
    controller.editStudentGetx(id, student.age, student.name, student.email,
        student.phone, student.image!);
  } else if (title == 'Add student') {
    await controller.addStudentGetx(student);
  }
}
