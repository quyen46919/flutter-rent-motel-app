import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/show_dialog.dart';
import 'package:travel_hotel_app/widgets/background.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  Color _color = const Color.fromRGBO(255, 0, 0, 0);
  final TextEditingController _emailControl = TextEditingController();
  var _emailcheckcolor = true;
  var _emailInvalid = true;
  final Color _trueinputvalidcolor = const Color.fromRGBO(236, 215, 250, 1);
  final Color _falseinputvalidcolor = Colors.red.withOpacity(0.8);
  IconData _icon = FontAwesomeIcons.checkCircle;

  void checkEmail(value) {
    setState(() {
      if (value == null) {
        _color = Colors.red;
      }
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        _icon = FontAwesomeIcons.timesCircle;
        _color = Colors.red;
        _emailcheckcolor = false;
      }
      else {
        _icon = FontAwesomeIcons.checkCircle;
        _color = Colors.green;
        _emailcheckcolor = true;
        _emailInvalid = true;
      }
    });
  }

  void btnClick() {
    setState(() {
      if (_emailControl.text.length < 8) {
        _emailInvalid = false;
      }
      else if (!_emailcheckcolor) {
        _emailInvalid = false;
      }
      else {
        showDialog(context: context, builder: (context) =>
          const ShowDiaLog(message: "Vui lòng kiểm tra email để đổi mật khẩu")
        );
      }
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.06),
                  Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
                          child: Container(
                            width: 1000,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "Quên mật khẩu",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(128, 103, 221, 1),
                                  fontFamily: "Abril Fatface",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: _trueinputvalidcolor,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),)
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(1, 0, 0, 10),
                              child: IconButton(
                                padding: const EdgeInsets.only(bottom: 0),
                                icon: const Icon(FontAwesomeIcons.angleLeft),
                                iconSize: 25,
                                color: const Color.fromRGBO(199, 161, 230, 1),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                  SizedBox(height: size.height * 0.03),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Hãy nhập địa chỉ email của bạn tại đây, chúng tôi sẽ cung cấp cho bạn phương thức để đổi mật khẩu mới",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(68, 58, 79, 1)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: 10000,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [
                                  BoxShadow(color: _emailInvalid
                                      ? _trueinputvalidcolor
                                      : _falseinputvalidcolor,
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: const Offset(0, 2),)
                                ]
                            ),
                            child: TextFormField(
                              controller: _emailControl,
                              onChanged: checkEmail,
                              obscureText: false,
                              cursorColor: Colors.grey,
                              style: const TextStyle(fontSize: 17, color: Colors
                                  .black, height: 1.5, fontWeight: FontWeight
                                  .bold),
                              decoration: const InputDecoration(
                                isCollapsed: false,
                                filled: true,
                                // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: "Nhập địa chỉ email",
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
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 40.0, 0),
                          child: GestureDetector(
                            child: Icon(
                              _icon,
                              color: _color,
                              size: 20,
                            ),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: 60,
                      width: 10000,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: _trueinputvalidcolor,
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: const Offset(5, 10),)
                          ]
                      ),
                      child: ElevatedButton(
                          child: const Text(
                            "Xác thực",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: btnClick,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(128, 103, 221, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                )),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],

          )

      ),
      backgroundColor: const Color(0xffFDF8FE),
    );
  }
}














