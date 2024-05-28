import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Controllers/add_student_controller.dart';
import 'package:studentapp/Controllers/image_controlller.dart';
import 'package:studentapp/Screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentapp/db_model/model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(studentmodelAdapter().typeId)) {
    Hive.registerAdapter(studentmodelAdapter());
  }
  Get.put(AddStudentController());
  Get.put(ImageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
