import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository repository;

  CourseProvider([CourseRepository? repository])
      : repository = repository ?? CourseRepository();

  List<Course> courses = [];
  Set<String> favorites = {};
  bool isLoading = false;
  String? error;

  int get favoriteCount => favorites.length;

  List<Course> get favoriteCourses =>
      courses.where((c) => favorites.contains(c.code)).toList();

  bool isFavorite(String code) => favorites.contains(code);

  void toggleFavorite(String code) {
    if (favorites.contains(code)) {
      favorites.remove(code);
    } else {
      favorites.add(code);
    }
    notifyListeners();
  }

  Future<void> loadCourses() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      courses = await repository.getCourses();
      for (var c in courses) {
        if (c.isFavorite) {
          favorites.add(c.code);
        }
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}