import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png" : "Balloning",
    "hicking.png" : "Hicking",
    "kayaking.png" : "Kayaking",
    "snorkling.png" : "Paragliding",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu TEXT
          // ignore: avoid_unnecessary_containers
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(children: [
                Icon(
                  Icons.menu,
                  size: 30.0,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // DISCOVER TEXT
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: AppLargeText(text: 'Discover'),
          ),
          SizedBox(
            height: 20,
          ),

          // TABBAR
          // ignore: avoid_unnecessary_containers
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(
                      text: 'Places',
                    ),
                    Tab(
                      text: 'Inspiration',
                    ),
                    Tab(
                      text: 'Emotions',
                    ),
                  ]),
            ),
          ),


          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/img/mountain.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Text('There'),
              Text('How'),
            ]),
          ),
          SizedBox(
            height: 30,
          ), 
          
          Container(
            margin: EdgeInsets.only(left: 20 , right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: 
                  'Explore more', 
                  size: 22
                  ),
                AppText(
                  text: 'see all', 
                  size: 16, color: 
                  AppColors.textColor1,
                  ),
                
                  
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),

          Container(
            width: double.maxFinite,
            height: 120,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
              return Container(
                margin: const EdgeInsets.only(right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(right: 50),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/img/${images.keys.elementAt(index)}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 9,
                    ),
                
                    Container(
                      margin: const EdgeInsets.only(right: 50),
                      child: AppText(
                        text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    )
                
                
                
                  ],
                ),
              );
            }),
          )


        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, this.radius = 3.0});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = offset +
        Offset(configuration.size!.width / 2 - radius / 2,
            configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
