// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app1/model/breakfast_model.dart';
import 'package:food_app1/screens/detail_screen.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class FoodItem extends StatelessWidget {
  final Breakfast breakfast;

  FoodItem({required this.breakfast});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 250,
      //color: Colors.amber,
      child: Stack(
        children: [
          /*Container(

            color: Colors.green,
          ),*/
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: DetailScreen(breakfast: breakfast,),
                    duration:const Duration(milliseconds: 800),
                      curve: Curves.elasticIn,),
                );
              },
              child: Container(
                height: 340,
                width: 180,
                decoration:  BoxDecoration(
                  color: Color(0xffe1e2ff),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffededed),
                      offset: Offset(20.0,10.0),
                      blurRadius: 5,
                      spreadRadius: 2

                    ),
                  ]

                ),

              ),
            ),
          ),

          Positioned(
            top: 1,
            left: 7,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xffff0000),
                shape: BoxShape.circle,
                  boxShadow: [
              BoxShadow(
              color: Color(0xffe8a6a8),
                offset: Offset(5.0,10.0),
                blurRadius: 8,
                spreadRadius: 0

            ),
            ]
              ),
              child: Icon(Icons.favorite,
                size: 18,
                color: Colors.white,),
            ),
          ),

          Positioned(
            top: 30,
              right: 1,
              child: Hero(
                tag: 'hero${breakfast.id}',
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                  //color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
            BoxShadow(
            color: Color(0xffC7C8E1),
                    offset: Offset(5.0,15.0),
                    blurRadius: 20,
                    spreadRadius: 2

                ),]
            ),
                  child: Image.asset(breakfast.image2,
                    fit: BoxFit.contain,),
                ),
              )),

          Positioned(
            top: 200,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xffff0000),
                          shape: BoxShape.circle
                      ),

                    ),
                    Gap(16),

                    Hero(
                      tag: 'text${breakfast.id}',
                      child: RichText(
                        text: const TextSpan(
                            text: 'Blue\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            children: [
                              TextSpan(
                                text: 'Salad',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              )
                            ]),
                      ),
                    ),


                  ],
                ),
                Gap(24),
                Container(
                  width: 155,
                    child: Text(breakfast.subtitle)),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
