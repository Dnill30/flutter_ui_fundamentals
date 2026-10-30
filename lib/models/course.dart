// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

class Course {
  final int? id;
  final int? userId;
  final String code;
  final String title;
  final String? body;
  final int credits;
  final String status;
  final String category;
  final String description;

  Course({
    this.id,
    this.userId,
    this.code = '',
    required this.title,
    this.body,
    this.credits = 0,
    this.status = 'planned',
    this.category = 'Utama',
    this.description = '',
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? ''),
      userId: json['user_id'] ?? json['userId'],
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      body: json['body'],
      credits: json['credits'] is int
          ? json['credits']
          : (int.tryParse(json['credits']?.toString() ?? '0') ?? 0),
      status: json['status'] ?? 'planned',
      category: json['category'] ?? 'Utama',
      description: json['description'] ?? '',
    );
  }

  // Hanya kirim field yang sesuai dengan struktur kolom tabel Supabase
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'code': code,
      'title': title,
      'credits': credits,
      'status': status,
    };
    if (id != null) data['id'] = id;
    return data;
  }
}