import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

Future<Map<String, dynamic>> loadStudentData() async {
  final jsonString = await rootBundle.loadString(
    'assets/data/student_data.json',
  );
  return jsonDecode(jsonString) as Map<String, dynamic>;
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
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/profile.png', // sesuaikan ekstensi
                        width: 120,
                        height: 120,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.blue,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Achmad Dhanil Ahkam',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'NIM: 2415051049',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatCard('8', 'Widget'),
                          buildStatCard('4', 'Layout'),
                          buildStatCard('1', 'State'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Text(
                          'Ringkasan: 2415051049 - Achmad Dhanil Ahkam\n'
                          'Flutter UI Fundamentals',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const GreetingCard(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TopicListPage(),
                            ),
                          );
                        },
                        child: const Text('Lihat Daftar Materi'),
                      ),

                      // Tahap 13
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardPage(),
                            ),
                          );
                        },
                        child: const Text('Lihat Learning Dashboard'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildStatCard(String value, String label) {
  return Expanded(
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    ),
  );
}

class GreetingCard extends StatefulWidget {
  const GreetingCard({super.key});

  @override
  State<GreetingCard> createState() => _GreetingCardState();
}

class _GreetingCardState extends State<GreetingCard> {
  final TextEditingController controller = TextEditingController();
  String message = 'Belum ada pesan';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showMessage() {
    setState(() {
      message = controller.text.trim().isEmpty
          ? 'Input masih kosong'
          : controller.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '2415051049 - Achmad Dhanil Ahkam',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tulis pesan di sini',
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _showMessage,
          child: const Text('Tampilkan'),
        ),
        const SizedBox(height: 8),
        Text(message),
      ],
    );
  }
}

final List<Map<String, dynamic>> topics = [
  {'title': 'Git & GitHub', 'subtitle': 'Version control', 'done': true},
  {'title': 'Dart Fundamentals', 'subtitle': 'Language basics', 'done': true},
  {
    'title': 'Flutter UI Fundamentals',
    'subtitle': 'Widgets & layout',
    'done': false,
  },
  {
    'title': '2415051049 - Achmad Dhanil Ahkam',
    'subtitle': 'Pemilik aplikasi',
    'done': false,
  },
];

class TopicListPage extends StatelessWidget {
  const TopicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int completed = topics.where((item) => item['done'] == true).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Materi')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '2415051049 - Achmad Dhanil Ahkam',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text('$completed dari ${topics.length} topik selesai'),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: topics.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = topics[index];
                final bool done = item['done'] == true;
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListTile(
                    leading: Icon(
                      done ? Icons.check_circle : Icons.schedule,
                      color: done ? Colors.green : Colors.orange,
                    ),
                    title: Text(item['title'] as String),
                    subtitle: Text(item['subtitle'] as String),
                    trailing: Text(
                      done ? 'Selesai' : 'Belum',
                      style: TextStyle(
                        color: done ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Tahap 13
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<Map<String, dynamic>> studentFuture;

  @override
  void initState() {
    super.initState();
    studentFuture = loadStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Dashboard')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: studentFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Gagal memuat data: ${snapshot.error}'),
            );
          }

          final data = snapshot.data!;
          final student = data['student'] as Map<String, dynamic>;
          final courses = data['courses'] as List<dynamic>;

          return Column(
            children: [
              ListTile(
                title: Text(student['name'] as String),
                subtitle: Text(student['nim'] as String),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index] as Map<String, dynamic>;
                    return ListTile(
                      title: Text(course['title'] as String),
                      subtitle: Text(course['code'] as String),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}