// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider with ChangeNotifier {
  final CourseRepository? repository;

  List<Course> _courses = [];
  bool _isLoading = false;
  String? _errorMessage;

  CourseProvider([this.repository]);

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadCourses() async {
    if (repository == null) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _courses = await repository!.getCourses();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCourse(Course course) async {
    if (repository == null) return false;
    try {
      final newCourse = await repository!.createCourse(course);
      _courses.add(newCourse);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateCourse(dynamic id, Course course) async {
    if (repository == null || id == null) return false;
    final intId = id is int ? id : int.tryParse(id.toString());
    if (intId == null) return false;

    try {
      await repository!.updateCourse(intId, course);
      await loadCourses();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteCourse(dynamic id, [String? code]) async {
    if (repository == null || id == null) return false;
    final intId = id is int ? id : int.tryParse(id.toString());
    if (intId == null) return false;

    try {
      await repository!.deleteCourse(intId);
      _courses.removeWhere((item) => item.id == intId);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}