// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import 'add_course_page.dart';
import 'home_page.dart';
import 'courses_page.dart';
import 'favorites_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CoursesPage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final courseCount = provider.courses.length;
    final favoriteCount = provider.favoriteCount;

    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCoursePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // Badge Merah Jumlah Course
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('$courseCount'),
              isLabelVisible: courseCount > 0,
              child: const Icon(Icons.school),
            ),
            label: 'Courses',
          ),
          // Badge Merah Jumlah Favorit
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('$favoriteCount'),
              isLabelVisible: favoriteCount > 0,
              child: const Icon(Icons.favorite),
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}