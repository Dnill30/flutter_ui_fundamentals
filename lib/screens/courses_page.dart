import 'package:flutter/material.dart';
import 'package:flutter_ui_fundamentals/course_provider.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';

class Stage15CoursesPage extends StatelessWidget {
  const Stage15CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();

    if (provider.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text('Memuat data course...'),
          ],
        ),
      );
    }

    if (provider.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 12),
              Text(
                'Gagal memuat data: ${provider.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => provider.loadCourses(),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    final List<Course> courses = provider.courses;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CourseCardWidget(
          course: courses[index],
          isFavorite: courses[index].isFavorite,
          onTap: () {},
          onFavoriteToggle: () {
            context.read<CourseProvider>().toggleFavorite(index);
          },
        ),
      ),
    );
  }
}