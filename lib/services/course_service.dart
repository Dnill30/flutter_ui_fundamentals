import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course.dart';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final String response =
        await rootBundle.loadString('assets/data/student_data.json');
    final dynamic decoded = json.decode(response);

    List<dynamic> courseList = [];
    if (decoded is Map<String, dynamic>) {
      courseList = decoded['courses'] ?? [];
    } else if (decoded is List) {
      courseList = decoded;
    }

    return courseList
        .map((item) => Course.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}