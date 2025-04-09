import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/src/res/app_constants.dart';
import 'package:wallet_app/src/res/app_textstyles.dart';

class AboutDevPage extends StatelessWidget{
  const AboutDevPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height*0.15,
                width: size.width,
                child: Stack(
                  children: [
                    CachedNetworkImage(imageUrl: bannerUrl),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: CachedNetworkImageProvider(profileUrl),
                        ),)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(15), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sheraz Ali.", style: AppTextStyles.headingTextStyle,),
                  Text("@sheraz-ali", style: AppTextStyles.regularTextStyle.copyWith(color: Colors.grey),),
                  const SizedBox(height: 10,),
                  Text(devShortDescription,style: AppTextStyles.titleTextStyle.copyWith(fontSize: 16),),
                  const SizedBox(height: 20,),
                  Text("About", style: AppTextStyles.headingTextStyle,),
                  Text(aboutDev, style: TextStyle(fontSize: 14, height: 1.8),),
                  const SizedBox(height: 20,),
                  Text("Skills and Tech Stack", style: AppTextStyles.headingTextStyle,),
                  Divider(),
                  _buildSkillsWidget(title: 'Languages', description: 'Dart, Java '),
                  const SizedBox(height: 2,),
                  _buildSkillsWidget(title: 'Frameworks', description: 'Flutter, Android SDK, Firebase '),
                  const SizedBox(height: 2,),
                  _buildSkillsWidget(title: 'State Management', description: 'BLoC, Provider, Riverpod, GetX'),
                  const SizedBox(height: 2,),
                  _buildSkillsWidget(title: 'API Integration', description: 'Firebase APIs, Push Notifications, Google Maps SDK, ChatGPT API, ZegoCloud, Stripe, RevenueCat, Agora'),

                  const SizedBox(height: 5,),
                  _buildSkillsWidget(title: 'Tools', description: 'Git, Firebase Console, Android Studio, Xcode, Figma'),
          
          
                ],
              ),)
            ],
          ),
        ),
      )
    );
  }

  RichText _buildSkillsWidget({required String title, required String description}) {
    return RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "\t\t•  $title: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: appFontFamily, color: Colors.black)
                  ),
                  TextSpan(
                      text: description,
                      style: TextStyle(fontSize: 16, height: 1.5, fontFamily: appFontFamily, color: Colors.black)
                  )
                ]
              ));
  }

}