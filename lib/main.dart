import 'package:flutter/material.dart';

// Identitas Mahasiswa
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
      title: 'Tahap 2: MediaQuery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MediaQueryDemoPage(),
    );
  }
}

class MediaQueryDemoPage extends StatelessWidget {
  const MediaQueryDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca informasi layar menggunakan MediaQuery
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final isCompact = size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 2: MediaQuery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Identitas
                  Text(
                    studentName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NIM: $studentId',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const Divider(height: 24),

                  // Informasi Karakteristik Layar dari MediaQuery
                  Text(
                    'Width: ${size.width.toStringAsFixed(1)} px',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Height: ${size.height.toStringAsFixed(1)} px',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Orientation: ${orientation.name.toUpperCase()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Kondisi Kategori Layar (Compact vs Wide)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isCompact
                          ? Colors.orange.shade100
                          : Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isCompact ? Colors.orange : Colors.teal,
                      ),
                    ),
                    child: Text(
                      'Layout Category: ${isCompact ? "Compact (< 600px)" : "Wide (>= 600px)"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCompact
                            ? Colors.orange.shade900
                            : Colors.teal.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}