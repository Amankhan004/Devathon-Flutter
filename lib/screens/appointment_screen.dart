import 'package:devathon_project/components/custom_container.dart';
import 'package:devathon_project/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/appointment_time.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key, required this.user});
  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Appointment",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.person,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user['Name']),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Speciality"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFB28CFF),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(),
                        CustomContainer(),
                        CustomContainer(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'About Doctor',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                          '${user['Name']} is the top most specialist in Nanyang Hospotalat London. Dr. is available for private consultation.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Schedules',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        Text('August'),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(),
                    CustomContainer(),
                    CustomContainer(),
                    CustomContainer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Visit Hour',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppointmentTime(
                      text: '11 pm',
                    ),
                    AppointmentTime(
                      text: '1 pm',
                    ),
                    AppointmentTime(
                      text: '8 pm',
                    ),
                    AppointmentTime(
                      text: '9 pm',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppointmentTime(
                      text: '10 pm',
                    ),
                    AppointmentTime(
                      text: '3 pm',
                    ),
                    AppointmentTime(
                      text: '5 pm',
                    ),
                    AppointmentTime(
                      text: '7 pm',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: MyButton(text: 'Book Appointmnet'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
