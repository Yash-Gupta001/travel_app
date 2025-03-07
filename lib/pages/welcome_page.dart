import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AppLargeText(
                          text: 'Trips', 
                        ),

                        AppText(text: 'Mountain',
                        size: 30,),

                        Container(
                          width: 250,
                          child: AppText(
                            text: 'Mountaion is a great place to relax and enjoy the beauty of nature',
                            // color: AppColors.,
                          ),
                        ),




                      ],
                    )
                  ]
                ),
              ),
            );
          }),
    );
  }
}
