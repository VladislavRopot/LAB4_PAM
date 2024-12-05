import 'package:flutter/material.dart';
import 'pages/barber_home_page.dart';

class BarberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber App',
      debugShowCheckedModeBanner: false,
      home: BarberHomePage(),
    );
  }
}
