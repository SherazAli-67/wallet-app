import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/src/features/wallet_page.dart';
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
      body: SafeArea(child: SingleChildScrollView(
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
                            child: Center(child: IconButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> WalletPage()));
                            }, icon: Icon(Icons.arrow_forward_sharp,)),),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Earnings", style: AppTextStyles.headingTextStyle,),
                TextButton(onPressed: (){}, child: Text("See All", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.w600),))
              ],
            ),
            SizedBox(
              height: size.height*0.18,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index){
                    return Container(
                      width: size.width*0.31,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: randomColor
                      ),
                      margin: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: Center(child: Text("U", style: AppTextStyles.titleTextStyle,),),
                          ),
                          const Spacer(),
                          Text("Upwork", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
                          Text('\$3,000', style: AppTextStyles.titleTextStyle.copyWith(color: Colors.white),)
                        ],
                      ),
                    );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Savings", style: AppTextStyles.headingTextStyle,),
                TextButton(onPressed: (){}, child: Text("See All", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.w600),))
              ],
            ),
            SizedBox(
              height: size.height*0.3,
              child: GridView.builder(
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index){
                    return  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 1
                            ),
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1
                            ),

                          ],
                        color: Colors.white
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('iPhone 13 Pro', style: AppTextStyles.regularTextStyle,)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                          Text('\$699', style: AppTextStyles.titleTextStyle,),
                          FutureBuilder(future: _getProgressBarValue(), builder: (ctx, snapshot){
                            if(snapshot.hasData){
                              return TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0.0, end: snapshot.requireData),
                                duration: Duration(seconds: 2),
                                builder: (context, double value, child) {
                                  return Container(
                                    width: 300,
                                    height: 10,
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: value * 300, // Adjust width based on progress
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: randomColor,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            return SizedBox();
                          })
                        ],
                      ),
                    );
                  },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  childAspectRatio: 4/2.5
                ),

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions", style: AppTextStyles.headingTextStyle,),
                TextButton(onPressed: (){}, child: Text("See All", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.w600),))
              ],
            ),
            SizedBox(
              height: size.height*0.4,
              child: ListView.builder(
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index){
                  return  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 1
                          ),
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1
                          ),

                        ],
                        color: Colors.white
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber.withOpacity(0.3),
                        child: Center(
                          child: Icon(Icons.computer, color: Colors.amber,),
                        ),
                      ),
                      title: Text("App Development", style: AppTextStyles.titleTextStyle,),
                      subtitle: Text("Developer payment", style: AppTextStyles.regularTextStyle,),
                      trailing: Text("-\$450", style: AppTextStyles.titleTextStyle.copyWith(color: Colors.red),),
                    )
                  );
                },

              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<double> _getProgressBarValue() async{
    Future.delayed(Duration(milliseconds: 600), () {});
    return 0.4;
  }

  Color get randomColor {
    List<Color> colors = [
      Colors.blue,
      Colors.redAccent,
      Colors.green,
      Colors.purple,
      Colors.amber,
      Colors.brown
    ];

    int randomIndex = Random().nextInt(colors.length);

    return colors[randomIndex];
  }
}