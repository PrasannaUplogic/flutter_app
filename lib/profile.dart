import 'dart:convert';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/dashboard.dart';
import "colors.dart";
import 'constant.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
// import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String _email = "";

  bool email_valid = false;

  String _password = "";

  bool password_valid = false;

  String _userName = "";

  bool username_valid = false;

  String _phone = "";

  bool phone_valid = false;

  
  @override
  void initState() {
    getProfile_API();

    super.initState();
    // getProfile_API();
  }

  Future<dynamic> getProfile_API() async {
    Map<String, dynamic> body = {"email": storage.getItem('emailAddress')};
    final response = await http.post(
      Uri.parse(ViewProfile_API),
      body: body,
    );

    int statusCode = response.statusCode;
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    print("Mapped responseBody --> $statusCode, $responseBody");
    // print(jsonEncode(responseBody));
    if (responseBody['message'] == "success") {
      print(responseBody['message']);
      print(responseBody['response']['name']);

      setState(() {
        _userName = responseBody['response']['name'];
        _phone = responseBody['response']['phone'];
        _email = responseBody['response']['email'];
      });
    } else {
      print(responseBody['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: Text("Register page")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  Food_bg,
                  width: screen_width,
                  height: screen_height * 0.30,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: screen_height * 0.302,
                  width: screen_width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    app_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            ),
            Center(
                child: Text(
              slogan,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30 / 4),
                    child: Text(
                      "$PROFILE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: screen_width * 0.20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          // begin: Alignment.centerLeft,
                          // end: Alignment.centerRight,
                          colors: [
                            primaryColor.withOpacity(0.3),
                            primaryColor.withOpacity(0.0)
                          ],
                        ),
                        border: Border(
                            left: BorderSide(color: primaryColor, width: 4))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                      _userName = text;
                      on_validate_username();
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return (Enter_User_name);
                    //   } else {
                    //     return null;
                    //   }
                    // },

                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                        labelText: User_Name,
                        hintText: _userName,
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 15)),
                  ),
                  if (username_valid == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter User name*",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )

                  // Conditional.single(

                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                      _phone = text;
                      on_validate_phone();
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return (Enter_User_name);
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primaryColor,
                        ),
                        labelText: "Phone",
                        hintText: _phone,
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 15)),
                  ),
                  if (phone_valid == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Phone number*",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )

                  // Conditional.single(

                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                      _email = text;
                      on_validate_email();
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     print(RegExp(
                    //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //         .hasMatch(value));
                    //     return ("Enter Email Address");
                    //   } else if (RegExp(
                    //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //           .hasMatch(value) ==
                    //       false) {
                    //     return (Enter_valid_Email);
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: _email,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        labelText: EMAIL,
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 15)),
                  ),
                  if (email_valid == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter email address",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                children: [
                  // Text("data"),
                   Image.asset(
                    Food_bg,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: screen_width * 0.7,
                  child: FlatButton(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    onPressed: () {
                      // if (formkey.currentState!.validate()) {

                      if (_phone != "" && _email != "" && _userName != "") {
                        on_prifileUpdate();
                      } else {
                        on_validate_all();
                      }
                    },
                    child: Text(
                      CLICKTOUpdate,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  },
                  child: Text(
                    Hit_Dashbord,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  on_validate_all() {
    setState(() {
      username_valid = _userName == "" ? true : false;
      email_valid = _email == "" ? true : false;
      // password_valid = _password == "" ? true : false;
      phone_valid = _phone == "" ? true : false;
    });
  }

  on_validate_username() {
    setState(() {
      username_valid = _userName != "" ? false : true;
    });
  }

  on_validate_email() {
    setState(() {
      email_valid = _email != "" ? false : true;
    });
  }

  on_validate_password() {
    setState(() {
      password_valid = _password != "" ? false : true;
    });
  }

  on_validate_phone() {
    setState(() {
      phone_valid = _phone != "" ? false : true;
    });
  }

  on_prifileUpdate() {
    var details = {
      "email": _email,
      "password": _password,
      "name": _userName,
      "phone": _phone
    };
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) =>  HomeScreen(
    //       email: _email,
    //       password: _password,
    //       details: details),
    // ));
    // }
    // print(details);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ),
    // );
    on_prifileUpdate_API(details);
  }

  Future<dynamic> on_prifileUpdate_API(details) async {
    print("details ${details}");
    final uri = Uri.parse(Register_API);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = details;
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await http.post(
      Uri.parse(UpdateProfile_API),
      // headers: headers,
      body: body,
      // encoding: encoding,
    );

    int statusCode = response.statusCode;
    Map<String, dynamic> responseBody = json.decode(response.body);
    print("responseBody $statusCode, $responseBody");
    print(responseBody);
    if (responseBody['message'] == "updated successfully") {
      print(responseBody['message']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    } else {
      print(responseBody['message']);
    }
    // var response = await http.get(Uri.encodeFull(Register_API),
    //     headers: {"Accept": "application/json"});
    // // Map data={};

    // print("response-->  ${response}");
    // List<dynamic> data = [];
    // setState(() {
    //   data = json.decode(response.body);
    // });
    // print(data[3]);
    // return "Success";
  }
}
