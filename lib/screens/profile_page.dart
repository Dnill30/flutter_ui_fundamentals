import 'package:flutter/material.dart';
import '../widgets/student_header.dart';
import '../models/course.dart';

class Stage15ProfileFeedbackPage extends StatelessWidget {
  const Stage15ProfileFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StudentHeaderWidget(title: 'Profil Mahasiswa'),
          SizedBox(height: 20),
          ValueNotifierDemo(),
          SizedBox(height: 20),
          CourseModelDemo(),
        ],
      ),
    );
  }
}

class CourseModelDemo extends StatelessWidget {
  const CourseModelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> rawJson = {
      'id': '1',
      'code': 'MOB01',
      'title': 'Responsive Layout & Grid',
      'credits': 3,
      'category': 'Mobile Web',
      'status': 'Active',
      'isFavorite': false,
      'description': 'Mempelajari pembentukan antarmuka yang responsif dengan '
          'MediaQuery, LayoutBuilder, Flex, Wrap, dan GridView dinamis.',
    };

    final Course course = Course.fromJson(rawJson);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tahap 8: Model Course Demo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text('$studentId - $studentName'),
            const SizedBox(height: 12),
            Text('Judul : ${course.title}'),
            Text('Kode  : ${course.code}'),
            Text('SKS   : ${course.credits}'),
            Text('Status: ${course.status}'),
          ],
        ),
      ),
    );
  }
}

class ValueNotifierDemo extends StatefulWidget {
  const ValueNotifierDemo({super.key});

  @override
  State<ValueNotifierDemo> createState() => _ValueNotifierDemoState();
}

class _ValueNotifierDemoState extends State<ValueNotifierDemo> {
  final ValueNotifier<int> favoriteCounter = ValueNotifier<int>(0);

  @override
  void dispose() {
    favoriteCounter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tahap 4: ValueNotifier Demo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text('$studentId - $studentName'),
            const SizedBox(height: 12),
            ValueListenableBuilder<int>(
              valueListenable: favoriteCounter,
              builder: (context, value, child) {
                return Text(
                  'Simulasi jumlah favorite: $value',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => favoriteCounter.value++,
                  child: const Text('Tambah'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => favoriteCounter.value = 0,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}