// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049
// Worksheet 7: Course Provider (Tahap 9 - Terhubung ke Repository)

import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  List<Course> _courses = [];
  final Set<String> _favoriteCodes = {};
  bool _isLoading = false;
  bool _isSaving = false;
  String? _errorMessage;

  CourseProvider(this._repository);

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get errorMessage => _errorMessage;
  int get favoriteCount => _favoriteCodes.length;

  bool isFavorite(String code) => _favoriteCodes.contains(code);

  void toggleFavorite(String code) {
    if (_favoriteCodes.contains(code)) {
      _favoriteCodes.remove(code);
    } else {
      _favoriteCodes.add(code);
    }
    notifyListeners();
  }

  Future<void> loadCourses() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _courses = await _repository.getCourses();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCourse(Course course) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newCourse = await _repository.createCourse(course);
      _courses.insert(0, newCourse);
      _isSaving = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> editCourse(int id, Course updatedCourse) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.updateCourse(id, updatedCourse);
      
      final index = _courses.indexWhere((item) => item.id == id);
      if (index != -1) {
        _courses[index] = updatedCourse;
      }
      
      _isSaving = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteCourse(int id, String code) async {
    _isSaving = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.deleteCourse(id);
      _courses.removeWhere((item) => item.id == id);
      _favoriteCodes.remove(code);
      _isSaving = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isSaving = false;
      notifyListeners();
      return false;
    }
  }
}