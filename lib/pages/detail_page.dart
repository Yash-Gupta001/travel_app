import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gotratingStar = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/mountain.jpeg"),
                        fit: BoxFit.cover),
                  ),
                )),

            // left side icon
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),

            Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: 'Yosemite',
                              color: Colors.black.withOpacity(0.8)),
                          AppLargeText(
                              text: "₹ 2500", color: AppColors.mainColor)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: 'USA, California',
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < gotratingStar ? AppColors.starColor : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(width: 10,),
                          AppText(text: '(4.0)', color: AppColors.textColor2,)
                        ],
                      ),
                      SizedBox(height: 25,),

                      AppLargeText(text: 'People', color: Colors.black.withOpacity(0.8),size: 20,),
                      SizedBox(height: 5,),

                      AppText(text: "Number of people in your group",color: AppColors.mainTextColor,),
                      Wrap(
                        children: 
                          List.generate(5, (index) {
                            return AppButtons();
                          }),
                        
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
