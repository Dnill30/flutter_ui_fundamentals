// Tahap 15: Debugging Challenge
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

Future<Map<String, dynamic>> loadStudentData() async {
  // Untuk menguji Kasus C (Error State), ubah sementara path di bawah ini menjadi nama file yang salah
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
      title: 'Learning Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

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
    const String studentId = '2415051049';
    const String studentName = 'Achmad Dhanil Ahkam';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: studentFuture,
          builder: (context, snapshot) {
            // Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error State (Pengujian Kasus C)
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 48),
                      const SizedBox(height: 8),
                      Text(
                        'Error Memuat JSON:\n${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('Data tidak ditemukan'));
            }

            final data = snapshot.data!;
            final student = data['student'] as Map<String, dynamic>;
            final courses = data['courses'] as List<dynamic>;

            final int totalSks = courses.fold<int>(
              0,
              (sum, item) => sum + (item['credits'] as int),
            );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DEMO PERBAIKAN KASUS A (RenderFlex Overflow Solved with Expanded)
                  Card(
                    color: Colors.amber.shade100,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.bug_report, color: Colors.amber),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '$studentId - $studentName - Solved: Expanded dipasang pada Row untuk mencegah RenderFlex Overflow.',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  ProfileIdentityCard(student: student),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SummaryCard(
                        title: 'Total Matakuliah',
                        value: '${courses.length} MK',
                        icon: Icons.book,
                        color: Colors.blue.shade100,
                      ),
                      const SizedBox(width: 8),
                      SummaryCard(
                        title: 'Total SKS',
                        value: '$totalSks SKS',
                        icon: Icons.credit_score,
                        color: Colors.green.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Daftar Matakuliah:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index] as Map<String, dynamic>;
                        return CourseItemCard(course: course);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileIdentityCard extends StatelessWidget {
  final Map<String, dynamic> student;

  const ProfileIdentityCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.blue.shade50,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          student['name'] as String? ?? 'Nama Mahasiswa',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          'NIM: ${student['nim']} | ${student['class'] ?? ''}\n${student['program'] ?? ''}',
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, size: 28, color: Colors.black87),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItemCard extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseItemCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final String status = course['status'] as String? ?? 'upcoming';
    final bool isDone = status == 'done';
    final bool isActive = status == 'active';

    Color statusColor = Colors.orange;
    IconData statusIcon = Icons.hourglass_empty;

    if (isDone) {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
    } else if (isActive) {
      statusColor = Colors.blue;
      statusIcon = Icons.play_circle_fill;
    }

    final String dosen = course['dosen'] as String? ?? '-';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(statusIcon, color: statusColor, size: 30),
        title: Text(
          course['title'] as String? ?? 'Matakuliah',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Kode: ${course['code']} | SKS: ${course['credits']}\n'
          'Dosen: $dosen',
        ),
        isThreeLine: true,
        trailing: Chip(
          label: Text(
            status.toUpperCase(),
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
          backgroundColor: statusColor,
        ),
      ),
    );
  }
}