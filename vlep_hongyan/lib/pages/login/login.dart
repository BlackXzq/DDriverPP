import 'package:flutter/material.dart';
import 'dart:async';

import '../../utils/utils.dart';
import '../../services/services.dart';

enum LoginType {
  password,
  messageCode
}

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      resizeToAvoidBottomPadding: false,
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {

  var _isLoading = false;
  var _loginType = LoginType.messageCode;

  final _formKey = GlobalKey<FormState>();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  var _userName = '';
  var _password = '';
  var _messageCode = '';
  var _messageId = '';

  var _codeSending = false;
  var _timeCount = 60;
  Timer _timer;

  @override
  void dispose() {

    stopTime();
    super.dispose();
  }

  void startTime() {
    if (_timer != null) {
      return;
    }
    _codeSending = true;
    _timer = new Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        _timeCount --;
      });
      if (_timeCount == 0) {
        stopTime();
      }
    });
  }

  void stopTime() {
    if (_timer != null) {
      _timer.cancel();
      setState(() {
        _timeCount = 60;
        _codeSending = false;
      });
      _timer = null;
    }
  }

  //发送验证码
  void _sendMessage() async {
    _formKey.currentState.save();
    if (_userName.length != 11) {
      VLEPToast.showToast(msg: '请输入正确的手机号');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    LoginRequest.sendMessage(
      phoneNum: _userName,
      onSucceed: (msgId) {
        startTime();
        setState(() {
          _messageId = msgId;
          _isLoading = false;
        });
      },
      onFailed: (notice) {
        setState(() {
          _isLoading = false;
        });
        VLEPToast.showToast(msg: notice.message, times: notice.times);
      }
    );
  }
  //登录 按键
  void _submitLogin() async {

    _formKey.currentState.save();

    if (_userName.length != 11) {
      VLEPToast.showToast(msg: '请输入正确的手机号');
      return;
    }

    if (_loginType == LoginType.messageCode) {
      if (_messageCode.isEmpty) {
        VLEPToast.showToast(msg: '请输入验证码');
        return;
      }
    } else {
      if (_password.isEmpty) {
        VLEPToast.showToast(msg: '请输入密码信息');
        return;
      }
    }

    _usernameFocus.unfocus();
    _passwordFocus.unfocus();

    setState(() {
      _isLoading = true;
    });

    //  验证码登录
    if (_loginType == LoginType.messageCode) {
      LoginRequest.messageCodeLogin(
        phoneNum: _userName,
        msgId: _messageId,
        msgCode: _messageCode,
        onSucceed: (user) {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context).pushReplacementNamed('/home');
        },
        onFailed: (notice) {
          setState(() {
            _isLoading = false;
          });
          VLEPToast.showToast(msg: notice.message, times: notice.times);
        }
      );
    } else { //密码登录
      if (_loginType == LoginType.messageCode) {
        LoginRequest.passWordLogin(
            phoneNum: _userName,
            password: _password,
            onSucceed: (user) {
              setState(() {
                _isLoading = false;
              });
              Navigator.of(context).pushReplacementNamed('/home');
            },
            onFailed: (notice) {
              setState(() {
                _isLoading = false;
              });
              VLEPToast.showToast(msg: notice.message, times: notice.times);
            }
        );
      }
    }
  }

  void _changeLoginType() {
    if (_loginType == LoginType.messageCode) {
      _loginType = LoginType.password;
    } else {
      _loginType = LoginType.messageCode;
    }

    setState(() {});
  }

  Widget _buildLogoWidget() {
    return Center(
      child: Container(
        child: Image.asset('assets/images/login/login_logo@2x.png'),
        width: 172,
        height: 119,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 40),

      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Image.asset(
                    'assets/images/login/login_phone@2x.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  hintText: '请输入手机号',
                  hintStyle: TextStyle(color: VLEPTheme.whiteNormal),
                ),
                style: TextStyle(
                  color: VLEPTheme.whiteLight
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _userName = value,
                focusNode: _usernameFocus,
                textInputAction: TextInputAction.next,
                onEditingComplete: (){
                  _usernameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
            ),
            Container(
              height: 1,
              color: VLEPTheme.whiteLight,
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Image.asset(
                          'assets/images/login/login_verif@2x.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                        hintText: (_loginType == LoginType.messageCode) ? '请输入验证码' : '请输入密码',
                        hintStyle: TextStyle(color: VLEPTheme.whiteNormal),
                      ),
                      style: TextStyle(
                          color: VLEPTheme.whiteLight
                      ),
                      onSaved: (value) {
                        (_loginType == LoginType.messageCode) ? (_messageCode = value) : (_password = value);
                      },
                      obscureText: _loginType == LoginType.password,
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: _submitLogin,
                    ),
                  ),
                  Visibility(
                    visible: _loginType == LoginType.messageCode,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 1,
                          height: 30,
                          color: VLEPTheme.whiteNormal,
                        ),
                        FlatButton(
                          onPressed: _codeSending ? null : _sendMessage,
                          textColor: VLEPTheme.whiteLight,
                          child: Text(_codeSending ? '$_timeCount' : '发送验证码'),
                          disabledTextColor: VLEPTheme.whiteNormal,
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            Container(
              height: 1,
              color: VLEPTheme.whiteLight,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              width: MediaQuery.of(context).size.width - 60,
              child: FlatButton(
                onPressed: _submitLogin,
                child: Text('登 录', style: TextStyle(fontSize: VLEPTheme.fontSizeLarge)),
                textColor: VLEPTheme.primaryColor,
                color: VLEPTheme.whiteLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: GestureDetector(
        onTap: Feedback.wrapForTap(_changeLoginType, context),
        child: Container(
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: VLEPTheme.whiteLight,
                    letterSpacing: 0.5,
                    fontSize: VLEPTheme.fontSizeNormal
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '或者'
                  ),
                  TextSpan(
                      text: _loginType == LoginType.messageCode ? '密码登录' : '验证码登录',
                      style: TextStyle(
                          decoration: TextDecoration.underline
                      )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContetWidget() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/login/bg@2x.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLogoWidget(),
            _buildLoginForm(),
            _buildBottomWidget()
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildContetWidget(),
        Visibility(
          visible: _isLoading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
