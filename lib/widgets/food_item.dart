import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FoodItem extends StatelessWidget {
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
            child: Container(
              height: 340,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xff00adf2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(20.0,10.0),
                    blurRadius: 5,
                    spreadRadius: 2

                  ),
                 /* BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0,5.0),
                      blurRadius: 1,
                      spreadRadius: 1

                  )*/
                ]

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
                shape: BoxShape.circle
              ),
              child: Icon(Icons.favorite,
                size: 18,
                color: Colors.white,),
            ),
          ),

          Positioned(
            top: 30,
              right: 1,
              child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
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

                    RichText(
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


                  ],
                ),
                Gap(24),
                Container(
                  width: 155,
                    child: Text('A salad is a dish consisting of a mixture of small pieces of food, usually vegetables')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
