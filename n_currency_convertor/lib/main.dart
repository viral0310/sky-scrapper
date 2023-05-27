import 'package:flutter/material.dart';
import 'package:n_currency_convertor/screens/home.dart';
import 'package:n_currency_convertor/screens/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xff8071e6))),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
      },
    ),
  );
}
