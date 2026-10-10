import 'package:flutter/material.dart';

// Identitas Mahasiswa Global
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
      title: 'Modul Praktikum 5',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF1976D2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2),
        ),
      ),
      home: const MainMenuPage(),
    );
  }
}

// MENU UTAMA NAVIGASI

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul Praktikum 5'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1976D2)),
                ),
                child: const Column(
                  children: [
                    Text(
                      studentName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'NIM: $studentId',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Daftar Tahap Modul Praktikum:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              _navButton(context, 'Tahap 6: Scrollable Content & Keyboard',
                  const ScrollDemoPage()),
              _navButton(context, 'Tahap 7: Navigator push/pop',
                  const Nav7HomePage()),
              const Divider(height: 24),
              _navButton(context, 'Tahap 8: Course Explorer App (Utuh)',
                  const CourseExplorerMainPage(),
                  isPrimary: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, Widget page,
      {bool isPrimary = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isPrimary ? const Color(0xFF1976D2) : Colors.white,
            foregroundColor:
                isPrimary ? Colors.white : const Color(0xFF1976D2),
            side: const BorderSide(color: Color(0xFF1976D2)),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// Tahap 1: Responsive Problem

class ResponsiveProblemPage extends StatelessWidget {
  const ResponsiveProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 1: Responsive Problem'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade300, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Identitas Mahasiswa:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$studentId - $studentName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Tahap 1: Demonstrasi masalah responsif dan dasar penataan layout.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tahap 2: MediaQuery

class MediaQueryDemoPage extends StatelessWidget {
  const MediaQueryDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final String category =
        size.width < 600 ? 'Compact (Layar Sempit)' : 'Wide (Layar Lebar)';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 2: MediaQuery'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$studentId - $studentName',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const Divider(height: 24),
                  Text('Lebar Layar (Width): ${size.width.toStringAsFixed(0)} px'),
                  const SizedBox(height: 8),
                  Text('Tinggi Layar (Height): ${size.height.toStringAsFixed(0)} px'),
                  const SizedBox(height: 8),
                  Text('Orientasi Layar: $orientation'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF1976D2)),
                    ),
                    child: Text(
                      'Kategori: $category',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

// Tahap 3: Breakpoint

class CompactLayout extends StatelessWidget {
  const CompactLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade300, width: 2),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$studentId - $studentName',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Kategori Breakpoint: Compact (< 600 px)',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Icon(Icons.phone_android, size: 48, color: Colors.red),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade300, width: 2),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tablet, size: 48, color: Colors.orange),
          SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$studentId - $studentName',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                'Kategori Breakpoint: Medium (600 - 839 px)',
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w600),
              ),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade300, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.desktop_windows, size: 48, color: Colors.green),
          const SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '$studentId - $studentName',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                'Kategori Breakpoint: Expanded (>= 840 px)',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w600),
              ),
            ],
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
      appBar: AppBar(
        title: const Text('Tahap 3: Breakpoint'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const CompactLayout();
              } else if (constraints.maxWidth < 840) {
                return const MediumLayout();
              } else {
                return const ExpandedLayout();
              }
            },
          ),
        ),
      ),
    );
  }
}

// Tahap 4: Expanded, Flexible, Wrap

Widget buildFlexBox(String label, Color color) {
  return Container(
    color: color,
    padding: const EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
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
      'UI/UX Design',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 4: Expanded, Flexible, Wrap'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF1976D2)),
              ),
              child: const Text(
                '$studentId - $studentName',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Row dengan Expanded (Rasio 2:1)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: buildFlexBox('Panel A (Flex 2)', Colors.blue.shade100),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: buildFlexBox('Panel B (Flex 1)', Colors.green.shade100),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '2. Demo Wrap (Mencegah Overflow saat Komponen Banyak)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map((skill) => Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade200,
                          child: const Icon(Icons.code, size: 14),
                        ),
                        label: Text(skill),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Tahap 5: GridView Responsif

class CourseGridPage extends StatelessWidget {
  const CourseGridPage({super.key});

  final List<Map<String, String>> courses = const [
    {'code': 'MOB01', 'title': 'Git & GitHub', 'status': 'Done'},
    {'code': 'MOB02', 'title': 'Dart Fundamentals', 'status': 'Done'},
    {'code': 'MOB03', 'title': 'Flutter UI Basics', 'status': 'Done'},
    {'code': 'MOB04', 'title': 'Responsive Layout', 'status': 'Active'},
    {'code': 'MOB05', 'title': 'Navigation', 'status': 'Planned'},
    {'code': 'MOB06', 'title': 'Interaction', 'status': 'Planned'},
  ];

  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 840) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 5: GridView Responsif'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF1976D2)),
              ),
              child: const Text(
                '$studentId - $studentName',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final int cols = _getCrossAxisCount(constraints.maxWidth);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jumlah Kolom Grid: $cols kolom (Lebar: ${constraints.maxWidth.toStringAsFixed(0)} px)',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: cols,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 2.2,
                          ),
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            final c = courses[index];
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      c['title']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Kode: ${c['code']} • Status: ${c['status']}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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

// Tahap 6: Scrollable Content & Keyboard

class ScrollDemoPage extends StatelessWidget {
  const ScrollDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 6: Scrollable & Keyboard'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF1976D2)),
              ),
              child: const Text(
                '$studentId - $studentName',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar Modul Pembelajaran (Scrollable Test):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            for (int i = 1; i <= 6; i++)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text('$i'),
                  ),
                  title: Text('Kartu Informasi Pembelajaran Ke-$i'),
                  subtitle: const Text(
                    'Uji coba layout yang fleksibel saat di-scroll dan aman dari overflow.',
                  ),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Form Input (Uji Coba Keyboard Overlay):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ketik pesan / masukan di sini',
                hintText: 'Mencoba interaksi keyboard tanpa error overflow',
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Tahap 7: Navigator push/pop

class Nav7HomePage extends StatelessWidget {
  const Nav7HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 7: Navigasi Utama'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1976D2)),
                ),
                child: const Column(
                  children: [
                    Text(
                      studentName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'NIM: $studentId',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Halaman Awal Navigasi (Route Stack 1)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Nav7DetailPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Buka Halaman Detail (push)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Nav7DetailPage extends StatelessWidget {
  const Nav7DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 7: Halaman Detail'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Berhasil Berpindah ke Halaman Detail!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mahasiswa: $studentName ($studentId)',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Divider(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali (pop)'),
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

// TAHAP 8: COURSE EXPLORER APP (UTUH)

class CourseExplorerMainPage extends StatefulWidget {
  const CourseExplorerMainPage({super.key});

  @override
  State<CourseExplorerMainPage> createState() => _CourseExplorerMainPageState();
}

class _CourseExplorerMainPageState extends State<CourseExplorerMainPage> {
  int _currentIndex = 1; // Tab default: Courses (sesuai gambar)

  List<Map<String, dynamic>> coursesData = [
    {
      'title': 'Responsive Layout',
      'code': 'MOB04',
      'status': 'Active',
      'credits': 3,
      'description':
          'Mempelajari teknik pembuatan tata letak UI yang responsif menggunakan MediaQuery, LayoutBuilder, Flex, Wrap, dan GridView.',
      'isFavorite': true,
    },
    {
      'title': 'Navigation',
      'code': 'MOB05',
      'status': 'Planned',
      'credits': 2,
      'description':
          'Penguasaan navigasi antar halaman (Navigator push/pop) dan pengiriman data antar screen secara terstruktur.',
      'isFavorite': false,
    },
    {
      'title': 'Interaction',
      'code': 'MOB06',
      'status': 'Planned',
      'credits': 3,
      'description':
          'Pengelolaan interaksi pengguna, gesture detection, form input validation, dan penanganan state dinamis.',
      'isFavorite': false,
    },
    {
      'title': 'Git & GitHub',
      'code': 'MOB01',
      'status': 'Done',
      'credits': 2,
      'description':
          'Konsep version control system, branching, commit, pull request, dan kolaborasi repository GitHub.',
      'isFavorite': true,
    },
    {
      'title': 'Dart Fundamentals',
      'code': 'MOB02',
      'status': 'Done',
      'credits': 2,
      'description':
          'Dasar-dasar bahasa pemrograman Dart: variabel, fungsi, OOP, dan asynchronous programming.',
      'isFavorite': false,
    },
    {
      'title': 'Flutter UI Basics',
      'code': 'MOB03',
      'status': 'Done',
      'credits': 3,
      'description':
          'Pengenalan arsitektur Flutter, widget Stateless/Stateful, styling, dan pembentukan struktur UI dasar.',
      'isFavorite': false,
    },
  ];

  void _toggleFavorite(String code) {
    setState(() {
      final index = coursesData.indexWhere((c) => c['code'] == code);
      if (index != -1) {
        coursesData[index]['isFavorite'] = !coursesData[index]['isFavorite'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      CourseExplorerHomeScreen(courses: coursesData),
      CourseExplorerCoursesScreen(
        courses: coursesData,
        onToggleFavorite: _toggleFavorite,
      ),
      CourseExplorerProfileScreen(courses: coursesData),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Color(0xFFE8F1F5),
          border: Border(top: BorderSide(color: Color(0xFFD0DFE5), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('Home', 0),
            _buildNavItem('Courses', 1),
            _buildNavItem('Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    final bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 16,
            color: isSelected
                ? const Color(0xFF1A365D)
                : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}

// Sub-Tab 1: Home
class CourseExplorerHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  const CourseExplorerHomeScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final activeCount = courses.where((c) => c['status'] == 'Active').length;
    final doneCount = courses.where((c) => c['status'] == 'Done').length;
    final favCount = courses.where((c) => c['isFavorite'] == true).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1976D2), Color(0xFF1565C0)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Selamat Datang,',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  studentName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'NIM: $studentId',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ringkasan Pembelajaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A365D),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStatCard('Berjalan', '$activeCount', Colors.orange),
              _buildStatCard('Selesai', '$doneCount', Colors.green),
              _buildStatCard('Favorit', '$favCount', Colors.redAccent),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Materi Aktif Saat Ini',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A365D),
            ),
          ),
          const SizedBox(height: 12),
          ...courses.where((c) => c['status'] == 'Active').map(
                (item) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE3F2FD),
                      child: Icon(Icons.play_arrow, color: Color(0xFF1976D2)),
                    ),
                    title: Text(
                      item['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item['code']} • ${item['credits']} SKS'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailPage(course: item),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1976D2),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Buka'),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// Sub-Tab 2: Courses (Presisi Sesuai Gambar)
class CourseExplorerCoursesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> courses;
  final Function(String) onToggleFavorite;

  const CourseExplorerCoursesScreen({
    super.key,
    required this.courses,
    required this.onToggleFavorite,
  });

  @override
  State<CourseExplorerCoursesScreen> createState() =>
      _CourseExplorerCoursesScreenState();
}

class _CourseExplorerCoursesScreenState
    extends State<CourseExplorerCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = widget.courses.where((c) {
      final title = (c['title'] as String).toLowerCase();
      final code = (c['code'] as String).toLowerCase();
      final q = _searchQuery.toLowerCase();
      return title.contains(q) || code.contains(q);
    }).toList();

    return Column(
      children: [
        // Blue Header Bar
        Container(
          width: double.infinity,
          color: const Color(0xFF1976D2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Course Explorer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Input
                TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search courses...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFEFF3F6),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: filteredCourses.isEmpty
                      ? const Center(child: Text('Tidak ada course ditemukan'))
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              return GridView.builder(
                                itemCount: filteredCourses.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 2.5,
                                ),
                                itemBuilder: (context, index) {
                                  return _buildCourseCard(
                                      filteredCourses[index]);
                                },
                              );
                            }
                            return ListView.builder(
                              itemCount: filteredCourses.length,
                              itemBuilder: (context, index) {
                                return _buildCourseCard(filteredCourses[index]);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> item) {
    final String status = item['status'] as String;
    final bool isFavorite = item['isFavorite'] == true;

    Color statusColor = const Color(0xFF00796B); // Teal untuk Active/Planned

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(course: item),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A365D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['code'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: isFavorite ? Colors.redAccent : Colors.grey,
                    ),
                    onPressed: () =>
                        widget.onToggleFavorite(item['code'] as String),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page Detail Course (Passing Data)
class CourseDetailPage extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final TextEditingController _feedbackController = TextEditingController();
  String _submittedFeedback = '';

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      appBar: AppBar(
        title: Text(course['title'] as String),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '$studentId - $studentName',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kode: ${course['code']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(
                    course['status'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: const Color(0xFF1976D2),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Beban Studi: ${course['credits']} SKS',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
            const Divider(height: 32),
            const Text(
              'Deskripsi Materi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              course['description'] as String,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            const Divider(height: 32),
            const Text(
              'Berikan Catatan / Feedback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tulis kesan atau progres belajar kamu...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submittedFeedback = _feedbackController.text.trim();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Kirim Catatan'),
              ),
            ),
            if (_submittedFeedback.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  'Catatan Tersimpan: "$_submittedFeedback"',
                  style: const TextStyle(color: Colors.green),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Sub-Tab 3: Profile
class CourseExplorerProfileScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  const CourseExplorerProfileScreen({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF1976D2),
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            studentName,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'NIM: $studentId',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            'Teknik Informatika • Semester 5',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Divider(height: 40),
          ListTile(
            leading: const Icon(Icons.class_outlined, color: Color(0xFF1976D2)),
            title: const Text('Total Course Praktikum'),
            trailing: Text(
              '${courses.length} Course',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.bookmark_outline, color: Colors.redAccent),
            title: const Text('Course Favorit'),
            trailing: Text(
              '${courses.where((c) => c['isFavorite'] == true).length} Course',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF3F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  'Praktikum Pemrograman Mobile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Modul 5: Layout & Responsiveness',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}