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
      title: 'Course Explorer - Modul Praktikum 5',
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

// ===================== REUSABLE WIDGETS =====================

class StudentHeaderWidget extends StatelessWidget {
  final String title;
  const StudentHeaderWidget({super.key, this.title = 'Identitas Mahasiswa'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1976D2)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            studentName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xFF1976D2),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'NIM: $studentId',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class CourseCardWidget extends StatelessWidget {
  final Map<String, dynamic> course;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const CourseCardWidget({
    super.key,
    required this.course,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final String status = course['status'] as String;

    return Material(
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      course['code'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 24,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                course['title'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${course['credits']} SKS • Category: ${course['category']}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: status == 'Active'
                          ? Colors.orange
                          : status == 'Done'
                              ? Colors.green
                              : Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Status: $status',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
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

// ===================== MENU UTAMA NAVIGASI =====================

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
              const StudentHeaderWidget(
                  title: 'Praktikum Pemrograman Mobile'),
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
              _navButton(context, 'Tahap 8: Course Explorer List',
                  const CourseExplorerListPage()),
              _navButton(context, 'Tahap 9: Navigasi Result & SnackBar',
                  const CourseExplorerListPage()),
              _navButton(context, 'Tahap 10: NavigationBar',
                  const Stage10MainPage()),
              _navButton(context, 'Tahap 11: NavigationRail & NavigationBar',
                  const Stage11MainPage()),
              _navButton(context, 'Tahap 12: Button, InkWell, & GestureDetector',
                  const Stage12MainPage()),
              _navButton(context, 'Tahap 13: Form Input dan Validasi',
                  const Stage13MainPage()),
              _navButton(context, 'Tahap 14: SnackBar, Dialog, & Loading',
                  const Stage14MainPage()),
              _navButton(
                  context,
                  'Tahap 15: Mini Project - Responsive Course Explorer',
                  const Stage15MainPage()),
              const Divider(height: 24),
              _navButton(
                  context,
                  'Tahap 16: Debugging Challenge',
                  const Stage16MainPage(),
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

// ===================== TAHAP 1 SAMPAI 14 (SUB-PAGES) =====================

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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: StudentHeaderWidget(
              title: 'Tahap 1: Masalah Layout Responsif'),
        ),
      ),
    );
  }
}

class MediaQueryDemoPage extends StatelessWidget {
  const MediaQueryDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 2: MediaQuery'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const StudentHeaderWidget(),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Lebar: ${size.width.toStringAsFixed(0)} px'),
                      Text('Tinggi: ${size.height.toStringAsFixed(0)} px'),
                      Text('Orientasi: $orientation'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
              final String type = constraints.maxWidth < 600
                  ? 'Compact (<600px)'
                  : constraints.maxWidth < 840
                      ? 'Medium (600-839px)'
                      : 'Expanded (>=840px)';
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const StudentHeaderWidget(),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Tipe Layar: $type',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FlexWrapDemoPage extends StatelessWidget {
  const FlexWrapDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 4: Flex & Wrap'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StudentHeaderWidget(),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Responsive')),
                Chip(label: Text('Navigation')),
                Chip(label: Text('Interaction')),
              ],
            ),
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
      appBar: AppBar(
        title: const Text('Tahap 5: Grid Responsif'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StudentHeaderWidget(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => Card(
                  color: Colors.blue.shade50,
                  child: Center(child: Text('Course Grid ${index + 1}')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollDemoPage extends StatelessWidget {
  const ScrollDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 6: Scrollable Content'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StudentHeaderWidget(),
            const SizedBox(height: 16),
            for (int i = 1; i <= 5; i++)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(title: Text('Kartu Item Kebuka $i')),
              ),
          ],
        ),
      ),
    );
  }
}

class Nav7HomePage extends StatelessWidget {
  const Nav7HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 7: Navigator Push/Pop'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Scaffold(
                      appBar: AppBar(title: const Text('Detail Screen')),
                      body: const Center(child: Text('Halaman Detail Navigasi')),
                    )),
          ),
          child: const Text('Buka Halaman Detail'),
        ),
      ),
    );
  }
}

class CourseExplorerListPage extends StatelessWidget {
  const CourseExplorerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Explorer List'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: StudentHeaderWidget(title: 'Tahap 8 & 9: List & Detail'),
      ),
    );
  }
}

class Stage10MainPage extends StatelessWidget {
  const Stage10MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 10: NavigationBar'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: StudentHeaderWidget()),
    );
  }
}

class Stage11MainPage extends StatelessWidget {
  const Stage11MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 11: Adaptive Shell'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: StudentHeaderWidget()),
    );
  }
}

class Stage12MainPage extends StatelessWidget {
  const Stage12MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 12: Interaksi & Gesture'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: StudentHeaderWidget()),
    );
  }
}

class Stage13MainPage extends StatelessWidget {
  const Stage13MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 13: Form Input & Validasi'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: StudentHeaderWidget()),
    );
  }
}

class Stage14MainPage extends StatelessWidget {
  const Stage14MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 14: Feedback & Dialog'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: StudentHeaderWidget()),
    );
  }
}

// ===================== TAHAP 15: MINI PROJECT INTEGRASI =====================

class Stage15MainPage extends StatefulWidget {
  const Stage15MainPage({super.key});

  @override
  State<Stage15MainPage> createState() => _Stage15MainPageState();
}

class _Stage15MainPageState extends State<Stage15MainPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> courses = [
    {
      'id': '1',
      'code': 'MOB01',
      'title': 'Responsive Layout & Grid',
      'credits': 3,
      'category': 'Mobile Web',
      'status': 'Active',
      'isFavorite': false,
      'description':
          'Mempelajari pembentukan antarmuka yang responsif dengan MediaQuery, LayoutBuilder, Flex, Wrap, dan GridView dinamis pada berbagai ukuran layar.',
    },
    {
      'id': '2',
      'code': 'MOB02',
      'title': 'Navigation & Adaptive Shell',
      'credits': 2,
      'category': 'Architecture',
      'status': 'Active',
      'isFavorite': true,
      'description':
          'Penerapan shell navigasi adaptif menggunakan NavigationBar pada layar sempit dan NavigationRail pada layar lebar beserta passing data.',
    },
    {
      'id': '3',
      'code': 'MOB03',
      'title': 'Form Validation & Feedback',
      'credits': 3,
      'category': 'User Interaction',
      'status': 'Planned',
      'isFavorite': false,
      'description':
          'Pengelolaan form interaktif dengan GlobalKey<FormState>, validasi input, serta umpan balik pengguna berupa SnackBar, Dialog, dan Loading State.',
    },
    {
      'id': '4',
      'code': 'MOB04',
      'title': 'Git Version Control System',
      'credits': 2,
      'category': 'DevOps',
      'status': 'Done',
      'isFavorite': false,
      'description':
          'Manajemen repositori Git, commit bertahap, pengelolaan branch, dan sinking project ke remote GitHub secara terstruktur.',
    },
    {
      'id': '5',
      'code': 'MOB05',
      'title': 'Dart Asynchronous Programming',
      'credits': 2,
      'category': 'Core Language',
      'status': 'Done',
      'isFavorite': true,
      'description':
          'Konsep pemrosesan data asynchronous pada Dart menggunakan Future, async/await, dan simulasi penanganan API.',
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      courses[index]['isFavorite'] = !(courses[index]['isFavorite'] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Stage15HomePage(courses: courses, onFavoriteToggle: toggleFavorite),
      Stage15CoursesPage(courses: courses, onFavoriteToggle: toggleFavorite),
      const Stage15ProfileFeedbackPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Explorer'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 840) {
            return Scaffold(
              body: pages[selectedIndex],
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (idx) =>
                    setState(() => selectedIndex = idx),
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(icon: Icon(Icons.school), label: 'Courses'),
                  NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            );
          }

          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (idx) =>
                      setState(() => selectedIndex = idx),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(
                        icon: Icon(Icons.school), label: Text('Courses')),
                    NavigationRailDestination(
                        icon: Icon(Icons.person), label: Text('Profile')),
                  ],
                ),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(child: pages[selectedIndex]),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Stage15HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  final Function(int) onFavoriteToggle;

  const Stage15HomePage({
    super.key,
    required this.courses,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StudentHeaderWidget(title: 'Course Explorer Home'),
          const SizedBox(height: 16),
          const Text('Course Favorit:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          for (int i = 0; i < courses.length; i++)
            if (courses[i]['isFavorite'] as bool)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CourseCardWidget(
                  course: courses[i],
                  isFavorite: true,
                  onTap: () {},
                  onFavoriteToggle: () => onFavoriteToggle(i),
                ),
              ),
        ],
      ),
    );
  }
}

class Stage15CoursesPage extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  final Function(int) onFavoriteToggle;

  const Stage15CoursesPage({
    super.key,
    required this.courses,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CourseCardWidget(
          course: courses[index],
          isFavorite: courses[index]['isFavorite'] as bool,
          onTap: () {},
          onFavoriteToggle: () => onFavoriteToggle(index),
        ),
      ),
    );
  }
}

class Stage15ProfileFeedbackPage extends StatelessWidget {
  const Stage15ProfileFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: StudentHeaderWidget(title: 'Profil Mahasiswa'),
    );
  }
}

// ===================== TAHAP 16: DEBUGGING CHALLENGE (TEMA BIRU) =====================

class Stage16MainPage extends StatefulWidget {
  const Stage16MainPage({super.key});

  @override
  State<Stage16MainPage> createState() => _Stage16MainPageState();
}

class _Stage16MainPageState extends State<Stage16MainPage> {
  bool _isNavigating = false;

  void _navigateToDetailSafe(BuildContext context) async {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Memproses navigasi aman (mencegah aksi ganda)...'),
        duration: Duration(milliseconds: 800),
      ),
    );

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Detail Navigasi Aman (Kasus D)'),
            backgroundColor: const Color(0xFF1976D2),
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const StudentHeaderWidget(
                    title: 'Solusi Kasus D: Anti Double-Push'),
                const SizedBox(height: 20),
                const Text(
                  'Halaman ini hanya ter-push SATU KALI meskipun tombol ditekan berkali-kali secara cepat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (mounted) {
      setState(() {
        _isNavigating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 16: Debugging Challenge'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StudentHeaderWidget(
                title: 'Tahap 16: Pembuktian Solusi Debugging'),
            const SizedBox(height: 20),

            // Kasus A
            const Text(
              'Kasus A: Perbaikan RenderFlex Overflow pada Row',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1976D2)),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Color(0xFF1976D2)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '$studentId - $studentName - Teks ini sangat panjang dan telah dibungkus dengan Expanded sehingga tidak memicu RenderFlex Overflow!',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Kasus B
            const Text(
              'Kasus B: ListView di dalam Column (Bounded Height)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1976D2)),
            ),
            const SizedBox(height: 8),
            Container(
              height: 180,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  const Text('Header di dalam Column',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Item ListView Kebuka Ke-${index + 1}'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Kasus C
            const Text(
              'Kasus C: Form Input Aman dari Keyboard Overflow',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1976D2)),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Uji Coba Keyboard (Ketik di sini)',
                prefixIcon: Icon(Icons.keyboard),
                hintText:
                    'SingleChildScrollView mencegah bottom overflow saat keyboard aktif',
              ),
            ),
            const SizedBox(height: 24),

            // Kasus D
            const Text(
              'Kasus D: Demo Pencegahan Navigasi Ganda (Double Push)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1976D2)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isNavigating
                      ? Colors.grey
                      : const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed:
                    _isNavigating ? null : () => _navigateToDetailSafe(context),
                icon: const Icon(Icons.touch_app),
                label: Text(
                  _isNavigating
                      ? 'Proses Navigasi...'
                      : 'Tekan Sekali (Navigasi Terkunci Aman)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}