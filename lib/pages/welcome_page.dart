import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png", 
    'welcome-two.png', 
    'welcome-three.png'
    ];

  // List text = [
  //   ...
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image:
                    DecorationImage(
                      image: 
                      AssetImage(
                        "assets/img/" + images[index]
                      ),
                      fit: BoxFit.cover
                      ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AppLargeText(
                          text: "Trips",
                          // text[index], 
                        ),

                        AppText(text: 'Mountain',
                        size: 30,),
                        SizedBox(height: 20,),

                        Container(
                          width: 250,
                          child: AppText(
                            text: 'Mountaion is a great place to relax and enjoy the beauty of nature',
                             color: AppColors.textColor2,
                             size: 14,
                          ),
                        ),

                        SizedBox(height: 40,),

                        ResponsiveButton(
                          width: 120,
                        ),
                      ],
                    ),

                    Column(
                      children: List.generate(3, (indexDots){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),  
                              borderRadius: BorderRadius.circular(8)
                            ),
                          );
                        }),
                      
                    ) 
                  ]
                ),
              ),
            );
          }),
    );
  }
}
