import 'package:flutter/material.dart';
import 'package:sing_in_ui/screen_design2.dart';


class ScreenDesign extends StatefulWidget {
  const ScreenDesign({super.key});

  @override
  State<ScreenDesign> createState() => _ScreenDesignState();
}

class _ScreenDesignState extends State<ScreenDesign> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isObsecure = false;
  final GlobalKey<FormState> _formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/15/01/28/background-723053_1280.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white60,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Welcome\n    Back',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              height: 500,
              child: Form(
                key: _formKey,

                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value){
                        if(value!.isEmpty){
                          return"Email can't be empty";
                        }
                        if(value.length <3){
                          return "Invalid Email";
                        }
                        if(!value.contains("@")){
                          return "Invalid user email";

                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          hintText: "Enter Your Email",
                          labelText: "Enter Your Email",
                          //hintStyle: TextStyle(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onEditingComplete: () {
                        if(_formKey.currentState!.validate()){
                          // ignore: avoid_print
                          print("Successful");
                        } 
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return"Password can't be empty";
                        }
                        if(value.length <3){
                          return "Invalid Password";
                        }
                        if(value.length >10){
                          return "Invalid Password";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: isObsecure,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            icon: const Icon(Icons.visibility),
                          ),
                          fillColor: Colors.blue.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                          hintText: "Enter Your Password",
                          labelText: "Enter Your Password",
                          //hintStyle: TextStyle(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      color: Colors.blue.withOpacity(0.4),
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                          ),
                          

                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenDesign2(
                          email: emailController.text.toString(),
                          password: passwordController.toString(),
                         )));
                        }
                        else{


                        }
                      },
                      child: const Text('sing in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    RichText(
                        text: const TextSpan(
                            text: "Don't have an account",
                            style: TextStyle(fontSize: 15, color: Colors.black54),
                            children: [
                          TextSpan(
                              text: " Sing Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 16))
                        ])),
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
