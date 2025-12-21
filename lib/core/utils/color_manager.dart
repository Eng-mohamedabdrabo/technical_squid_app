import 'package:flutter/material.dart';

/// المسؤول عن كل ألوان التطبيق
/// أي لون جديد لازم يتضاف هنا فقط
/// ممنوع استخدام Colors.xxx مباشرة داخل الـ UI
abstract class ColorManager {

  // ================== الخلفيات ==================

  /// الخلفية الرئيسية الداكنة
  static const Color mainBackground = Color(0xFF071C33);

  /// الخلفية الفاتحة
  static const Color lightBackground = Color(0xFFF9F7F3);

  /// خلفية الكروت الداكنة
  static const Color darkCard = Color(0xFF102F57);

  /// خلفية الكروت الفاتحة
  static const Color lightCard = Color(0xFFFFFFFF);


  // ================== الألوان الأساسية ==================

  /// اللون الأساسي للتطبيق (كحلي)
  static const Color primary = Color(0xFF0B1F3B);

  /// لون التمييز (الذهبي المستخدم في اللابلز)
  static const Color accent = Color(0xFFD9B77A);


  // ================== النصوص ==================

  /// نص غامق على خلفية فاتحة
  static const Color textDark = Color(0xFF0B1F3B);

  /// نص أبيض على خلفية غامقة
  static const Color textLight = Color(0xFFFFFFFF);

  /// نص ثانوي (وصف / تفاصيل)
  static const Color textSecondary = Color(0xFF8FA3BF);


  // ================== الأيقونات ==================

  /// أيقونات غامقة
  static const Color iconDark = Color(0xFF0B1F3B);

  /// أيقونات بيضاء
  static const Color iconLight = Color(0xFFFFFFFF);

  /// أيقونات ذهبية (للـ highlight)
  static const Color iconAccent = Color(0xFFD9B77A);


  // ================== عناصر مساعدة ==================

  /// لون الظل للكروت
  static const Color shadow = Color(0x1A000000);

  /// لون البوردر
  static const Color border = Color(0xFFE6E6E6);
}
