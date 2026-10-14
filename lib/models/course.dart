class Course {
  final String id;
  final String code;
  final String title;
  final int credits;
  final String category;
  final String status;
  bool isFavorite;
  final String? description;

  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.category,
    required this.status,
    this.isFavorite = false,
    this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      code: json['code'] as String,
      title: json['title'] as String,
      credits: json['credits'] as int,
      category: json['category'] as String,
      status: json['status'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      description: json['description'] as String?,
    );
  }

  // TAMBAHKAN METHOD TOJSON() INI:
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'credits': credits,
      'category': category,
      'status': status,
      'isFavorite': isFavorite,
      'description': description,
    };
  }
}