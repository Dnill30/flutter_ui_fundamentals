

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course.dart';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final String response =
        await rootBundle.loadString('assets/data/student_data.json');
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> courseList = data['courses'] ?? [];

    return courseList
        .map((json) => Course.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}