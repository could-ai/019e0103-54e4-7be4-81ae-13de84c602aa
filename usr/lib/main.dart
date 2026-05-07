import 'package:flutter/material.dart';
import 'screens/calendar_screen.dart';
import 'screens/day_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Story Posting Calendar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CalendarScreen(),
        '/day_detail': (context) => const DayDetailScreen(),
      },
    );
  }
}
