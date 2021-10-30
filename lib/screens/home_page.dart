import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app1/widgets/circle_indicator.dart';
import 'package:food_app1/widgets/food_item.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
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
                            return FoodItem();
                            },
                            separatorBuilder: (context, index){
                          return const SizedBox(width: 2,);
                            }, itemCount: 4),
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
          ],
        ),
      ),
    );
  }
}
