import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/models/user_data.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'].toList();


  //  Form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).useData,
      builder: (context, snapshot) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Update your brew settings',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(()=> _currentName = val),
              ),
              SizedBox(height: 20.0,),
              //  DropDown
              DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? '0',
                items: sugars.map((sugar){
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
                }).toList(),
                  onChanged: (val) => setState(()=> _currentSugars = val),
              ),
              //  Slider
              Slider(
                value: (_currentStrength ?? 100).toDouble(),
                activeColor: Colors.brown[_currentStrength ?? 100],
                inactiveColor: Colors.brown[_currentStrength ?? 100],
                min: 100,
                max: 900,
                divisions: 8,
                onChanged: (val) => setState(()=> _currentStrength = val.round()),
              ),
              //  Button
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
