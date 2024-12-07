import 'package:flutter/material.dart';

class ColorMapping {
  static final List<Color> predefinedColors = [
    const Color(0xFF1E88E5), // Blue
    const Color(0xFF43A047), // Green
    const Color(0xFFD32F2F), // Red
    const Color(0xFFFB8C00), // Orange
    const Color(0xFF8E24AA), // Purple
    const Color(0xFF0288D1), // Light Blue
    const Color(0xFF7B1FA2), // Deep Purple
    const Color(0xFFFBC02D), // Yellow
    const Color(0xFF009688), // Teal
    const Color(0xFF7C4DFF), // Indigo
    const Color(0xFFAD1457), // Pink
    const Color(0xFF9E9D24), // Lime
    const Color(0xFF689F38), // Green
    const Color(0xFFB71C1C), // Dark Red
    const Color(0xFF512DA8), // Deep Purple
    const Color(0xFF303F9F), // Blue
    const Color(0xFF8D6E63), // Brown
    const Color(0xFFB2FF59), // Lime Green

    // Tambahan warna cerah
    const Color(0xFFFF4081), // Hot Pink
    const Color(0xFFFFC107), // Amber
    const Color(0xFF00E5FF), // Cyan
    const Color(0xFF00C853), // Green A400
    const Color(0xFF6200EA), // Deep Purple 500
    const Color(0xFF00B0FF), // Vivid Blue
    const Color(0xFFFF9100), // Orange 500
    const Color(0xFFFF5722), // Deep Orange
    const Color(0xFF8E24AA), // Purple 400
    const Color(0xFF00BFAE), // Teal 500
    const Color(0xFF1A73E8), // Google Blue
    const Color(0xFFDD2C00), // Red A400
    const Color(0xFF536DFE), // Indigo A400
    const Color(0xFFFFD600), // Yellow 500
    const Color(0xFF64DD17), // Light Green 500
    const Color(0xFFFF6D00), // Orange 800
    const Color(0xFFFF80AB), // Pink 100
    const Color(0xFF8E99F3), // Light Blue 200
    const Color(0xFF9C27B0), // Purple 500
    const Color(0xFF607D8B), // Blue Grey 500
    const Color(0xFF0D47A1), // Blue 900
    const Color(0xFFB2EBF2), // Light Cyan
    const Color(0xFF43A047), // Dark Green
    const Color(0xFFFFF176), // Amber 100
    const Color(0xFF3D5AFE), // Indigo 400
    const Color(0xFFB71C1C), // Dark Red
    const Color(0xFF6200EE), // Purple 600
  ];

  // Fungsi untuk mendapatkan warna berdasarkan nama kategori (atau ID)
  static Color getColorForCategory(String category) {
    // Menghitung hash dari kategori untuk mendapatkan indeks warna yang konsisten
    int hash = category.hashCode;
    int colorIndex = hash % predefinedColors.length;
    return predefinedColors[colorIndex];
  }
}
