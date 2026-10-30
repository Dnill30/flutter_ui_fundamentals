// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import '../models/course.dart';

abstract class CourseDataSource {
  Future<List<Course>> getCourses();
  Future<Course> createCourse(Course course);
  Future<void> updateCourse(int id, Course course);
  Future<void> deleteCourse(dynamic id);
}