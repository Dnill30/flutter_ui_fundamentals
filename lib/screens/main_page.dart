import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import 'home_page.dart';
import 'courses_page.dart';
import 'favorites_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CoursesPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.watch<CourseProvider>();
    final int favoriteCount = courseProvider.favoriteCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Explorer v2'),
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive Navigation untuk Mobile
          if (constraints.maxWidth < 840) {
            return Scaffold(
              body: pages[selectedIndex],
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (idx) =>
                    setState(() => selectedIndex = idx),
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      label: Text('${courseProvider.courses.length}'),
                      isLabelVisible: courseProvider.courses.isNotEmpty,
                      child: const Icon(Icons.school),
                    ),
                    label: 'Courses',
                  ),
                  NavigationDestination(
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

          // Responsive Navigation untuk Desktop/Tablet
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (idx) =>
                      setState(() => selectedIndex = idx),
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Badge(
                        label: Text('${courseProvider.courses.length}'),
                        isLabelVisible: courseProvider.courses.isNotEmpty,
                        child: const Icon(Icons.school),
                      ),
                      label: const Text('Courses'),
                    ),
                    NavigationRailDestination(
                      icon: Badge(
                        label: Text('$favoriteCount'),
                        isLabelVisible: favoriteCount > 0,
                        child: const Icon(Icons.favorite),
                      ),
                      label: const Text('Favorites'),
                    ),
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