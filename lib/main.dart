import 'package:flutter/material.dart';

const String studentName = 'Achmad Dhanil Ahkam';
const String studentId = '2415051049'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Fundamentals'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$studentId - $studentName',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Belajar Widget Tree',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Icon(
                Icons.widgets,
                size: 48,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}