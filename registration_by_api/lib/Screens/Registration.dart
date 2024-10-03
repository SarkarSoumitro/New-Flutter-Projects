import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();

  registeruser(String email, String password) async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var data = {"email": email, "password": password};
    try {
      var response = await http.post(url, body: data);
      if (response.statusCode == 201) {
        var jsondata = jsonDecode(response.body);
        print(jsondata);
        print('registration is successful');
      } else {
        var error = jsonDecode(response.body);
        print('Unable to register: ${error}');
      }
    } catch (e) {
      print("Error:$e");
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Registration By Api",
          style: GoogleFonts.dmSerifDisplay(fontSize: 33),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            TextFormField(
                controller: Emailcontroller,
                decoration: InputDecoration(hintText: "Email")),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: Passwordcontroller,
                decoration: InputDecoration(hintText: "Password")),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              height: 50,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  registeruser(Emailcontroller.text.toString(),
                      Passwordcontroller.text.toString());
                },
                child: Center(
                    child: Text(
                  "Registration",
                  style: TextStyle(fontSize: 25),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
