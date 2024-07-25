import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('assets/images/rrrr.jpg'),
          ),
          const SizedBox(height: 20),
          itemProfile('Name', 'Anit Raj', CupertinoIcons.profile_circled),
          const SizedBox(height: 10),
          itemProfile('Phone', '798685269', CupertinoIcons.phone),
          const SizedBox(height: 10),
          itemProfile('Email', 'AstroBoy@gmail.com', CupertinoIcons.mail),
          const SizedBox(height: 10),
          itemProfile('Address', 'Mangalam,East Delhi, Delhi',
              CupertinoIcons.location_solid),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
              child: const Text('Submit')),
        ],
      ),
    ));
  }

  itemProfile(String title, String subTitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.blue.shade300.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5)
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(iconData),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.blue,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
