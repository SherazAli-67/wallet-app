import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/src/app_data.dart';
import 'package:wallet_app/src/models/savings_model.dart';
import 'package:wallet_app/src/res/app_textstyles.dart';

class SavingsPage extends StatelessWidget{
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text("Savings", style: AppTextStyles.headingTextStyle,),
        centerTitle: true,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
            itemCount: AppData.savings.length,
            itemBuilder: (ctx, index){
              SavingsModel savings = AppData.savings[index];
              String icon = AppData.savingsIcon[index];
              double progress = (savings.savings / savings.target).clamp(0.0, 1.0);
              String percent = "${(progress * 100).toStringAsFixed(0)}%";

              return Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: savings.color,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(savings.title, style: AppTextStyles.headingTextStyle.copyWith(color: Colors.white),),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: savings.color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Balance",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        percent,
                                        style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                  // Progress bar
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.white.withOpacity(0.3),
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      minHeight: 6,
                                    ),
                                  ),
                                  // Bottom row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "\$${savings.savings.toInt()}",
                                          style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white),
                                          children: [
                                            TextSpan(
                                              text: " of \$${savings.target.toInt()}",
                                              style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "14 days left",
                                        style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero
                                ),
                                onPressed: null, child: Text(
                              "See Details", style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white),))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Transform.rotate(
                      angle: -0.5, // approx -43 degrees (in radians)
                      child: SvgPicture.asset(
                        icon,
                        height: 85,
                        color: Colors.black.withOpacity(0.2), // Optional: tint for background design
                      ),
                    ),
                  ),
                ],
              );
        }),
      )),
    );
  }

}