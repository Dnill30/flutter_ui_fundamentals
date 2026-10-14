import 'package:flutter/material.dart';
import 'package:flutter_ui_fundamentals/course_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'courses_page.dart';
import 'profile_page.dart';

class Stage15MainPage extends StatefulWidget {
  const Stage15MainPage({super.key});

  @override
  State<Stage15MainPage> createState() => _Stage15MainPageState();
}

class _Stage15MainPageState extends State<Stage15MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Stage15HomePage(),
    Stage15CoursesPage(),
    Stage15ProfileFeedbackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.watch<CourseProvider>();
    final int favoriteCount = courseProvider.favoriteCount;

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
                destinations: [
                  const NavigationDestination(
                      icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                    icon: Badge(
                      label: Text('$favoriteCount'),
                      isLabelVisible: favoriteCount > 0,
                      child: const Icon(Icons.school),
                    ),
                    label: 'Courses',
                  ),
                  const NavigationDestination(
                      icon: Icon(Icons.person), label: 'Profile'),
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
                  destinations: [
                    const NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(
                      icon: Badge(
                        label: Text('$favoriteCount'),
                        isLabelVisible: favoriteCount > 0,
                        child: const Icon(Icons.school),
                      ),
                      label: const Text('Courses'),
                    ),
                    const NavigationRailDestination(
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