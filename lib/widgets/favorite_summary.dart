import 'package:flutter/material.dart';

class FavoriteSummaryBar extends StatelessWidget {
  final int favoriteCount;
  const FavoriteSummaryBar({super.key, required this.favoriteCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Text(
            '$favoriteCount course ditandai favorite',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}