class UserModel{
  String? uid;
  String? username;
  String? email;
  // String? password;

UserModel({this.uid,this.email,this.username});

factory UserModel.formMap(map){
  return UserModel(
  uid: map['uid'],
  username: map['usernme'],
  email: map['email'],  
  );
}

Map<String,dynamic> toMap(){
  return{
    'uid': uid,
    'username': username,
    'email': email,
    
  };
}

}