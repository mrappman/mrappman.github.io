import 'package:flutter/material.dart';
import 'package:maveli_mart/screens/navigation_wrapper.dart';

void main() {
  runApp(const MaveliMartApp());
}

 class MaveliMartApp extends StatelessWidget {
    const MaveliMartApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maveli Mart',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const MainNavigationWrapper(),
      );
    }
  }