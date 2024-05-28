// import 'package:flutter/widgets.dart';
// import 'package:studentapp/Screens/add_student.dart';

// Route createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => AddStudent(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = 0.0;
//       const end = 1.0;
//       const curve = Curves.ease;

//       final tween = Tween(begin: begin, end: end);
//       final curvedAnimation = CurvedAnimation(
//         parent: animation,
//         curve: curve,
//       );

//       return FadeTransition(
//         opacity: tween.animate(curvedAnimation),
//         child: child,
//       );
//     },
//   );
// }
