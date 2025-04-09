import 'package:flutter/cupertino.dart';

class TransactionModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final double amount;
  Color color;


  TransactionModel({required this.title, required this.subTitle, required this.icon, required this.amount, required this.color});
}