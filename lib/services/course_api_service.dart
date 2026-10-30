// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import 'course_data_source.dart';

class CourseApiService implements CourseDataSource {
  final String baseUrl = 'https://api.example.com';

  @override
  Future<List<Course>> getCourses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => Course.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Gagal memuat data dari REST API');
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Course> createCourse(Course course) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(course.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menambah data via REST API');
    }
  }

  @override
  Future<void> updateCourse(dynamic id, Course course) async {
    if (id == null) return;
    final intId = id is int ? id : int.tryParse(id.toString());
    if (intId == null) return;

    final response = await http.put(
      Uri.parse('$baseUrl/posts/$intId'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(course.toJson()),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Gagal memperbarui course');
    }
  }

  @override
  Future<void> deleteCourse(dynamic id) async {
    if (id == null) return;
    final intId = id is int ? id : int.tryParse(id.toString());
    if (intId == null) return;

    final response = await http.delete(
      Uri.parse('$baseUrl/posts/$intId'),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Gagal menghapus course');
    }
  }
}