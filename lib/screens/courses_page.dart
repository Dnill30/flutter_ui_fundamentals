// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card_widget.dart';
import 'course_detail_page.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final courses = provider.courses;

    if (provider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Daftar Course')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Course'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CourseCardWidget(
              course: course,
              isFavorite: provider.isFavorite(course.code),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CourseDetailPage(course: course),
                  ),
                );
              }, onFavoriteToggle: () {  },
            ),
          );
        },
      ),
    );
  }
}