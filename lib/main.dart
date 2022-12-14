import 'package:flutter/material.dart';

import 'package:chat_app/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: appRoutes,
    );
  }
}
