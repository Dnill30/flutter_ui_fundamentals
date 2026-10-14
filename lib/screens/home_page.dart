import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';
import '../widgets/student_header.dart';
import '../widgets/course_card.dart';
import '../widgets/favorite_summary.dart';
import 'course_detail_page.dart';

class Stage15HomePage extends StatelessWidget {
  const Stage15HomePage({super.key});

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

    final List<Course> favCourses = provider.favoriteCourses;

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
          if (favCourses.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text('Belum ada course favorit.',
                    style: TextStyle(color: Colors.grey)),
              ),
            )
          else
            for (var course in favCourses)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CourseCardWidget(
                  course: course,
                  isFavorite: true,
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
              ),
        ],
      ),
    );
  }
}