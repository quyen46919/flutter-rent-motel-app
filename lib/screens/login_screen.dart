import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/user_model.dart';
import 'package:travel_hotel_app/provider/user.dart';
import 'package:travel_hotel_app/widgets/background.dart';
import 'package:travel_hotel_app/widgets/show_dialog.dart';
import 'package:travel_hotel_app/widgets/social_icon.dart';
import 'package:travel_hotel_app/screens/signup_screen.dart';
import 'package:travel_hotel_app/screens/home_screen_tabs.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'forgot_password_screen.dart';


class LoginScreen extends StatefulWidget {
  // static const routeName = "LogInScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color _trueinputvalidcolor = const Color.fromRGBO(236, 215, 250, 1);
  final Color _falseinputvalidcolor = Colors.red.withOpacity(0.8);
  final Color _textcolor =  const Color.fromRGBO(68, 58, 79, 1);
  bool _showPass = true;
  Color _color =  const Color.fromRGBO(255, 0, 0, 0);
  var _iconshowpass = FontAwesomeIcons.eyeSlash;
  final TextEditingController _emailControl =  TextEditingController();
  final TextEditingController _passwordControl =  TextEditingController();
  var _emailcheckcolor = true;
  var _emailInvalid = true;
  var _passwordInvalid = true;
  IconData _icon = FontAwesomeIcons.checkCircle;

  getData(String email, String password) async {
    String response = await rootBundle.loadString('assets/fakeAuthJSONData.json');

    var tagObjsJson = jsonDecode(response)['result'] as List;
    List<User> listUsers = tagObjsJson.map((tagJson) => User.fromJson(tagJson)).toList();

    var foundUser = listUsers.where((user) => user.email == email);
    if (foundUser.isNotEmpty) {
      print("valid email");
      var validPasswordList = foundUser.where((user) => user.password == password);
      if (validPasswordList.isNotEmpty) {
        print("valid password");
        Provider.of<UserProvider>(context, listen: false).login(validPasswordList.first);
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const HomeScreenTabs()
          ),
        );
      } else {
        print("invalid password");
        showDialog(context: context, builder: (context) =>
          const ShowDiaLog(message: "Mật khẩu không chính xác!", icon: FontAwesomeIcons.times, navigateType: 'pop')
        );
      }
    } else {
      print("invalid email");
      showDialog(context: context, builder: (context) =>
        const ShowDiaLog(message: "Email không tồn tại!", icon: FontAwesomeIcons.times, navigateType: 'pop')
      );
    }
  }

  void onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;
      if(!_showPass){
        _iconshowpass = FontAwesomeIcons.eyeSlash;
      } else {
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
        _icon = FontAwesomeIcons.timesCircle;
        _emailcheckcolor = false;
      }
      else{
        _color = Colors.green;
        _icon = FontAwesomeIcons.checkCircle;
        _emailcheckcolor = true;
        _emailInvalid = true;
      }
    });
  }
  void btnClick() async {
    setState(() {
      if(_emailControl.text.length < 8 ){
        _emailInvalid = false;
      }
      else if (!_emailcheckcolor){
        _emailInvalid = false;
      }
      if(_passwordControl.text.length < 6){
        _passwordInvalid = false;
      }
      else{
        _passwordInvalid = true;
      }
    });
    if (_passwordInvalid == true && _emailInvalid == true) {
      getData(_emailControl.text, _passwordControl.text);
    }
  }

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
                      const SizedBox(height: 60.0),
                      Image.asset(
                        "assets/images/Logo_dong_a.png",
                        height: size.height * 0.12,
                      ),
                      const SizedBox(height: 30.0),
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
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold
                                ),
                                decoration: const InputDecoration(
                                  isCollapsed: false,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: "Địa chỉ email",
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
                                _icon,
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
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold
                                ),
                                decoration: const InputDecoration(
                                  // hintText: "PassWord",
                                  isCollapsed: false,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: "Mật khẩu",
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
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 40.0),
                        child: TextButton(
                          child:  Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                              fontSize: 17,
                              color: _textcolor,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          onPressed:() {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const ForgotPassword()),
                            );
                          },
                        ),
                      ),
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
                              "Đăng nhập",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: btnClick,
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 103, 221, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                    )
                                ),
                             )
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                       Text(
                        "Hoặc đăng nhập với",
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Container(
                          height: 50,
                          width: 10000,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  <Widget>[
                               Text(
                                 "Bạn chưa có tài khoản?",
                                style: TextStyle(
                                    color: _textcolor,
                                fontWeight: FontWeight.w600,
                                    fontSize: 17),
                               ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          settings: const RouteSettings(name: '/login'),
                                          builder: (context) => const SignUpScreen()
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children:  <Widget>[
                                      Text(
                                        "Đăng ký ngay",
                                        style: TextStyle(
                                            color: _textcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)
                                      ),
                                        const Icon(
                                            FontAwesomeIcons.caretRight,
                                            color:Colors.deepPurple
                                        ),
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
  }














