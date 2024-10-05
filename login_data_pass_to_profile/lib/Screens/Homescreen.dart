import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_data_pass_to_profile/API%20service/APIservices.dart';
import 'package:login_data_pass_to_profile/API%20service/model.dart';
import 'package:login_data_pass_to_profile/Screens/UpdateDisplay.dart';

class UpdateOperation extends StatefulWidget {
  const UpdateOperation({super.key});

  @override
  State<UpdateOperation> createState() => _UpdateOperationState();
}

class _UpdateOperationState extends State<UpdateOperation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  UpdateModel updatedata = UpdateModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Update Operation BY API",
          style: GoogleFonts.dmSerifDisplay(
              fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: jobController,
              decoration: InputDecoration(hintText: "Job"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[300]),
                onPressed: () {
                  MyAPIservices()
                      .Updatedata(nameController.text.toString(),
                          jobController.text.toString())
                      .then((value) {
                    setState(() {
                      updatedata = value!;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Updatedisplay(
                                    updateModel: updatedata,
                                    name: updatedata.name.toString(),
                                    job: updatedata.job.toString(),
                                    updatedAT: updatedata.updatedAt.toString(),
                                  )));
                    });
                  });
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
