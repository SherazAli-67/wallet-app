import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/src/features/home_page.dart';
import 'package:wallet_app/src/res/app_icons.dart';
import 'package:wallet_app/src/res/app_textstyles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.welcomePageBgImg),
                    Image.asset(AppIcons.welcomePageFrontImg),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text("Make Your Financial Management Easier", style: AppTextStyles.largeTextStyle.copyWith(color: Colors.white),),
              const SizedBox(height: 10,),
              Text('Financy is a mobile application that can help you manage your finances in a simple way.', style: AppTextStyles.regularTextStyle.copyWith(color: Colors.white),),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Center(child: IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomePage()));
                  }, icon: Icon(Icons.arrow_forward_sharp)),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
