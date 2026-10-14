import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository repository;

  CourseProvider(this.repository);

  List<Course> courses = [];
  bool isLoading = false;
  String? error;

  int get favoriteCount => courses.where((c) => c.isFavorite).length;

  Future<void> loadCourses() async {
    isLoading = true;
    error = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    try {
      courses = await repository.getCourses();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(int index) {
    if (index >= 0 && index < courses.length) {
      courses[index].isFavorite = !courses[index].isFavorite;
      notifyListeners();
    }
  }
}