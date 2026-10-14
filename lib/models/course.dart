
class Course {
  final String id;
  final String code;
  final String title;
  final int credits;
  final String category;
  final String status;
  final String description;

  bool isFavorite;

  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.category,
    required this.status,
    required this.description,
    this.isFavorite = false,
  });
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      credits: json['credits'] as int,
      category: json['category'] as String? ?? '-',
      status: json['status'] as String,
      description: json['description'] as String? ?? 'Tidak ada deskripsi.',
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'credits': credits,
      'category': category,
      'status': status,
      'description': description,
      'isFavorite': isFavorite,
    };
  }
}