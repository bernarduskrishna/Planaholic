import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plannus/screens/authenticate/SignIn.dart';
import 'package:plannus/screens/authenticate/SignUp.dart';
import 'package:plannus/services/AuthService.dart';
import 'package:plannus/screens/Wrapper.dart';
import 'package:provider/provider.dart';
import 'screens/home/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamProvider<User>.value(
          value: AuthService().user,
          initialData: null,
          child: Wrapper(),
        ),
        routes: {
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
        }
    );
  }
}
