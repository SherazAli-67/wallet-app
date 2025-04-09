import 'package:flutter/material.dart';
import 'package:wallet_app/src/models/earning_model.dart';
import 'package:wallet_app/src/models/savings_model.dart';
import 'package:wallet_app/src/models/transaction_model.dart';
import 'package:wallet_app/src/res/app_icons.dart';

class AppData {
  static  List<TransactionModel> get
  transactions {
    return [
    TransactionModel(title: "App Store",
        subTitle: "Apple Developer Program Subscription Fee",
        icon: Icons.apple_rounded,
        amount: -99.00,
      color: Colors.black45
    ),
    TransactionModel(title: "Google Play Console",
        subTitle: "Google Play Console Subscription Fee",
        icon: Icons.android,
        amount: -25.00,
      color: Colors.green
    ),
    TransactionModel(title: "Sales Navigator",
        subTitle: "LikedIn Premium Subscription",
        icon: Icons.navigation_outlined,
        amount: -99.00,
      color: Colors.blue
    ),
    TransactionModel(title: "Office Setup",
        subTitle: "Desktop Accessories and Equipments",
        icon: Icons.desktop_mac,
        amount: -45.00,
      color: Colors.blueGrey
    ),
    TransactionModel(title: "Solar Panel",
        subTitle: "Summer Internship Program",
        icon: Icons.sunny,
        amount: -750.00,
      color: Colors.amber

    )
    ];
  }

  static  List<SavingsModel> get savings {
    return [
      SavingsModel(title: "iPhone 13 Pro", target: 1500, savings: 500, icon: Icons.phone_iphone_rounded,color: Colors.indigoAccent),
      SavingsModel(title: "Car", target: 75000, savings: 31500, icon: Icons.credit_card, color: Color(0xffE78C9D)),
      SavingsModel(title: "Office", target: 85000, savings:7000, icon: Icons.credit_card, color: Colors.green),
      SavingsModel(title: "House", target: 15500, savings: 6000, icon: Icons.house, color: Colors.grey),

    ];
  }

  static List<EarningsModel> get earnings {
    return [
      EarningsModel(source: "Remote Job", amount: 1200, color: Color(0xffE0533D)),
      EarningsModel(source: "Upwork", amount: 2000, color: Color(0xffE78C9D)),
      EarningsModel(source: "ArabVet", amount: 500, color: Color(0xff377CC8)),
      EarningsModel(source: "App Subscriptions", amount: 700, color: Colors.amber),
    ];
  }

  static List<String> get savingsIcon {
    return [
      AppIcons.icMobile,
      AppIcons.icCar,
      AppIcons.icBuilding,
      AppIcons.icHouse
    ];
  }
}