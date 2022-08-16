import 'package:flutter/material.dart';
import 'package:flutter_alcool_gasolina/home_screen.dart';

void main() =>
   runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    ),
  );

