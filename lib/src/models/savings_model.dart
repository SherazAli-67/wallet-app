import 'package:flutter/cupertino.dart';

class SavingsModel {
  final String title;
  final double target;
  final double savings;
  final IconData icon;
  Color color;

  SavingsModel({required this.title, required this.target, required this.savings, required this.icon, required this.color});
}