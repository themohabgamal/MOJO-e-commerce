import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();

  static fillUserName(String username) {
    FirebaseAuth.instance.currentUser!.updateDisplayName("${username}");
  }
}

class _UserScreenState extends State<UserScreen> {
  bool _receiveNotifications = true;
  bool _enableDarkMode = false;
  String _selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SwitchListTile(
                title: Text('Receive notifications'),
                value: _receiveNotifications,
                onChanged: (value) {
                  setState(() {
                    _receiveNotifications = value;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Appearance',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SwitchListTile(
                title: Text('Enable dark mode'),
                value: _enableDarkMode,
                onChanged: (value) {
                  setState(() {
                    _enableDarkMode = value;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>['English', 'Spanish', 'French', 'German']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Center(
    //           child: Text("${user!.displayName}"),
    //         ),
    //         Center(
    //           child: ElevatedButton(
    //               onPressed: () {
    //                 logOut();
    //               },
    //               child: Text("Log out")),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
