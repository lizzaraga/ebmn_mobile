import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF000000),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff1A1A2E),
          borderRadius: BorderRadius.circular(12)
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(child: LoginView()),
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppLogo(),
        SizedBox(height: 40,),
        LoginForm()
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/img/login_header_shape.svg'
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 30,
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/img/app_logo.svg',
                  height: 50,
                  width: 33,
                ),
                SizedBox(width: 16,),
                Text("e-Base Medical Network", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                  fontSize: 16
                ),)
              ],
            ),
          ), 
          Positioned(
            top: 75,
            left: 65,
            child: SvgPicture.asset(
              'assets/img/medicine_doctor_illustration.svg',
              height: 180,
              width: 253,
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        LoginInputWidget(
          icon: Icon(
            Icons.alternate_email,
            size: 18,
            color: Color(0xFFC2DEFF).withOpacity(0.6),
          ),
          textFormField: TextFormField(
            cursorColor: Color(0xFFC2DEFF),
            style: TextStyle(color: Color(0xFFC2DEFF)),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Your email",
              hintStyle: TextStyle(color: Color(0xFFC2DEFF).withOpacity(0.4)),
            ),
          )
        ),
        SizedBox(height: 10,),
        LoginInputWidget(
          icon: Icon(
            Icons.lock_outline,
            size: 18,
            color: Color(0xFFC2DEFF).withOpacity(0.6),
          ),
          textFormField: TextFormField(
            obscureText: true,
            cursorColor: Color(0xFFC2DEFF),
            style: TextStyle(color: Color(0xFFC2DEFF)),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Your password",
              hintStyle: TextStyle(color: Color(0xFFC2DEFF).withOpacity(0.4)),
            ),
          )
        ),
        SizedBox(height: 25,),
        Container(
          width: MediaQuery.of(context).size.width - 65,
          child: MaterialButton(
            onPressed: (){},
            height: 50,
            color: Color(0xFFE94560),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text("Sign In", style: TextStyle(color: Color(0xFF1A1A2E), fontSize: 16),),),
          ),
        ),
        SizedBox(height: 10,),
        FlatButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text("Forgot password ?", style: TextStyle(color:Color(0xFFC2DEFF).withOpacity(0.6)),)
        )
      ],
    );
  }
}

class LoginInputWidget extends StatelessWidget {
  final TextFormField textFormField;
  final Icon icon; 
  const LoginInputWidget({
    Key key, @required this.textFormField, @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width - 65,
      decoration: BoxDecoration(
        color: Color(0xFF333C56),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: icon,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: textFormField
          )
        ],
      ),
    );
  }
}