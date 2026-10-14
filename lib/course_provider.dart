import 'package:flutter/foundation.dart';

// Identitas: Achmad Dhanil Ahkam - 2415051049

// Tahap 5: ChangeNotifier memungkinkan state (daftar course + favorite)
// dan method perubahannya (toggleFavorite) ditempatkan di SATU class
// terpisah dari UI. Setelah state berubah, kita WAJIB memanggil
// notifyListeners() supaya siapa pun yang "mendengarkan" class ini tahu
// harus rebuild.
class CourseProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> courses = [
    {
      'id': '1',
      'code': 'MOB01',
      'title': 'Responsive Layout & Grid',
      'credits': 3,
      'category': 'Mobile Web',
      'status': 'Active',
      'isFavorite': false,
      'description':
          'Mempelajari pembentukan antarmuka yang responsif dengan '
          'MediaQuery, LayoutBuilder, Flex, Wrap, dan GridView dinamis '
          'pada berbagai ukuran layar.',
    },
    {
      'id': '2',
      'code': 'MOB02',
      'title': 'Navigation & Adaptive Shell',
      'credits': 2,
      'category': 'Architecture',
      'status': 'Active',
      'isFavorite': true,
      'description':
          'Penerapan shell navigasi adaptif menggunakan NavigationBar '
          'pada layar sempit dan NavigationRail pada layar lebar beserta '
          'passing data.',
    },
    {
      'id': '3',
      'code': 'MOB03',
      'title': 'Form Validation & Feedback',
      'credits': 3,
      'category': 'User Interaction',
      'status': 'Planned',
      'isFavorite': false,
      'description':
          'Pengelolaan form interaktif dengan GlobalKey<FormState>, '
          'validasi input, serta umpan balik pengguna berupa SnackBar, '
          'Dialog, dan Loading State.',
    },
    {
      'id': '4',
      'code': 'MOB04',
      'title': 'Git Version Control System',
      'credits': 2,
      'category': 'DevOps',
      'status': 'Done',
      'isFavorite': false,
      'description':
          'Manajemen repositori Git, commit bertahap, pengelolaan '
          'branch, dan sinking project ke remote GitHub secara '
          'terstruktur.',
    },
    {
      'id': '5',
      'code': 'MOB05',
      'title': 'Dart Asynchronous Programming',
      'credits': 2,
      'category': 'Core Language',
      'status': 'Done',
      'isFavorite': true,
      'description':
          'Konsep pemrosesan data asynchronous pada Dart menggunakan '
          'Future, async/await, dan simulasi penanganan API.',
    },
  ];


  int get favoriteCount =>
      courses.where((c) => c['isFavorite'] == true).length;

  void toggleFavorite(int index) {
    courses[index]['isFavorite'] = !(courses[index]['isFavorite'] as bool);
    notifyListeners();
  }
}
