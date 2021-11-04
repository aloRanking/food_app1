import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app1/model/breakfast_model.dart';
import 'package:food_app1/widgets/circle_indicator.dart';
import 'package:food_app1/widgets/custom_bottom_navbar.dart';
import 'package:food_app1/widgets/food_item.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(

                child: Stack(
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Color(0xfffbfbfb),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.search),
                          Gap(16),
                          Icon(Icons.dashboard_outlined),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 32,
                      child: RichText(
                        text: const TextSpan(
                            text: 'Break',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                            ),
                            children: [
                              TextSpan(
                                text: 'fast',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.w700),
                              )
                            ]),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 20,
                      child: RotatedBox(
                        quarterTurns: -45,
                        child: TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: CircleTabIndicator(
                              color: const Color(0xffff0000), radius: 4),
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: const <Widget>[
                            Tab(text: 'Seafood'),
                            Tab(text: 'Noddles'),
                            Tab(text: 'Bread'),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 120,
                      left: 90,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 380,
                            width: 350,


                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index){
                                    return FoodItem(breakfast:breakfastList[index]);
                                    },
                                    separatorBuilder: (context, index){
                                  return const SizedBox(width: 2,);
                                    }, itemCount: breakfastList.length),
                                Center(
                                  child: Text("It's rainy here"),
                                ),
                                Center(
                                  child: Text("It's sunny here"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 500,
                        left: 24,
                        child: Row(

                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Icon(
                            Icons.sort,
                          ),
                        ),
                        Gap(20),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffF5F5F5),
                            ),
                            child: const Text("Beer",
                            style: TextStyle(
                              color: Color(0xff9EA8C7),
                                fontWeight: FontWeight.w700

                            ),),
                          ),
                        ),
                        Gap(20),
                        Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffFF7044),
                            ),
                            child: const Text("Foods",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700
                              ),),
                          ),
                        ),
                        Gap(20),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xffF5F5F5),
                            ),
                            child: const Text("Wine",
                              style: TextStyle(
                                color: Color(0xff9EA8C7),
                                  fontWeight: FontWeight.w700
                              ),),
                          ),
                        ),



                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );


  }
  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.transparent,
      selectedIndex: _currentIndex,
      showElevation: false,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Color(0xffFF7044),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Color(0xffFF7044),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.bookmark),
          title: Text(
            'Messages ',
          ),
          activeColor: Color(0xffFF7044),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Color(0xffFF7044),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
