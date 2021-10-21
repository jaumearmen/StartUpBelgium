import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:startup/ui/login/sign_in2.dart';
import 'package:startup/ui/login/sign_in_view.dart';
import 'package:startup/ui/login/splash_screen.dart';
import 'package:startup/globals.dart' as globals;
import 'package:startup/ui/widgets/testing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U JOYN',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/login2',
      routes: {
        '/login': (context) => SignInView(),
        '/login2': (context) => SignIn2(),
        '/splash': (context) => SplashScreen(),
        '/testing': (context) => Testing()
      },
    );
  }
}
