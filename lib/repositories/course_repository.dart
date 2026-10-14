import '../models/course.dart';
import '../services/course_service.dart';

class CourseRepository {
  final CourseService service;

  CourseRepository([CourseService? service])
      : service = service ?? CourseService();

  Future<List<Course>> getCourses() async {
    return await service.fetchCourses();
  }
}