import 'package:flutter/material.dart';

const String studentName = 'Achmad Dhanil Ahkam';
const String studentId = '2415051049';

class StudentHeaderWidget extends StatelessWidget {
  final String title;
  const StudentHeaderWidget({super.key, this.title = 'Identitas Mahasiswa'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1976D2)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            studentName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xFF1976D2),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'NIM: $studentId',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}