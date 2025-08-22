import 'package:flutter/material.dart';

import 'Pages/login.dart';
import 'Pages/home_null.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        
      },
    );
  }
}
