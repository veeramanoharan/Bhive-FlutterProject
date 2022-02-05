// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:bhive_project/constats.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

// ignore: use_key_in_widget_constructors
class ReferalPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
       
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                 Image.asset(bgimg2,
                    height: height * 0.40,
                    width: width,
                fit: BoxFit.cover,
                ),
                         
                Container(
                  height: height*0.50,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [1,0.9],
                      begin:Alignment.topCenter ,
                      end:Alignment.bottomCenter ,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                      Colors.transparent,
                      Colors.white
                    ],),
                  ),
                 
                ),
              ],
            ),
         
          
      
          
          Center(
            child: Text(appName,style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.w900
            ),),
          ),
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                 Text("BHIVE.fund is one of India's largest & fastest-growing"
                      "\n                            investment platforms",style: TextStyle(color: Colors.grey)
                    ),
                  ],
                ),
          Padding(
           padding: const EdgeInsets.only(left:10.0, top:50),
           child: Container(child: 
           Text(
             "  $referal  ",
           style: TextStyle(fontWeight:FontWeight.bold,fontSize:26),),
           decoration: BoxDecoration(
              gradient: LinearGradient(
                        colors: [
                        primarycolor.withOpacity(0.6),
                        primarycolor.withOpacity(0.2)
                      ],),
                      border: Border(left: BorderSide(color: primarycolor,width: 7),),
           ),
           
           ),
         
         ),
         Padding(
           padding: const EdgeInsets.only(top:20),
           child: Center(child: Text(subcontent,style: TextStyle(color:Colors.grey[500],fontWeight: FontWeight.bold,fontSize:14),)),
         ),
          
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                height: height*0.08,
                width: width -200,
                child: FlatButton(color: primarycolor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
                  
                  onPressed: () {},child: Text(refFriend,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
              ),
      
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                height: height*0.08,
                width: width -200,
                child: FlatButton(color: primarycolor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
                  
                  onPressed: () {},child: Text(refDashboard,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),),
              ),
      
            ),
          ),
         
           ],
          
          
      
          
          ),
      ),
      
    );
  }
}