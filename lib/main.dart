import 'package:firebase_april_25/controller/add_student_screen_controller.dart';
import 'package:firebase_april_25/controller/home_screen_controller.dart';
import 'package:firebase_april_25/controller/login_controller.dart';
import 'package:firebase_april_25/controller/register_controller.dart';
import 'package:firebase_april_25/firebase_options.dart';
import 'package:firebase_april_25/veiw/home_screen/home_screen.dart';
import 'package:firebase_april_25/veiw/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(
          create: (context) => AddStudentScreenController(),
        ),
      ],
      child: MaterialApp(home: SplashScreen()),
    );
  }
}
