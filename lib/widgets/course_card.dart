// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049
// Worksheet 7: Course Data Manager - Course Card Widget

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';
import '../screens/edit_course_page.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final isFav = provider.isFavorite(course.code);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Badge Kode Course
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    course.code,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // Tombol Edit (Tahap 7 - Mengganti Ikon Panah Bawah)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      tooltip: 'Edit Course',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCoursePage(course: course),
                          ),
                        );
                      },
                    ),
                    // Tombol Favorit
                    IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                      tooltip: 'Favorit',
                      onPressed: () {
                        provider.toggleFavorite(course.code);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Judul Course
            Text(
              course.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${course.credits} SKS • Kategori: ${course.category}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: course.status == 'done'
                      ? Colors.green
                      : (course.status == 'active' ? Colors.orange : Colors.grey),
                ),
                const SizedBox(width: 6),
                Text(
                  'Status: ${course.status}',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}