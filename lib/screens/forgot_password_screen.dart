import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/show_dialog.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController _emailControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50.0),
                  Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "Quên mật khẩu",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: "Abril Fatface",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                            child: IconButton(
                              hoverColor: Colors.white,
                              focusColor: const Color.fromRGBO(0, 0, 0, 0),
                              padding: const EdgeInsets.only(bottom: 0),
                              icon: const Icon(FontAwesomeIcons.arrowLeft),
                              iconSize: 25,
                              color: Colors.blue.shade900,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ]
                  ),

                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Hãy nhập địa chỉ email của bạn tại đây, chúng tôi sẽ cung cấp cho bạn phương thức để đổi mật khẩu mới",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:20, right: 20),
                          child: TextFormField(
                            validator: (value){
                              if(value==null|| value.isEmpty) return 'vui lòng nhập email';
                              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.com+").hasMatch(value)) return 'định danh email chưa đúng';
                              return null;},
                            controller: _emailControl,
                            obscureText: false,
                            cursorColor: Colors .grey,
                            style:  TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade700,
                                height: 1.5,
                                fontWeight: FontWeight.bold
                            ),

                            decoration:  InputDecoration(
                              hoverColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              isCollapsed: false,
                              filled: true,
                              // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              labelText: "Địa chỉ email",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade900)
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214,1))
                              // border:
                              // InputBorder.none,
                            ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          child: const Text(
                            "Xác thực",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              showDialog(context: context, builder: (context) =>
                              const ShowDiaLog(message: "Vui lòng kiểm tra email để đổi mật khẩu"));
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                )),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}














