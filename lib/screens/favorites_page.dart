import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';
import 'course_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final favCourses = provider.favoriteCourses;

    return favCourses.isEmpty
        ? const Center(
            child: Text(
              'Belum ada course yang ditandai favorit.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favCourses.length,
            itemBuilder: (context, index) {
              final course = favCourses[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
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
                    provider.toggleFavorite(course.code);
                  },
                ),
              );
            },
          );
  }
}