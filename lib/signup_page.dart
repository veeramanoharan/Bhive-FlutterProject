// ignore: file_names
// ignore: file_names
// ignore: file_names, avoid_web_libraries_in_flutter

// ignore_for_file: unused_import, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_element, prefer_equal_for_default_values, unrelated_type_equality_checks




import 'package:bhive_project/colors.dart';
import 'package:bhive_project/constats.dart';
import 'package:bhive_project/login_screen.dart';
import 'package:bhive_project/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key?key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

// ignore: camel_case_types
class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  final formkey = GlobalKey<FormState>();
  final userNameEditingController = TextEditingController();
  final emailNameEditingController = TextEditingController();
  final passwordNameEditingController = TextEditingController();

  var signUpButton;
           var alertDialog = AlertDialog(
              title: Text("   Your Account is Created "),
              content: Text("You may Login now using your login credentials"),
            );
        

  get value => null;

  // ignore: prefer_typing_uninitialized_variable

  @override
  Widget build(BuildContext context) {
    
    final userNamefield =   Padding(padding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),child: TextFormField(
        autofocus: false,
        controller: userNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regExp = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please enter your Username");
          }
          if (!regExp.hasMatch(value)) {
            return ("Enter Valid Username(Minimum Six Characters)");
          }
          return null;
        },
        onSaved: (newValue) {
          userNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person,color: primarycolor),
          contentPadding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),
          focusedBorder: UnderlineInputBorder(borderSide:(BorderSide(color:primarycolor))),
         labelText: "User Name",labelStyle: TextStyle(color: primarycolor,fontSize: 18)
        )),);

  

    final emailField = Padding(padding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),child: TextFormField(
        autofocus: false,
        controller: emailNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter a valid Email");
          }
          else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return "Its not a valid Email-Id";
          }
          return null;
        },
        onSaved: (value) {
          emailNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
         
          contentPadding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),
         focusedBorder: UnderlineInputBorder(borderSide:(BorderSide(color:primarycolor))),
        prefixIcon: Icon(Icons.email, color:primarycolor),
        labelText: "EMail Id",labelStyle: TextStyle(color: primarycolor,fontSize: 18),
        ),),);

    final passwordField = Padding(padding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),child: TextFormField(
        autofocus: false,
        controller: passwordNameEditingController,
        obscureText: true,
        validator: (value) {
          
          if (value!.isEmpty) {
            return ("Please enter your Password");
          }
          else if(passwordNameEditingController.text.length<6){
            return "Invalid Password";
          }
          return null;
        },
        onSaved: (value) {
          passwordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left:30.0, top:20,right: 30.0),
          focusedBorder: UnderlineInputBorder(borderSide:(BorderSide(color:primarycolor))),
          prefixIcon: Icon(Icons.lock_open, color:primarycolor),
          labelText: "Password",labelStyle: TextStyle(color: primarycolor,fontSize: 18),
         
        ),),);


    final signUpButton =Padding(padding: const EdgeInsets.only(left:30.0,bottom: 50,right: 30.0),child: Material(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
      color:primarycolor,
      child: MaterialButton(
          onPressed: () {
 
            signUp(emailNameEditingController.text,
                passwordNameEditingController.text);
             
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),);
                     showDialog(context: context, builder: (BuildContext context){
              return alertDialog;
            });
          
          },
          
          child:  Text(
            "Sign-Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          )
          ),
          
    ),
    );
    

    return Scaffold(
      
        backgroundColor: Colors.white,
        
        
         
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top:36.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        
                        child: Image.asset(
                          bgimage,
                          fit: BoxFit.cover,
                        )),
                    
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(appName,style: TextStyle(
                    fontSize: 24,fontWeight: FontWeight.w900
                    ),
                    ),
                    ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                      Text("BHIVE.fund is one of India's largest & fastest-growing"
                      "\n investment platforms",style: TextStyle(color: Colors.grey)
                      ),
                      ],
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(right:130,top:30),
                    child: Container(child: Text(" Create an Account ",
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize:26),),
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: [primarycolor.withOpacity(0.6),primarycolor.withOpacity(0.2)
                    ],),
                    border: Border(left: BorderSide(color:primarycolor,width: 10))
                    ),
                    ),
                    ), 
                    const SizedBox(height: 15),
                    userNamefield,
                   
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 10),
                    passwordField,
                   const SizedBox(height: 50),
                    signUpButton,
                  ],
                ),
              ),
            ),
            
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    
    if (formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
    
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: non_constant_identifier_names
    User? user = _auth.currentUser;

  UserModel usermodel = UserModel();

    var userModel;
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = userNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
       
        
        
}
}