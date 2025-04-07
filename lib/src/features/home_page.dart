import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/src/res/app_constants.dart';
import 'package:wallet_app/src/res/app_icons.dart';
import 'package:wallet_app/src/res/app_textstyles.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 20,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: CachedNetworkImageProvider(profileUrl),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning!", style: TextStyle(fontSize: 12)),
                        Text("Sheraz Ali", style: AppTextStyles.headingTextStyle)
                      ],
                    )
                  ],
                ),
                SvgPicture.asset(AppIcons.icNotification, height: 30,)
              ],
            ),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: size.width,
                      child: SvgPicture.asset(AppIcons.icCard, fit: BoxFit.cover,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text("Total Balance", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
                      Text("\$25,000.04", style: AppTextStyles.largeTextStyle.copyWith(color: Colors.white),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 15,
                        children: [
                          Text("My Wallet", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_sharp,)),),
                          )
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: size.width,
                      child: SvgPicture.asset(AppIcons.icStatCard, fit: BoxFit.cover,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Icon(Icons.arrow_downward, color: Colors.green,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Income',style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
                                    Text("\$ 20,000", style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white),)
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                        VerticalDivider(color: Colors.white,),
                        Expanded(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Icon(Icons.arrow_upward, color: Colors.red,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Outgoing',style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
                                    Text("\$ 17,000", style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white),)
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  )
                )

              ],
            ),
          ],
        ),
      )),
    );
  }
  
}