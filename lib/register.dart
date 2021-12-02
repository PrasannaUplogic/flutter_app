import 'dart:convert';
import 'dart:io';
// import 'dart:html';
// import 'dart:html' as Io;
import 'dart:io' as Io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/colors.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';
import 'LoginScreen.dart';
import "package:image_picker/image_picker.dart";
import 'package:file_picker/file_picker.dart';

enum ImageSourceType { gallery, camera }

class RegisterScreen extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = "";

  bool email_valid = false;

  String _password = "";

  bool password_valid = false;

  String _userName = "";

  bool username_valid = false;

  String _phone = "";

  bool phone_valid = false;

  String _image64 = "";
  String _file64 = "";

  var _image;
  var imagePicker;
  var _filePath;
  var selected_file;
  var _image_name;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
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
                      "$REGISTER",
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
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: primaryColor,
                        ),
                        labelText: User_Name,
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
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                      _password = text;
                      on_validate_password();
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return (Enter_Password);
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    obscureText: true,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primaryColor,
                        ),
                        labelText: PASSWORD,
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 15)),
                  ),
                  if (password_valid == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Password",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 55,
                    width: screen_width * 0.4,
                    child: FlatButton(
                      onPressed: () async {
                        print("hi");

                        // var source = type == ImageSourceType.camera
                        //     ? ImageSource.camera --> for take photo
                        //     : ImageSource.gallery; --> for fetch photo from local
                        var source = ImageSource.gallery;
                        XFile image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);

                        final bytes = Io.File(image.path).readAsBytesSync();
                        // String img64 = base64Encode(bytes);

                        print("image -->$image");

                        setState(() {
                          _image = File(image.path);
                          _image_name = File(image.name);
                          _image64 = base64Encode(bytes);
                        });
                        print("img64 --> $_image64");
                      },
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          // Text("data"),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50 / 2),
                            child: _image != null
                                ? Image.file(
                                    _image,
                                    width: 50,
                                    height: 50,
                                    // fit: BoxFit.fitHeight,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    Food_bg,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Photo",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // //for single file
                      // FilePickerResult? result =
                      //     await FilePicker.platform.pickFiles();
                      // if (result != null) {
                      //   File file = File(result.files.single.path!); // it will give file path only
                      //   print("file --> $file");
                      //   setState(() {
                      //     selected_file = file;
                      //   });
                      // } else {
                      //   // User canceled the picker
                      // }

                      // // for multifile selected
                      //   FilePickerResult? result = await FilePicker.platform
                      //       .pickFiles(allowMultiple: true);
                      //     if (result != null) {
                      //       List<File> files = result.paths.map((path) => File(path!)).toList();

                      //       print("files --> $files");
                      //     }else{

                      //     }

                      // prefered files
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType
                            .custom, // file type - video and audio also avilable,
                        allowedExtensions: ['jpg', 'pdf'],
                      );
                      if (result != null) {
                        PlatformFile file1 =
                            result.files.first; // it will give details of file
                        File file = File(result.files.single.path!);
                        final bytes = Io.File(file.path).readAsBytesSync();
                        setState(() {
                          selected_file = file1.name;
                          _file64 = base64Encode(bytes);
                        });

                        print("file64 --> $_file64");

                        print("prefferd file---> ${file1}");
                      }

                      // print("bytes $bytes");
                    },
                    child: Container(
                      width: screen_width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor),
                      child: Row(
                        children: [
                          // Text("data"),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            child: Image.asset(
                              Food_bg,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Docs",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text("selected image : $_image_name"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text("Selected file : $selected_file"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
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

                      if (_password != "" &&
                          _email != "" &&
                          _userName != "" &&
                          _phone != "") {
                        on_register();
                      } else {
                        on_validate_all();
                      }
                    },
                    child: Text(
                      CLICKTORegister,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(HaveAccount),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        Hit_Login,
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
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
      password_valid = _password == "" ? true : false;
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

  on_register() {
    var details = {
      "email": _email,
      "password": _password,
      "name": _userName,
      "phone": _phone,
      "profileImg64":_image64,
      "doc64":_file64
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
    on_register_API(details);
  }

  Future<dynamic> on_register_API(details) async {
    print("details ${details}");
    final uri = Uri.parse(Register_API);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = details;
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    final response = await http.post(
      Uri.parse(Register_API),
      // headers: headers,
      body: body,
      // encoding: encoding,
    );

    int statusCode = response.statusCode;
    Map<String, dynamic> responseBody = json.decode(response.body);
    print("responseBody $statusCode, $responseBody");
    print(responseBody);
    if (responseBody['message'] == "Registered successfully") {
      print(responseBody['message']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
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
