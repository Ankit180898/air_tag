import 'package:air_tag/views/gyroscope_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AirTag',
      theme: ThemeData(
        
        useMaterial3: true,
      ),
      home: const GyroscopeView(),
    );
  }
}

