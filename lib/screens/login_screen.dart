import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/background.dart';
import 'package:travel_hotel_app/widgets/btn_forgot_password.dart';
import 'package:travel_hotel_app/widgets/social_icon.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = "LogInScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color _trueinputvalidcolor =   const Color.fromRGBO(236, 215, 250, 1);
  final Color _falseinputvalidcolor =   Colors.red.withOpacity(0.8);
  final Color _textcolor =  const Color.fromRGBO(68, 58, 79, 1);
  bool _showPass = true;
  Color _color =  const Color.fromRGBO(255, 0, 0, 0);
  var _iconshowpass = FontAwesomeIcons.eyeSlash;
  final TextEditingController _emailControl =  TextEditingController();
  final TextEditingController _passwordControl =  TextEditingController();
  var _emailcheckcolor = true;
  var _emailInvalid = true;
  var _passwordInvalid = true;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.06),
                      Image.asset(
                        "assets/images/Logo_dong_a.png",
                        height: size.height * 0.12,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width:10000,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: _emailInvalid?_trueinputvalidcolor:_falseinputvalidcolor,
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                              child: TextFormField(
                                controller: _emailControl,
                                onChanged: checkEmail,
                                obscureText: false,
                                cursorColor: Colors.grey,
                                style: const TextStyle(fontSize: 17, color: Colors.black, height: 1.5, fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  isCollapsed: false,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: "Your Email",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Color.fromRGBO(239, 222, 252, 0),
                                  hoverColor: Color.fromRGBO(1, 1, 1, 0),
                                  border:
                                   InputBorder.none,
                                ),

                              ),
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                            child: GestureDetector(
                              child:  Icon(
                                FontAwesomeIcons.checkCircle,
                                color: _color,
                                size: 20,
                              ),
                            ),
                          ),
                      ]
                      ),
                      SizedBox(height: size.height * 0.045),
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width:10000,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: _passwordInvalid?_trueinputvalidcolor:_falseinputvalidcolor,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: const Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: _passwordControl,
                                obscureText: _showPass,
                                cursorColor: Colors.grey,
                                style: const TextStyle(fontSize: 17, color: Colors.black, height: 1.5, fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  // hintText: "PassWord",
                                  isCollapsed: false,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor: Color.fromRGBO(239, 222, 252, 0),
                                  hoverColor: Color.fromRGBO(1, 1, 1, 0),
                                  border:
                                  InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                           child: GestureDetector(
                             onTap: onToggleShowPass,
                             child:  Icon(
                              _iconshowpass,
                              color: Colors.grey,
                              size: 20,
                              ),
                           ),
                         ),

                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      const Btnforgotpassword(),
                      SizedBox(height: size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          height: 60,
                          width: 10000,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow( color: _trueinputvalidcolor,
                                  spreadRadius: 10,
                                  blurRadius: 20,
                                  offset: const Offset(5, 10),)
                              ]
                          ),
                          child: ElevatedButton(
                            child: const Text(
                              "Sign in",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: btnClick,
                            style:
                            ButtonStyle( foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 103, 221, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),

                                    )),

                             )
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                       Text(
                        "Or Sign Up With",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: _textcolor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SocalIcon(
                            icon: const Icon(
                              FontAwesomeIcons.googlePlusG,
                              color: Color.fromRGBO(217, 45, 14, 1),
                            ),
                            press: () {},
                            colorbox: const Color.fromRGBO(252, 223, 207, 0.7),
                          ),
                          SocalIcon(
                            icon: const Icon(
                              FontAwesomeIcons.facebookF,
                              color: Color.fromRGBO(7, 31, 219, 1),
                            ),
                            coloricon: const Color.fromRGBO(217, 45, 14, 1),
                            press: () {},
                            colorbox: const Color.fromRGBO(214, 221, 255, 0.7),
                          ),
                          SocalIcon(
                            icon: const Icon(
                              FontAwesomeIcons.twitter,
                              color: Color.fromRGBO(7, 137, 242, 1),
                            ),
                            press: () {},
                            colorbox: const Color.fromRGBO(215, 238, 250, 0.7),
                          ),

                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child:  Container(
                          height: 50,
                          width: 10000,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  <Widget>[
                               Text("Already Haven't Acount?",
                                style: TextStyle(color: _textcolor,
                                fontWeight: FontWeight.w600, fontSize: 17),),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/SignupScreen');
                                  },
                                  child: Row(
                                    children:  <Widget>[
                                      Text(
                                        "Sign Up",
                                        style: TextStyle(color: _textcolor,fontWeight: FontWeight.w600, fontSize: 17)),
                                        const Icon(FontAwesomeIcons.caretRight, color:Colors.deepPurple),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],

            )

        ),
      backgroundColor:  const Color(0xffFDF8FE),
    );
  }
  void onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;
      if(!_showPass){
        _iconshowpass = FontAwesomeIcons.eyeSlash;
      }else{
        _iconshowpass = FontAwesomeIcons.eye;
      }
    });
  }
  void checkEmail(value){
    setState(() {
      if(value==null) {
        _color = Colors.red;
      }if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
        _color = Colors.red;
        _emailcheckcolor = false;
      }
      else{
        _color = Colors.green;
        _emailcheckcolor = true;
        _emailInvalid = true;
      }
    });
  }
  void btnClick(){
    setState(() {
      if(_emailControl.text.length <8 ){
        _emailInvalid = false;
      }
      else if (!_emailcheckcolor){
        _emailInvalid = false;
      }
      if(_passwordControl.text.length <6){
      _passwordInvalid = false;
      }
      else{
        _passwordInvalid = true;
      }
    });
  }
  }














