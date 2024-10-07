import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_data_pass_to_profile/API%20service/model.dart';

class Updatedisplay extends StatelessWidget {
  final String? name, job, updatedAT;
  final UpdateModel updateModel;
  const Updatedisplay(
      {super.key,
      required this.updateModel,
      this.name,
      this.job,
      this.updatedAT});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Display center",
          style: GoogleFonts.dmSerifDisplay(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NAME: ${name}"),
            Text("JOB : ${job}"),
            Text("TIME: ${updatedAT}"),
            Text("TIME: ${updatedAT}"),
          ],
        ),
      ),
    );
  }
}
