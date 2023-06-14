import 'package:e_commerce/business_logic/theming/cubit/theming_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _darkModeEnabled = isDarkMode;
    });
  }

  void _toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkModeEnabled = !_darkModeEnabled;
      prefs.setBool('isDarkMode', _darkModeEnabled);
    });
  }

  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    ThemingCubit themingCubit = BlocProvider.of<ThemingCubit>(context);
    final theme = _darkModeEnabled
        ? themingCubit.changeToDark()
        : themingCubit.changeToLight();
    ;
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
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.headline6,
              ),
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
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  _toggleTheme();
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Language',
                style: Theme.of(context).textTheme.headline6,
              ),
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
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.headline6,
                    ),
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
