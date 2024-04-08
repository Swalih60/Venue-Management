// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;

  const RegisterScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText2 = true;
  bool obscureText = true;
  String currentRole = 'Student';
  String selectedItem = 'S1';
  String selectedItem1 = 'MECH';
  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SingleChildScrollView(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Image(
                image: AssetImage('assets/venue.jpg'),
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: currentRole,
                items: const [
                  DropdownMenuItem(value: 'Student', child: Text('Student')),
                  DropdownMenuItem(value: 'Faculty', child: Text('Faculty')),
                ],
                onChanged: (value) {
                  setState(() {
                    currentRole = value!;
                  });
                },
              ),
              Visibility(
                visible: currentRole == 'Student',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: selectedItem1,
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'CSE',
                          child: Text("CSE"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'EC',
                          child: Text("EC"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'CIVIL',
                          child: Text("CIVIL"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'MECH',
                          child: Text("MECH"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'EEE',
                          child: Text("EEE"),
                        ),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem1 = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: selectedItem,
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'S1',
                          child: Text("S1"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S2',
                          child: Text("S2"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S3',
                          child: Text("S3"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S4',
                          child: Text("S4"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S5',
                          child: Text("S5"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S6',
                          child: Text("S6"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S7',
                          child: Text("S7"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'S8',
                          child: Text("S8"),
                        ),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: userNameController,
                hintText: 'Username',
                obsecureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginTextfield(
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: obscureText ? Colors.grey : Colors.blue,
                          )),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscureText2,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText2 = !obscureText2;
                            });
                          },
                          icon: Icon(
                            obscureText2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: obscureText2 ? Colors.grey : Colors.blue,
                          )),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              button2(
                onTap: () async {
                  try {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                    if (passwordController.text == confirmController.text) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      String? uid = FirebaseAuth.instance.currentUser?.uid;
                      FirebaseFirestore.instance.collection('Users').add({
                        'username': userNameController.text,
                        'uid': uid,
                        'role': currentRole,
                        'sem': selectedItem,
                        'branch': selectedItem1,
                      });

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Registered successfully"),
                        backgroundColor: Colors.green,
                      ));
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Passwords don't match"),
                        backgroundColor: Colors.red,
                      ));
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.code),
                      backgroundColor: Colors.red,
                    ));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  }
                },
                text: 'Register',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
