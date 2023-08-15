import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/view/home_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final _forKey =GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _forKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,right: 100,left: 100,bottom: 50),
                  child: Image(
                      image: AssetImage('assets/logo.png')),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailcontroller,
                  validator:(value){
                    if (value ==null || value.contains('@') ==false){
                        return 'Enter valid email';
                    }
                  } ,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'Email',
                  border: OutlineInputBorder()),
               ),),
               SizedBox(
                 height: 30,
               ),
               Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value){
                    if(value == null || value.length <= 8){
                      return 'Enter vaild password';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(labelText: 'password',
                  border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(onPressed: ()  async {
                    if(_forKey.currentState!.validate()) {
                      bool result =await fireBaseLogin(emailcontroller.text, passwordcontroller.text);
                      if(result == true)  {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('email', emailcontroller.text);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              email: emailcontroller.text,)),);
                      }
                      // final SharedPreferences prefs = await SharedPreferences.getInstance();
                      // await prefs.setString('email', emailcontroller.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('success')),
                    );

                    }
                  },
                    child:Text('login',style: TextStyle(color: Colors.white),) ,),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Forgot password? No yawa. Top me',style: TextStyle(color: Colors.blueGrey),),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(onPressed: (){},
                    child:Text('No Account? Sign Up',style: TextStyle(),) ,),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Future<bool> fireBaseLogin(String email , String password) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password: password);
      UserCredential usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(usercredential.user != null ){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
