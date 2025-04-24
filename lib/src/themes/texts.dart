import 'package:flutter/material.dart';

class KubsuTexts {
  KubsuTexts({required this.textColor});

  final Color textColor;

  final heading1 = TextStyle(fontWeight: FontWeight.w800, fontSize: 72, letterSpacing: -1.44, height: 1.4);
  final heading2 = TextStyle(fontWeight: FontWeight.w700, fontSize: 56, letterSpacing: -1.01, height: 1.5);
  final heading3 = TextStyle(fontWeight: FontWeight.w700, fontSize: 60, letterSpacing: -0.64, height: 1.5);
  final heading4 = TextStyle(fontWeight: FontWeight.w600, fontSize: 32, letterSpacing: -0.45, height: 1.5);
  final heading5 = TextStyle(fontWeight: FontWeight.w500, fontSize: 24, letterSpacing: -0.24, height: 1.5);
  final heading6 = TextStyle(fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: -0.12, height: 1.6);
  final subtitle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: -0.13, height: 1.5);
  final body = TextStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: -0.13, height: 1.5);
  final small = TextStyle(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: -0.12, height: 1.6);
}
