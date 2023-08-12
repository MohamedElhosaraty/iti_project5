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
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', emailcontroller.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('success')),
                    );
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            email: emailcontroller.text,)),);
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
}
