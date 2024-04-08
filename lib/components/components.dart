// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class elevatedButton extends StatelessWidget {
  final String text;

  final Function()? onPressed;
  const elevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 180,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}

// ignore: camel_case_types
class textfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const textfield({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            labelText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          )),
    );
  }
}

// ignore: camel_case_types
class elevatedButton1 extends StatelessWidget {
  final String data;
  final String text;
  final IconData icon;
  final Function()? onPressed;
  const elevatedButton1({
    Key? key,
    required this.data,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(data),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(icon),
                ],
              ),
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
class listile extends StatelessWidget {
  final String? uid;
  final String? currentUid;
  final String docId;
  final String date;
  final String name;
  final String event;
  final String branch;
  final String sem;
  final String sTime;
  final String eTime;

  const listile({
    Key? key,
    required this.uid,
    required this.currentUid,
    required this.docId,
    required this.date,
    required this.name,
    required this.event,
    required this.branch,
    required this.sem,
    required this.sTime,
    required this.eTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: const EdgeInsets.all(8.0),
      child: Container(
          color: const Color.fromARGB(255, 114, 189, 250),
          child: ListTile(
              title: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    event,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name),
                  Text(sem),
                  Text(branch),
                ],
              ),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Visibility(
                    visible: uid == currentUid,
                    child: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('einstein')
                              .doc(docId)
                              .delete();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 248, 94, 83),
                        )),
                  )),
                ],
              ),
              trailing: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "From : $sTime",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "To : $eTime",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ))),
    );
  }
}

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;

  const LoginTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            )),
      ),
    );
  }
}

// ignore: camel_case_types
class button2 extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const button2({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
