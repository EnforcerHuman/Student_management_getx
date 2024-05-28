import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentapp/db_model/model.dart';

List<studentmodel> studentlistnormal = [];

Future<void> addStudent(String age, String name, String email, String phone,
    int id, String? image) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final student = studentmodel(
      age: age, name: name, email: email, phone: phone, id: id, image: image);
  final test = await studentBox.put(id, student);
  return test;
}

Future<List<studentmodel>> printAllStudents() async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final List<studentmodel> students = studentBox.values.toList();
  for (var student in students) {
    studentlistnormal.add(student);
  }

  return students;
}

Future<void> deletestudent(int id) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  await studentBox.delete(id);
}

Future<void> editStudent(int id, String age, String name, String email,
    String phone, String image) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');

  // If the name has changed, delete the old entry

  final student = studentmodel(
      age: age, name: name, email: email, phone: phone, id: id, image: image);
  await studentBox.put(id, student);
}

Future<List<studentmodel>> searchStudents(String query) async {
  final students = await printAllStudents();
  return students
      .where(
          (student) => student.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
}

Future<studentmodel?> getStudentDetails(int id) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final student = studentBox.get(id);

  if (student != null) {
    return student;
  } else {
    return null; // Return null if student not found
  }
}
