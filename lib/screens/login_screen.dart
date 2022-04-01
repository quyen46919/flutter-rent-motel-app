import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/user_model.dart';
import 'package:travel_hotel_app/provider/google_sign_in.provider.dart';
import 'package:travel_hotel_app/provider/user.dart';
import 'package:travel_hotel_app/widgets/show_dialog.dart';
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
  final Color _textcolor =  const Color.fromRGBO(68, 58, 79, 1);
  bool _showPass = true;
  var _iconshowpass = FontAwesomeIcons.eyeSlash;
  final TextEditingController _emailControl =  TextEditingController();
  final TextEditingController _passwordControl =  TextEditingController();
  late User returnData;

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

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        body: ListView(
          children: [
            Consumer<UserProvider>(
              builder: (context, userState, _) => Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    const Padding(
                      padding:  EdgeInsets.only(left: 20, top: 30, right: 30 ,bottom: 30),
                      child:  Text('Đăng nhập để tiếp tục',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 20),
                      child: TextFormField(
                        validator: (value){
                          if(value==null|| value.isEmpty) return 'vui lòng nhập email';
                          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.com+").hasMatch(value)) return 'định danh email chưa đúng';
                          return null;},
                        controller: _emailControl,
                        // onChanged: checkEmail,
                        obscureText: false,
                        cursorColor: Colors .grey,
                        style:  TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade700,
                            height: 1.5,
                            fontWeight: FontWeight.bold
                        ),

                        decoration:  InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue.shade900)
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214,1))
                          ),
                          isCollapsed: false,
                          hoverColor: Colors.transparent,
                          fillColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          // focusedBorder: Colors.blue.shade900,
                          filled: true,
                          // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Địa chỉ email",
                          labelStyle:  const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (value){
                              if(value==null|| value.isEmpty) return 'vui lòng nhập mật khẩu';
                              if(value.length <6 ) return 'mật khẩu của bạn phải lớn hơn 6 ký tự';
                              return null;},
                            controller: _passwordControl,
                            obscureText: _showPass,
                            cursorColor: Colors.grey,
                            style:  TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade700,
                                height: 1.5,
                                fontWeight: FontWeight.bold
                            ),
                            decoration:  InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade900)
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214,1))
                              ),

                              isCollapsed: false,
                              hoverColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              filled: true,
                              // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              labelText: "Mật khẩu",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
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
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                            child: const Text(
                              "Đăng nhập",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                getData(_emailControl.text, _passwordControl.text);
                              }
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  )
                              ),
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          }
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        "Hoặc đăng nhập với",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: _textcolor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          // Expanded(
                          //   flex: 5,
                          //   child:  Padding(
                          //   padding: const EdgeInsets.only(left: 10, right: 10),
                          //   child: TextButton(
                          //     onPressed: (){
                          //     },
                          //     child: Container(
                          //       height: 50,
                          //       // color: colorbox,
                          //       decoration:  BoxDecoration(
                          //           border: Border.all(
                          //               color: Colors.blue.shade900,
                          //               // style: BorderStyle.solid,
                          //               width: 0
                          //           ),
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(5)
                          //       ),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children:  <Widget>[
                          //           Padding(
                          //             padding:  const EdgeInsets.only(right: 10),
                          //             child: Center(
                          //               child:  Icon(
                          //                 FontAwesomeIcons.googlePlusG,
                          //                 color: Colors.blue.shade900,
                          //               ),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding:  const EdgeInsets.only(left: 5),
                          //             child: Center(
                          //               child: Text('Google',
                          //                 style:   TextStyle(
                          //                   fontSize: 19,
                          //                   fontWeight: FontWeight.w700,
                          //                   color: Colors.blue.shade900,
                          //                 ),),
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // ),

                          // Expanded(
                          //   flex: 5 , child: Padding(
                          //   padding: const EdgeInsets.only(right: 10, left: 10),
                          //   child: TextButton(
                          //     onPressed: () async{
                          //     },
                          //     child: Container(
                          //       height: 50,
                          //       // color: Colors.blue.shade900,
                          //       // color: colorbox,
                          //       decoration:  BoxDecoration(
                          //           border: Border.all(
                          //               color: Colors.blue.shade900,
                          //               width: 0
                          //           ),
                          //           color: Colors.blue.shade900,
                          //           borderRadius: BorderRadius.circular(5)
                          //       ),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children:  const<Widget>[
                          //           Padding(
                          //             padding:  EdgeInsets.only(right: 10),
                          //             child: Center(
                          //               child:  Icon(
                          //                 FontAwesomeIcons.facebookF,
                          //                 color: Color.fromRGBO(255, 255, 255, 1),
                          //               ),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding:  EdgeInsets.only(left: 5),
                          //             child: Center(
                          //               child: Text('Facebook',
                          //                 style:   TextStyle(
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.w600,
                          //                   color: Colors.white,
                          //                 ),),
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // ),
                          Expanded(
                            child: SizedBox(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton.icon(
                                icon: const Icon(FontAwesomeIcons.facebookF),
                                label: const Text("Facebook"),
                                onPressed: () async {
                                  final result = await FacebookAuth.i.login(
                                      permissions: ["public_profile", "email"]
                                  );
                                  if (result.status == LoginStatus.success){
                                    await FacebookAuth.i.getUserData(
                                        fields: "email, name"
                                    ).then((value) {
                                      returnData = User(id: value['id'], email: value['email'], fullName: value['name']);
                                      userState.login(returnData);
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
                                      const HomeScreenTabs()),(route) => false);
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.blue.shade900,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: SizedBox(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton.icon(
                                icon: Icon(
                                    FontAwesomeIcons.googlePlusG,
                                  color: Colors.blue.shade900,
                                ),
                                label: Text(
                                    "Google",
                                  style: TextStyle(
                                    color: Colors.blue.shade900
                                  ),
                                ),
                                onPressed: () async {
                                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                                  await provider.googleLogin().then((value) {
                                    returnData = User(id: value?.id, email: value?.email, fullName: value?.displayName);
                                    userState.login(returnData);
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
                                    const HomeScreenTabs()),(route) => false);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: Colors.white,
                                  side: BorderSide(width: 2.0, color: Colors.blue.shade900,)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    Icon(
                                      FontAwesomeIcons.caretRight,
                                      color:Colors.blue.shade900,
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
              ),
            )
          ],
        ),
      backgroundColor:  Colors.white,
    );
  }

}
String? validateEmail(String formText){
  if(formText.isEmpty) return 'field is requied';
  return null;
}
















