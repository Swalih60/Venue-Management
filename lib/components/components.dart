// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: camel_case_types
class elevatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed;
  const elevatedButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 180,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
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
  final String date;
  final String name;
  final String event;
  final String branch;
  final String sem;
  final String sTime;
  final String eTime;

  const listile({
    Key? key,
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          leading: Text(date),
          title: Column(
            children: [
              Text(
                'Name: $name',
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Event: $event',
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                branch,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                sem,
              ),
            ],
          ),
          trailing: Column(
            children: [
              Text(
                "From :",
                style: TextStyle(fontSize: 12),
              ),
              Text(sTime),
              Text(
                "To :",
                style: TextStyle(fontSize: 12),
              ),
              Text(eTime),
            ],
          ),
        ),
      ),
    );
  }
}
