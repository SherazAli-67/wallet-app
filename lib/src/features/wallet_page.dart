import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/src/res/app_constants.dart';
import 'package:wallet_app/src/res/app_icons.dart';
import 'package:wallet_app/src/res/app_textstyles.dart';

class WalletPage extends StatelessWidget{
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3F3F3),
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(profileUrl),
        ),
        leadingWidth: 70,
        title: Text("Wallet", style: AppTextStyles.headingTextStyle,),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.more_vert_rounded,))
        ],
      ),
      backgroundColor: Color(0xffF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                height: size.height*0.2,
                child: Row(
                  spacing: 15,
                  children: [
                    CustomPaint(
                      painter: DashedBorderPainter(),
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (ctx, index){
                          return Container(
                            width: size.width*0.7,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: index == 0 ? Colors.white : Color(0xffFBE5A3)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Total Balance", style: AppTextStyles.regularTextStyle,),
                                            Text("\$10, 000.00", style: AppTextStyles.headingTextStyle,)
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(AppIcons.icCardLogo,)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text('1234 •••• •••• 3456', style: AppTextStyles.titleTextStyle,),
                                ),
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                    color: Colors.black
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.grey),),
                                          Text("Sheraz Ali", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("Exp", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.grey),),
                                          Text("09/25", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transactions", style: AppTextStyles.headingTextStyle,),
                  IconButton(onPressed: null, icon: SvgPicture.asset(AppIcons.icFilter))
                ],
              )
            ],
          ),
        )
      ),
    );
  }

}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(10),
      ));

    drawDashedPath(canvas, path, paint);
  }

  void drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashWidth = 12.0;
    const dashSpace = 10.0;
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final len = dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, distance + len),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}