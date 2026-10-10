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
              _navButton(context, 'Tahap 8: Course Explorer (Navigasi & Detail)',
                  const CourseExplorerListPage()),
              _navButton(context, 'Tahap 9: Navigasi Result & SnackBar',
                  const CourseExplorerListPage()),
              const Divider(height: 24),
              _navButton(
                  context,
                  'Tahap 10: NavigationBar (Home, Courses, Profile)',
                  const Stage10MainPage(),
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
            backgroundColor: isPrimary ? Colors.deepPurple : Colors.white,
            foregroundColor:
                isPrimary ? Colors.white : const Color(0xFF1976D2),
            side: BorderSide(
                color: isPrimary ? Colors.deepPurple : const Color(0xFF1976D2)),
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

// TAHAP 8 & 9: COURSE EXPLORER LIST & DETAIL

class CourseExplorerListPage extends StatelessWidget {
  const CourseExplorerListPage({super.key});

  final List<Map<String, dynamic>> courses = const [
    {
      'title': 'Responsive Layout',
      'code': 'MOB04',
      'status': 'Active',
      'credits': 3,
      'description':
          'Mempelajari teknik pembuatan tata letak UI yang responsif menggunakan MediaQuery, LayoutBuilder, Flex, Wrap, dan GridView.',
    },
    {
      'title': 'Navigation',
      'code': 'MOB05',
      'status': 'Planned',
      'credits': 2,
      'description':
          'Penguasaan navigasi antar halaman (Navigator push/pop) dan pengiriman data antar screen secara terstruktur.',
    },
    {
      'title': 'Interaction',
      'code': 'MOB06',
      'status': 'Planned',
      'credits': 3,
      'description':
          'Pengelolaan interaksi pengguna, gesture detection, form input validation, dan penanganan state dinamis.',
    },
    {
      'title': 'Git & GitHub',
      'code': 'MOB01',
      'status': 'Done',
      'credits': 2,
      'description':
          'Konsep version control system, branching, commit, pull request, dan kolaborasi repository GitHub.',
    },
    {
      'title': 'Dart Fundamentals',
      'code': 'MOB02',
      'status': 'Done',
      'credits': 2,
      'description':
          'Dasar-dasar bahasa pemrograman Dart: variabel, fungsi, OOP, dan asynchronous programming.',
    },
    {
      'title': 'Flutter UI Basics',
      'code': 'MOB03',
      'status': 'Done',
      'credits': 3,
      'description':
          'Pengenalan arsitektur Flutter, widget Stateless/Stateful, styling, dan pembentukan struktur UI dasar.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Explorer List'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              'Pilih Course untuk Melihat Detail & Menandai Favorite:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFE3F2FD),
                        child: Text(
                          '${course['credits']} SKS',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1976D2),
                          ),
                        ),
                      ),
                      title: Text(
                        course['title'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Kode: ${course['code']} • Status: ${course['status']}'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Stage8or9DetailPage(courseMap: course),
                          ),
                        );

                        if (result == true && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Course "${course['title']}" ditambahkan ke Favorite!',
                              ),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                    ),
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

class Stage8or9DetailPage extends StatelessWidget {
  final Map<String, dynamic> courseMap;

  const Stage8or9DetailPage({super.key, required this.courseMap});

  @override
  Widget build(BuildContext context) {
    final String title = courseMap['title'] as String;
    final String code = courseMap['code'] as String;
    final String status = courseMap['status'] as String;
    final int credits = courseMap['credits'] as int;
    final String description = courseMap['description'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: $title'),
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1976D2)),
              ),
              child: Column(
                children: const [
                  Text(
                    'Identitas Mahasiswa:',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'NIM: $studentId',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A365D),
                      ),
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kode Mata Kuliah:',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          code,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Beban Studi (Credits):',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          '$credits SKS',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status Pembelajaran:',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: status == 'Active'
                                ? Colors.orange.shade100
                                : status == 'Done'
                                    ? Colors.green.shade100
                                    : Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: status == 'Active'
                                  ? Colors.orange.shade900
                                  : status == 'Done'
                                      ? Colors.green.shade900
                                      : Colors.blue.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 28),
                    const Text(
                      'Deskripsi Pembelajaran:',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.favorite),
                label: const Text('Pilih / Favorite Course Ini'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context, false),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali Tanpa Memilih'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TAHAP 10: NAVIGATION BAR (HOME, COURSES, PROFILE)

class Stage10MainPage extends StatefulWidget {
  const Stage10MainPage({super.key});

  @override
  State<Stage10MainPage> createState() => _Stage10MainPageState();
}

class _Stage10MainPageState extends State<Stage10MainPage> {

  // Poin 2: StatefulWidget menyimpan selectedIndex (currentIndex)
  int currentIndex = 0;

  // Poin 3: Daftar Halaman Sesuai Index
  final List<Widget> pages = [
    const Stage10HomeScreen(),
    const Stage10CoursesScreen(),
    const Stage10ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 10: NavigationBar'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // Poin 3: Menampilkan Widget/Page Sesuai Index
      body: pages[currentIndex],

      // Poin 1 & Kode Acuan Tugas: NavigationBar Material 3 dengan 3 Destination
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Tab 1: Home Screen (Menampilkan Identitas Mahasiswa)
class Stage10HomeScreen extends StatelessWidget {
  const Stage10HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poin 4: Identitas Mahasiswa pada Screen Home
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.deepPurple, Colors.indigo],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Selamat Datang di Home,',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 6),
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
            'Ringkasan Aktivitas Belajar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStatCard('Total Course', '6', Colors.blue),
              _buildStatCard('Active', '1', Colors.orange),
              _buildStatCard('Selesai', '3', Colors.green),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                child: Icon(Icons.lightbulb_outline),
              ),
              title: Text(
                'Status Praktikum',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Tahap 10 NavigationBar Material 3 Berhasil Diimplementasikan.',
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
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab 2: Courses Screen
class Stage10CoursesScreen extends StatelessWidget {
  const Stage10CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daftar Course Pembelajaran:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: const [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.developer_mode, color: Colors.blue),
                    title: Text('Responsive Layout'),
                    subtitle: Text('MOB04 • Status: Active'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.navigation, color: Colors.orange),
                    title: Text('Navigation & NavigationBar'),
                    subtitle: Text('MOB05 • Status: Active'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.touch_app, color: Colors.green),
                    title: Text('Interaction & State'),
                    subtitle: Text('MOB06 • Status: Planned'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tab 3: Profile Screen (Menampilkan Identitas Mahasiswa - Poin 4)
class Stage10ProfileScreen extends StatelessWidget {
  const Stage10ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),

          // Poin 4: Identitas Mahasiswa pada Screen Profile
          Text(
            studentName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'NIM: $studentId',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            'Teknik Informatika • Semester 5',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Divider(height: 40),

          const ListTile(
            leading: Icon(Icons.school, color: Colors.deepPurple),
            title: Text('Mata Kuliah'),
            subtitle: Text('Praktikum Pemrograman Mobile'),
          ),
          const ListTile(
            leading: Icon(Icons.menu_book, color: Colors.deepPurple),
            title: Text('Modul'),
            subtitle: Text('Modul 5: Layout, Responsiveness & Navigation'),
          ),
          const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Status Verifikasi'),
            subtitle: Text('100% Seluruh Tahap Praktikum Selesai'),
          ),
        ],
      ),
    );
  }
}