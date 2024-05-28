import 'package:get/get.dart';
import 'package:studentapp/db_function/function.dart';
import 'package:studentapp/db_model/model.dart';

class AddStudentController extends GetxController {
  var studentList = <studentmodel>[].obs;
  var studentDetails = Rxn<studentmodel>();
  var searchedStudents = <studentmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> addStudentGetx(studentmodel student) async {
    await addStudent(student.age, student.name, student.email, student.phone,
        student.id, student.image);
    await fetchStudents();
  }

  Future<void> fetchStudents() async {
    var students = await printAllStudents();
    studentList.value = students;
  }

  Future<void> deleteStudentgetx(int id) async {
    await deletestudent(id);
    await fetchStudents();
  }

  Future<void> editStudentGetx(int id, String age, String name, String email,
      String phone, String image) async {
    await editStudent(id, age, name, email, phone, image);
    await fetchStudents();
  }

  Future<void> getSingleStudent(int id) async {
    var student = await getStudentDetails(id);
    studentDetails.value = student;
  }

  Future<void> searchStudentsgetx(String query) async {
    var results = await searchStudents(query);
    searchedStudents.value = results;
  }
}
