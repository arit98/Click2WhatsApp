import 'package:click2whatsapp/Function.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ForgetPasswordPage(),
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  // bool _isLoading = false;
  final _loginFormKey = new GlobalKey<FormState>();
  final _loginScaffoldKey = new GlobalKey<ScaffoldState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _loginScaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 44, 112, 1),
       
        title: Container(
          // margin: EdgeInsets.only(left: 73),
          // height: 70.0,
          // width: 70.0,
         child: Text("Click 2 Whatsapp"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Without Saving Number Send Whatsapp Messages",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(39, 44, 112, 1),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              height: 100.0,
              width: 400.0,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _loginFormKey,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                onSaved: (val) => _email = val,
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  return val.length < 1 ? "Required" : null;
                                },
                                decoration: InputDecoration(
                                    labelText:
                                        "Please enter Whatsapp number ")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: 280.0,
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                    child: Text(
                      "Go To Whatsapp",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(39, 44, 112, 1),
                    onPressed: () {
                      final loginForm = _loginFormKey.currentState;

                      if (loginForm.validate()) {
                        // setState(() => _isLoading = false);
                        loginForm.save();
                        FlutterOpenWhatsapp.sendSingleMessage(
                            "91""$_email", "");
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (BuildContext context) => ApplyOtppage()));
                      } else {
                        print("error");
                      }
                      //  Navigator.of(context).pushReplacementNamed("/home");
                    })),
          ],
        ),
      ),
    );
  }
}
