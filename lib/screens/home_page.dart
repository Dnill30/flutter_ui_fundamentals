import 'package:flutter/material.dart';
import 'package:flutter_ui_fundamentals/course_provider.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../widgets/student_header.dart';
import '../widgets/course_card.dart';
import '../widgets/favorite_summary.dart';

class Stage15HomePage extends StatelessWidget {
  const Stage15HomePage({super.key});

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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StudentHeaderWidget(title: 'Course Explorer Home'),
          const SizedBox(height: 16),
          FavoriteSummaryBar(favoriteCount: provider.favoriteCount),
          const Text('Course Favorit:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          for (int i = 0; i < courses.length; i++)
            if (courses[i].isFavorite)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CourseCardWidget(
                  course: courses[i],
                  isFavorite: true,
                  onTap: () {},
                  onFavoriteToggle: () {
                    context.read<CourseProvider>().toggleFavorite(i);
                  },
                ),
              ),
        ],
      ),
    );
  }
}