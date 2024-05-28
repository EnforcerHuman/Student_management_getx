// import 'package:flutter/material.dart';
// import 'package:studentapp/db_function/function.dart';
// import 'package:studentapp/db_model/model.dart';

// class AddStudentProvider extends ChangeNotifier {
//   List<studentmodel> studentlist = [];
//   studentmodel? studentdetails;
//   List<studentmodel> searchedstudents = [];
//   Future<void> addstudent(studentmodel student) async {
//     await addStudent(student.age, student.name, student.email, student.phone,
//         student.id, student.image);
//     fetchstudentProvider();
//     notifyListeners();
//   }

//   Future<void> fetchstudentProvider() async {
//     studentlist = await printAllStudents();
//     notifyListeners();
//   }

//   Future<void> deleteStudentProvider(int id, index) async {
//     await deletestudent(id);
//     await fetchstudentProvider();
//   }

//   Future<void> editstudentprovider(
//       int id, age, name, email, phone, image) async {
//     await editStudent(id, age, name, email, phone, image);
//     notifyListeners();
//   }

//   Future<void> getsinglestudentprovider(int id) async {
//     studentdetails = await getStudentDetails(id);
//     notifyListeners();
//   }

//   Future<void> searchStudentProvider(String query) async {
//     searchedstudents = await searchStudents(query);
//     notifyListeners();
//   }
// }
