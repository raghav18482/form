import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  get _changeText => null;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
         TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerLeft,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])
              ),
      child: Text(
        'Sumbit',
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         /* Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),*/
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _head() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
          text: 'B',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'roke',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextSpan(
              text: 'land',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }
  
  
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Phone no."),
        /*_entryField("Password", isPassword: true),*/
        _entryField("Address"),
        _entryField("Adhaar no."),
RaisedButton(child: Text("upload image +"),
                onPressed: _changeText,
                color: Colors.orange[300],
                textColor: Colors.black54,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.orange,
              ),
RaisedButton(child: Text("upload plot documents +"),
                onPressed: _changeText,
                color: Colors.orange[300],
                textColor: Colors.black54,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.orange,
              )
      ],
    );
  }
 String dropdownValue = 'agro';

 Widget _dropdownbutton(){
 return DropdownButton<String>(
    value: dropdownValue,
    icon: Icon(Icons.arrow_downward),
    iconSize:  15,
    elevation: 16,
    style: TextStyle(
      color: Colors.black
    ),
    underline: Container(
      height: 2,
      color: Colors.orangeAccent,
    ),
    onChanged: (String newValue) {
      setState(() {
        dropdownValue = newValue;
      });
    },
    items: <String>['agro', 'non-agro']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );

 }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          child:Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    _head(),
                    SizedBox(
                      height: 20,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 2,
                    ),
                     _dropdownbutton(),
                    SizedBox(
                      height: 2,
                    ),
                    _submitButton(),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: _loginAccountLabel(),
              // ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer())
            ],
          ),
        )
      )
    );
}
  }



