import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';
import 'course_detail_page.dart';

class Stage15CoursesPage extends StatelessWidget {
  const Stage15CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${provider.error}',
                style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => provider.loadCourses(),
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    final List<Course> courses = provider.courses;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        final isFav = provider.isFavorite(course.code);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CourseCardWidget(
            course: course,
            isFavorite: isFav,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailPage(course: course),
                ),
              );
            },
            onFavoriteToggle: () {
              context.read<CourseProvider>().toggleFavorite(course.code);
            },
          ),
        );
      },
    );
  }
}