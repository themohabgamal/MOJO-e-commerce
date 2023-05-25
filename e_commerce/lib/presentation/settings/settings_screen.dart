import 'package:e_commerce/business_logic/theming/cubit/theming_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    ThemingCubit themingCubit = BlocProvider.of<ThemingCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  _darkModeEnabled = value;
                  setState(() {
                    value == true
                        ? themingCubit.changeToDark()
                        : themingCubit.changeToLight();
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Language'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                items: <String>[
                  'English',
                  'Spanish',
                  'French',
                  'German',
                  'Italian'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
