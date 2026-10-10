import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// 1. Deklarasi Identitas Mahasiswa
const String studentName = 'Achmad Dhanil Ahkam';
const String studentId = '2415051049';

// 2. Fungsi Load Data JSON (dengan fallback jika asset belum siap)
Future<Map<String, dynamic>> loadStudentData() async {
  try {
    final jsonString = await rootBundle.loadString('assets/data/student_data.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  } catch (_) {
    return {
      'student': {
        'name': studentName,
        'nim': studentId,
        'class': 'IF-5A',
        'program': 'Teknik Informatika',
      },
      'courses': courses,
    };
  }
}

// 3. Data Static Course (digunakan untuk Tahap 1-5)
final List<Map<String, dynamic>> courses = [
  {
    'code': 'MOB01',
    'title': 'Git & GitHub',
    'credits': 2,
    'status': 'done',
    'semester': 5,
  },
  {
    'code': 'MOB02',
    'title': 'Dart Fundamentals',
    'credits': 2,
    'status': 'done',
    'semester': 5,
  },
  {
    'code': 'MOB03',
    'title': 'Flutter UI Fundamentals',
    'credits': 3,
    'status': 'active',
    'semester': 5,
  },
  {
    'code': 'MOB04',
    'title': 'Navigation',
    'credits': 2,
    'status': 'planned',
    'semester': 5,
  },
  {
    'code': 'MOB05',
    'title': 'State Management',
    'credits': 3,
    'status': 'planned',
    'semester': 5,
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Explorer - Pertemuan 5',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Fundamentals'),
          backgroundColor: Colors.blue,
          centerTitle: true,
          foregroundColor: Colors.white,
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
                        'assets/images/profile.png',
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
                        studentName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'NIM: $studentId',
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
                          '$studentId - $studentName\nFlutter UI Fundamentals',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const GreetingCard(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopicListPage(),
                          ),
                        ),
                        child: const Text('Lihat Daftar Materi'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        ),
                        child: const Text('Lihat Learning Dashboard'),
                      ),

                      // ===== Pertemuan 5 =====
                      const Divider(height: 32),
                      const Text(
                        'Pertemuan 5: Responsive & Layout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      _navButton(context, 'Tahap 1: Responsive Problem',
                          const ResponsiveProblemPage()),
                      _navButton(context, 'Tahap 2: MediaQuery',
                          const MediaQueryDemoPage()),
                      _navButton(context, 'Tahap 3: Breakpoint',
                          const BreakpointDemoPage()),
                      _navButton(context, 'Tahap 4: Expanded, Flexible, Wrap',
                          const FlexWrapDemoPage()),
                      _navButton(context, 'Tahap 5: GridView Responsif',
                          const CourseGridPage()),
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

  Widget _navButton(BuildContext context, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
          child: Text(label),
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
          '$studentId - $studentName',
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
    'title': '$studentId - $studentName',
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
              '$studentId - $studentName',
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

// ===================== Learning Dashboard =====================

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
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: studentFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Gagal memuat data: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            final data = snapshot.data!;
            final student = data['student'] as Map<String, dynamic>;
            final jsonCourses = (data['courses'] as List<dynamic>)
                .cast<Map<String, dynamic>>();

            final int totalCredits = jsonCourses.fold<int>(
              0,
              (sum, c) => sum + (c['credits'] as int),
            );
            final int doneCount =
                jsonCourses.where((c) => c['status'] == 'done').length;

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: jsonCourses.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashboardProfileCard(student: student),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          DashboardSummaryCard(
                            icon: Icons.menu_book,
                            value: '${jsonCourses.length}',
                            label: 'Materi',
                          ),
                          DashboardSummaryCard(
                            icon: Icons.school,
                            value: '$totalCredits',
                            label: 'Total SKS',
                          ),
                          DashboardSummaryCard(
                            icon: Icons.check_circle,
                            value: '$doneCount/${jsonCourses.length}',
                            label: 'Selesai',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Daftar Materi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }
                return DashboardCourseCard(course: jsonCourses[index - 1]);
              },
            );
          },
        ),
      ),
    );
  }
}

class DashboardProfileCard extends StatelessWidget {
  final Map<String, dynamic> student;
  const DashboardProfileCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundImage: const AssetImage('assets/images/profile.png'),
              onBackgroundImageError: (exception, stackTrace) {},
              child: const Icon(Icons.person, size: 36),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student['name'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('NIM: ${student['nim']}'),
                  Text('${student['class']} - ${student['program']}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardSummaryCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const DashboardSummaryCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCourseCard extends StatelessWidget {
  final Map<String, dynamic> course;
  const DashboardCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final String status = course['status'] as String;
    late final IconData icon;
    late final Color color;
    late final String label;
    switch (status) {
      case 'done':
        icon = Icons.check_circle;
        color = Colors.green;
        label = 'Selesai';
        break;
      case 'active':
        icon = Icons.play_circle;
        color = Colors.orange;
        label = 'Berjalan';
        break;
      default:
        icon = Icons.schedule;
        color = Colors.grey;
        label = 'Direncanakan';
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(course['title'] as String),
        subtitle: Text(
          '${course['code']} • ${course['credits']} SKS • '
          'Semester ${course['semester']}',
        ),
        trailing: Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ===================== Pertemuan 5: Tahap 1-5 =====================

// ----- Tahap 1: Responsive Problem -----
class ResponsiveProblemPage extends StatelessWidget {
  const ResponsiveProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 1: Responsive Problem')),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          color: Colors.blue.shade50,
          child: const Text('$studentId - $studentName'),
        ),
      ),
    );
  }
}

// ----- Tahap 2: MediaQuery -----
class MediaQueryDemoPage extends StatelessWidget {
  const MediaQueryDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final String category = size.width < 600 ? 'Compact' : 'Wide';

    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 2: MediaQuery')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '$studentId - $studentName',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text('Width: ${size.width.toStringAsFixed(0)}'),
              Text('Height: ${size.height.toStringAsFixed(0)}'),
              Text('Orientation: $orientation'),
              const SizedBox(height: 8),
              Text(
                'Kategori: $category',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ----- Tahap 3: LayoutBuilder & Breakpoint -----
class CompactLayout extends StatelessWidget {
  const CompactLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$studentId - $studentName',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Kategori: Compact (1 kolom)'),
          Icon(Icons.phone_android, size: 48),
        ],
      ),
    );
  }
}

class MediumLayout extends StatelessWidget {
  const MediumLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade50,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tablet, size: 48),
          SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$studentId - $studentName',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Kategori: Medium (2 kolom)'),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandedLayout extends StatelessWidget {
  const ExpandedLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.desktop_windows, size: 48),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '$studentId - $studentName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Kategori: Expanded (3 kolom, layout lebih lebar)'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BreakpointDemoPage extends StatelessWidget {
  const BreakpointDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 3: Breakpoint')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) return const CompactLayout();
          if (constraints.maxWidth < 840) return const MediumLayout();
          return const ExpandedLayout();
        },
      ),
    );
  }
}

// ----- Tahap 4: Expanded, Flexible, Wrap -----
Widget buildFlexBox(String label, Color color) {
  return Container(
    color: color,
    padding: const EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}

class FlexWrapDemoPage extends StatelessWidget {
  const FlexWrapDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      'Flutter',
      'Dart',
      'Git',
      'REST API',
      'Firebase',
      'UI/UX',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 4: Expanded, Flexible, Wrap')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '$studentId - $studentName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Row dengan Expanded flex 2:1'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child:
                      buildFlexBox('Panel A (flex 2)', Colors.blue.shade100),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child:
                      buildFlexBox('Panel B (flex 1)', Colors.green.shade100),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Wrap untuk daftar skill (Chip)'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((e) => Chip(label: Text(e))).toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Perbandingan: Row biasa (tanpa Wrap) saat ruang sempit',
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: skills
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(label: Text(e)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----- Tahap 5: GridView Responsif -----
int columnsFor(double width) {
  if (width < 600) return 1;
  if (width < 840) return 2;
  return 3;
}

class CourseGridCard extends StatelessWidget {
  final Map<String, dynamic> course;
  const CourseGridCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              course['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('${course['code']} • ${course['credits']} SKS'),
            Text('Status: ${course['status']}'),
          ],
        ),
      ),
    );
  }
}

class CourseGridPage extends StatelessWidget {
  const CourseGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 5: GridView Responsif')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '$studentId - $studentName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnsFor(constraints.maxWidth),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: courses.length,
                    itemBuilder: (context, index) =>
                        CourseGridCard(course: courses[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// tahap 6

class ScrollDemoPage extends StatelessWidget {
  const ScrollDemoPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 6: Scrollable & Keyboard')),
      // SingleChildScrollView penting di sini supaya saat keyboard muncul
      // (karena TextField di bawah), konten tidak overflow, bisa discroll.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '$studentId - $studentName',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Konten sengaja dibuat panjang (banyak Card) supaya tingginya
            // melebihi layar, untuk menguji scroll.
            for (int i = 1; i <= 8; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Card informasi ke-$i, konten contoh.'),
                  ),
                ),
              ),
            const Text('Form di bagian bawah:'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ketik sesuatu (buka keyboard)',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
 