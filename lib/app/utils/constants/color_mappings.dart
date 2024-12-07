import 'package:flutter/material.dart';

class ColorMapping {
  static final List<Color> predefinedColors = [
    const Color(0xFF1E88E5),
    const Color(0xFF43A047),
    const Color(0xFFD32F2F),
    const Color(0xFFFB8C00),
    const Color(0xFF8E24AA),
    const Color(0xFF0288D1),
    const Color(0xFF7B1FA2),
    const Color(0xFFFBC02D),
    const Color(0xFF009688),
    const Color(0xFF7C4DFF),
    const Color(0xFFAD1457),
    const Color(0xFF9E9D24),
    const Color(0xFF689F38),
    const Color(0xFFB71C1C),
    const Color(0xFF512DA8),
    const Color(0xFF303F9F),
    const Color(0xFF8D6E63),
    const Color(0xFFB2FF59),
    const Color(0xFFFF4081),
    const Color(0xFFFFC107),
    const Color(0xFF00E5FF),
    const Color(0xFF00C853),
    const Color(0xFF6200EA),
    const Color(0xFF00B0FF),
    const Color(0xFFFF9100),
    const Color(0xFFFF5722),
    const Color(0xFF00BFAE),
    const Color(0xFF1A73E8),
    const Color(0xFFDD2C00),
    const Color(0xFF536DFE),
    const Color(0xFFFFD600),
    const Color(0xFF64DD17),
    const Color(0xFFFF6D00),
    const Color(0xFFFF80AB),
    const Color(0xFF8E99F3),
    const Color(0xFF9C27B0),
    const Color(0xFF607D8B),
    const Color(0xFF0D47A1),
    const Color(0xFFB2EBF2),
    const Color(0xFFFFF176),
    const Color(0xFF3D5AFE),
    const Color(0xFF6200EE),
    const Color(0xFF00B8D4),
    const Color(0xFF4CAF50),
    const Color(0xFFFF1744),
    const Color(0xFF00C1D6),
    const Color(0xFF9C27B0),
    const Color(0xFF7F33CC),
    const Color(0xFF1D8E94),
    const Color(0xFF80E4F7),
    const Color(0xFFB2F4B4),
    const Color(0xFFff6358),
    const Color(0xFF20B2AA),
    const Color(0xFFFEFF00),
    const Color(0xFF512DA8),
    const Color(0xFFDD4C3D),
    const Color(0xFF2E7D32),
    const Color(0xFFF2C78E),
    const Color(0xFF23A6D5),
    const Color(0xFF7E57C2),
    const Color(0xFFB388FF),
    const Color(0xFFFF304F),
    const Color(0xFF00E676),
    const Color(0xFFFF4081),
    const Color(0xFF00695C),
    const Color(0xFF00D4B7),
    const Color(0xFFEF5350),
    const Color(0xFF26C6DA),
    const Color(0xFF0288D1),
    const Color(0xFF9E4F96),
    const Color(0xFF8E44AD),
    const Color(0xFF45A049),
    const Color(0xFFFF4081),
    const Color(0xFF00ACC1),
    const Color(0xFFCDDC39),
    const Color(0xFFEF6C00),
    const Color(0xFFAB47BC),
    const Color(0xFF00B8D4),
    const Color(0xFFFBC02D),
    const Color(0xFFFF5252),
    const Color(0xFF388E3C),
    const Color(0xFFFF9800),
    const Color(0xFF616161),
    const Color(0xFF0288D1),
    const Color(0xFF9C27B0),
    const Color(0xFF00B8D4),
    const Color(0xFF2196F3),
    const Color(0xFFFFEB3B),
    const Color(0xFF607D8B),
    const Color(0xFF004D40),
    const Color(0xFF607D8B),
  ];

  static Color getColorForCategory(String category) {
    int hash = category.hashCode;
    int colorIndex = hash % predefinedColors.length;
    return predefinedColors[colorIndex];
  }
}
