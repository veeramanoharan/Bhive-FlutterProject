


// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use, unused_import

import 'package:bhive_project/constats.dart';
import 'package:bhive_project/referralpage.dart';
import 'package:bhive_project/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'colors.dart';



// ignore: use_key_in_widget_constructors
class  LoginScreen extends StatefulWidget {
 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email,_password;  

void signin(BuildContext context)async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).catchError((onError){
    print(onError);
  }).then((authUser){
    if(authUser.user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferalPage()));
    }
  });
}



  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      
          body:GestureDetector(
            onTap: ()=>FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                       Image.asset(bgimage,
                          height: height * 0.40,
                          width: width,
                      fit: BoxFit.cover,
                      ),
                                   
                 
                      Container(
                        height: height*0.45,
                        width: width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            // ignore: prefer_const_literals_to_create_immutables
                            stops: [0.3,0.9],
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
               
               
              Center(child: Text(appName,style: TextStyle(
                    fontSize: 24,fontWeight: FontWeight.w900
                  ),
                  ),
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
                padding: const EdgeInsets.only(left:10.0, top:30),
                child: Container(child: Text("  $loginString  ",
                   style: TextStyle(fontWeight:FontWeight.bold,fontSize:26),),
                decoration: BoxDecoration(
                 gradient: LinearGradient(
                              colors: [primarycolor.withOpacity(0.6),primarycolor.withOpacity(0.2)
                            ],),
                            border: Border(left: BorderSide(color:primarycolor,width: 5))
                ),
              
                 ),
              ), 
              
              Padding(
                padding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),
                child: TextFormField(
                  onSaved: (value) {
                    _email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (email){
                    if (email!.isEmpty) {
                      return "Please Enter Email Id";
                    } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                      return "Its not a valid Email-Id";
                    }
                    return null;
                    },
                
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide:(BorderSide(color:primarycolor))),
                    prefixIcon: Icon(Icons.email, color:primarycolor),
                  labelText: "EMail Id",labelStyle: TextStyle(color: primarycolor,fontSize: 18),
                  
                 
                 ),
                ),
              ),
               
              
              Padding(
                padding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),
                child: TextFormField(
                  onSaved: (value){
                    _password = value!;
                  },
                  validator: (password){
                    if(password!.isEmpty){
                      return "Please Enter Password";
                    }
                    else if(password.length<6 || password.length>15){
                      return "Password is Incorrect";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide:(BorderSide(color:primarycolor))),
                    prefixIcon: Icon(Icons.lock_open, color:primarycolor),
                  labelText: "Password",labelStyle: TextStyle(color: primarycolor,fontSize: 18),
                 
                 ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Align(
                  alignment: Alignment.centerRight,
                child: FlatButton(onPressed: (){}, child:Text(forpswd,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Center(
                      child: SizedBox(
                        height: height*0.08,
                        width: width -270,
                        child: FlatButton(color: primarycolor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
                        
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if(formkey.currentState!.validate()){
                            formkey.currentState!.save();
                            signin(context);
                            // if(_email == "vm@gmail.com" && _password == "abcd1234") {
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferalPage(),
                            //   ),
                            //   );
                            // }else{
                              
                              
                            //   print("Invalid LoginId or Password");
                            // }
                          }
                        },child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                        
                    ),
                    
                    
                ),
              )),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
              FlatButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()),);}, child: Text("Sign-Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: primarycolor),))]

      
              ),
             

              
              ] ),
            ),
                  ),
          ) );
      
  
}

}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
