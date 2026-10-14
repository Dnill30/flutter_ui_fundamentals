import 'package:flutter/foundation.dart';
import 'models/course.dart';
import 'repositories/course_repository.dart';

// Identitas: Achmad Dhanil Ahkam - 2415051049

// Tahap 11: CourseProvider menjadi state holder untuk async state:
// courses (data), isLoading (loading), dan error (error).
// UI cukup membaca ketiganya, tidak menangani detail pengambilan data.
class CourseProvider extends ChangeNotifier {
  // Tahap 11 (langkah 46): repository sebagai dependency.
  final CourseRepository repository;

  CourseProvider(this.repository);

  List<Course> courses = [];
  bool isLoading = false;
  String? error;

  // Status favorit disimpan di provider (berdasarkan id course), sehingga
  // tidak bergantung pada isi model Course.
  final Set<String> _favoriteIds = {};
  bool _favoritesSeeded = false;

  // Tahap 9: state & logic pencarian
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Tahap 11 (langkah 47): implementasi loadCourses().
  Future<void> loadCourses() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      courses = await repository.getCourses();
      // Data awal favorit (sama seperti data sebelumnya: MOB02 dan MOB05),
      // hanya diisi sekali agar pilihan favorit tidak hilang saat reload.
      if (!_favoritesSeeded) {
        _favoriteIds.addAll({'2', '5'});
        _favoritesSeeded = true;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isFavorite(Course course) => _favoriteIds.contains(course.id.toString());

  int get favoriteCount =>
      courses.where((c) => _favoriteIds.contains(c.id.toString())).length;

  List<Course> get filteredCourses {
    if (_searchQuery.isEmpty) return courses;
    final q = _searchQuery.toLowerCase();
    return courses
        .where((c) =>
            c.title.toLowerCase().contains(q) ||
            c.code.toLowerCase().contains(q))
        .toList();
  }

  void toggleFavorite(Course course) {
    final id = course.id.toString();
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }
}