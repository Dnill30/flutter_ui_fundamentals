// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import '../models/course.dart';
import '../services/course_data_source.dart';

class CourseRepository {
  final CourseDataSource dataSource;

  CourseRepository(this.dataSource);

  Future<List<Course>> getCourses() async {
    return await dataSource.getCourses();
  }

  Future<Course> createCourse(Course course) async {
    return await dataSource.createCourse(course);
  }

  Future<void> updateCourse(int id, Course course) async {
    await dataSource.updateCourse(id, course);
  }

  Future<void> deleteCourse(dynamic id) async {
    await dataSource.deleteCourse(id);
  }
}