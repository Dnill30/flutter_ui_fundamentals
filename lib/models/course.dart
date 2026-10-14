class Course {
  final String id;
  final String code;
  final String title;
  final int credits;
  final String category;
  final String status;
  bool isFavorite;
  final String description;

  Course({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.category,
    required this.status,
    this.isFavorite = false,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    String rawStatus = json['status']?.toString() ?? 'active';
    String formattedStatus = rawStatus.isNotEmpty
        ? rawStatus[0].toUpperCase() + rawStatus.substring(1)
        : 'Active';

    return Course(
      id: json['id']?.toString() ?? json['code']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      credits: json['credits'] is int
          ? json['credits'] as int
          : int.tryParse(json['credits']?.toString() ?? '0') ?? 0,
      category: json['category']?.toString() ?? 'Utama',
      status: formattedStatus,
      isFavorite: json['isFavorite'] as bool? ?? false,
      description: json['description']?.toString() ??
          'Dosen Pengampu: ${json['dosen'] ?? 'Belum ditentukan'}',
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
      'isFavorite': isFavorite,
      'description': description,
    };
  }
}