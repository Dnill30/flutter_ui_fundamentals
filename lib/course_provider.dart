import 'package:flutter/material.dart';
import 'models/course.dart';
import 'repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository repository;

  CourseProvider(this.repository);

  List<Course> courses = [];
  bool isLoading = false;
  String? error;
  String searchQuery = '';

  int get favoriteCount => courses.where((c) => c.isFavorite).length;

  List<Course> get filteredCourses {
    if (searchQuery.isEmpty) return courses;
    return courses.where((c) =>
      c.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
      c.code.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  Future<void> loadCourses() async {
    isLoading = true;
    error = null;
    notifyListeners();

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

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}