// final currentUser = FirebaseAuth.instance.currentUser;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devathon_project/components/detail_tile.dart';
import 'package:devathon_project/screens/appointment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/category_container.dart';
import 'doctor_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Reference to the Firestore instance
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  String doctorCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB28CFF),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const DoctorSearch()));
        },
        child: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffB28cff),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: signOut, child: const Icon(Icons.logout)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Let's find\nyour top doctor!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Doctor's Inn",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryContainer(
                      categoryName: 'All',
                      image: 'assets/all.svg',
                      onTap: () {
                        setState(() {
                          doctorCategory = "All";
                        });
                        print(doctorCategory);
                      }),
                  CategoryContainer(
                      categoryName: 'Cardioligy',
                      image: 'assets/cardioligy.svg',
                      onTap: () {
                        setState(() {
                          doctorCategory = "Cardioligy";
                        });
                        print(doctorCategory);
                      }),
                  CategoryContainer(
                      categoryName: 'Medicine',
                      image: 'assets/medicine.svg',
                      onTap: () {
                        setState(() {
                          doctorCategory = "Medicine";
                        });
                      }),
                  CategoryContainer(
                      categoryName: 'General',
                      image: 'assets/general.svg',
                      onTap: () {
                        setState(() {
                          doctorCategory = "General";
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Catogries")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: doctorCategory == 'All'
                                ? snapshot.data?.docs.length
                                : snapshot.data?.docs
                                    .where((element) =>
                                        element["Type"] == doctorCategory)
                                    .length,
                            itemBuilder: ((context, index) {
                              final uMap = snapshot.data!.docs[index].data();
                              print("type: ${uMap['Type']}");
                              print("cat: $doctorCategory");
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AppointmentScreen(
                                                user: uMap,
                                              )));
                                },
                                child: DetailTile(
                                  user: uMap,
                                ),
                              );
                            }));
                      }
                      return const Center(
                        child: Text("No Items to display!"),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.purple,
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
