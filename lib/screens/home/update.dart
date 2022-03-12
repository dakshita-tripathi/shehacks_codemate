import 'package:flutter/material.dart';
import 'package:codemate/models/user.dart';
import 'package:codemate/services/database.dart';
import 'package:provider/provider.dart';
import 'package:codemate/screens/home/home.dart';
class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {
  String _currentName = '';
  String current_cc_rank = '';
  int current_he_rank = 0;
  int current_apk_points = 0;
  String uid='';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    final List<String> cc_rank = ['*', '**', '***', '****', '*****','******','*******'];
    return Scaffold(
        body:Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Text(
                'update your profile',
                style: TextStyle(fontSize: 20.0),
              ),
              //padding: Padding()
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) =>
                val!.isEmpty ? 'please enter your name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                  items: cc_rank.map((cc_rank) {
                    return DropdownMenuItem(
                      value: cc_rank,
                      child: Text('$cc_rank codechef stars'),
                    );
                  }).toList(),
                  onChanged: (val) =>
                      setState(() => current_cc_rank = val! as String)),
              RaisedButton(
                color: Colors.yellow,
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    await DatabaseService(uid: user!.uid).updateUserData(
                      _currentName ,
                      current_cc_rank ,
                      current_apk_points ,
                      current_he_rank ,
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()),);
                  }
                },
              )]))
    );
  }
}