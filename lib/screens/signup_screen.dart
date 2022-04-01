import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/widgets/show_dialog.dart';


class SignUpScreen extends StatefulWidget {
  static const routeName = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() =>  _SignUpScreenState();
}

class  _SignUpScreenState extends State<SignUpScreen> {

  final Color _textcolor =  const Color.fromRGBO(68, 58, 79, 1);
  bool _showPass = true;
  var _iconshowpass = FontAwesomeIcons.eyeSlash;
  final TextEditingController _emailControl =  TextEditingController();
  final TextEditingController _passwordControl =  TextEditingController();
  final TextEditingController _nameControl =  TextEditingController();


  void onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;
      if(!_showPass){
        _iconshowpass = FontAwesomeIcons.eye;
      }else{
        _iconshowpass = FontAwesomeIcons.eyeSlash;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 60.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:   <Widget>[
                              Row(
                                children: [
                                  IconButton(
                                    hoverColor: Colors.white,
                                    focusColor: const Color.fromRGBO(0, 0, 0, 0),
                                    icon: const Icon(FontAwesomeIcons.arrowLeft),
                                    iconSize: 25,
                                    color: Colors.blue.shade900,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                   const Expanded(
                                     child: Center(
                                       child: Text(
                                         "Tạo tài khoản mới",
                                         style: TextStyle(
                                           fontSize: 25,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.black,
                                         ),
                                       ),
                                     ),
                                   ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  "Nhập email của bạn để nhận mã xác thực và tạo mới tài khoản",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: _textcolor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width:double.infinity,
                            height: 60,
                            child: TextFormField(
                              validator: (value){
                                if(value==null|| value.isEmpty) return 'vui lòng nhập tên của bạn';
                                return null;},
                              controller: _nameControl,
                              obscureText: false,
                              cursorColor: Colors.grey,
                              style:  TextStyle(fontSize: 17, color: Colors.grey.shade700, height: 1.5, fontWeight: FontWeight.bold),
                              decoration:  InputDecoration(
                                hoverColor: Colors.transparent,
                                fillColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                isCollapsed: false,
                                filled: true,
                                // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: "Tên của bạn",
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
                        ),
                        const SizedBox(height: 10.0),
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
                              // border:
                              // InputBorder.none,
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
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  // hintText: "PassWord",
                                  isCollapsed: false,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  labelText: "Mật khẩu",
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
                            width:double.infinity,
                            child: ElevatedButton(
                                child: const Text(
                                  "Đăng ký",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    showDialog(context: context, builder: (context) =>
                                    const ShowDiaLog(message: "Đăng ký thành công", icon: FontAwesomeIcons.check,)
                                    );
                                  }
                                },
                                style:
                                ButtonStyle( foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      )),
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 80.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 50,
                            width:double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                Text(
                                  "Bạn đã có tài khoản?",
                                  style: TextStyle(
                                      color: _textcolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children:  <Widget>[
                                        Text(
                                            "Đăng nhập ngay",
                                            style: TextStyle(
                                                color: _textcolor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17
                                            )
                                        ),
                                        Icon(
                                          FontAwesomeIcons.caretRight,
                                          color: Colors.blue.shade900,
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
                ),
              )
            ],
          ),
        )
    );
  }
}













