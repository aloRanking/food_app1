import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app1/model/breakfast_model.dart';
import 'package:food_app1/utils/strings.dart';
import 'package:gap/gap.dart';

class DetailScreen extends StatefulWidget {
  final Breakfast breakfast;
  DetailScreen({Key? key, required this.breakfast}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1E2FF),
      body: SafeArea(
        child: Column(
          children: [
            Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   GestureDetector(
              onTap: (){
            Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back)),

                  Row(
                    children: const [
                       Icon(Icons.search),
                       Gap(16),
                      Icon(Icons.dashboard_outlined),
                    ],
                  ),
                ],
              ),

            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
              child: Row(
                children: [
                  Hero(
                    tag: 'text${widget.breakfast.id}',
                    child: RichText(
                      text: const TextSpan(
                          text: 'Blue ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                          children: [
                            TextSpan(
                              text: 'Salad',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),



            Container(



              //padding:const EdgeInsets.only(left: 24),
              child: Stack(
                children: [
                  Container(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 260,
                      //color: Colors.red,
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    bottom: 65,
                    height: 20,
                    width: 50,
                    child: DecoratedBox(
                        decoration:  BoxDecoration(

                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffBEBDCB),
                              offset: Offset(0,10),
                              blurRadius: 20,
                              spreadRadius: 45
                          )
                        ]
                    )),
                  ),
                  Positioned(
                    left: 24,
                    top: 30,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        FoodInfo(
                          icon: Icons.access_time_outlined,
                          info: '32 MINS',
                        ),
                        Gap(16),
                        FoodInfo(
                          icon: Icons.person,
                          info: '2 PEOPLE',
                        ),
                        Gap(16),
                        FoodInfo(
                          icon: Icons.sports_soccer_outlined,
                          info: '23 CALORIES',
                        ),
                      ],

                    ),
                  ),
                  Positioned(
                    right: -80,
                    child: Hero(
                      tag: 'hero${widget.breakfast.id}',
                      child: Container(
                        height: 230,
                        width: 230,


                        child: Image.asset(widget.breakfast.image2,

                          ),
                      ),
                    ),
                  ),


                ],
              ),
            ),


            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),

                  )
                ),
                child: Column(
                  children: [
                    Gap(12),
                    Container(
                      width: 150,
                        height: 5,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius:BorderRadius.circular(16),

                      ),
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Text('Directions',style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 1.2
                        ),),

                      ],
                    ),

                    Gap(16),

                    Table(columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(9),

                    },
                      children: [

                        TableRow(

                            children: [

                              Column(
                                children: [
                                  Gap(4),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Color(0xffff0000),
                                        shape: BoxShape.circle
                                    ),

                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Text(direction1,
                                  style: TextStyle(
                                    color: Color(0xffA5ABC2),
                                    fontSize: 14,
                                    height: 1.2
                                  ),),
                                  Gap(16),
                                ],
                              )


                            ]
                        ),

                        TableRow(

                            children: [

                              Column(
                                children: [
                                  Gap(4),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Color(0xffff0000),
                                        shape: BoxShape.circle
                                    ),

                                  ),
                                ],
                              ),

                              Text(direction2,
                                style: TextStyle(
                                    color: Color(0xffA5ABC2),
                                    fontSize: 14,
                                    height: 1.2
                                ),)


                            ]
                        )
                      ],

                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    Key? key, required this.info, required this.icon,
  }) : super(key: key);

  final String info;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,
        color: Color(0xffFF7044),),
        Gap(16),
        Text(info,
        style: TextStyle(
          color: Color(0xff898EB3),
          fontWeight: FontWeight.w700
        ),)
      ],
    );
  }
}