import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saathi/screens/toDoList.dart';
import 'package:saathi/services/call_service.dart';
import 'package:saathi/services/database.dart';
import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CallService _service = locator<CallService>();
  String number;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 18,
      children: <Widget>[
        Container(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: "BP systolic",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                onChanged: (val) {
                  setState(() => bps = val);
                  inputBP();
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(width: 50,),
            Expanded(
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: "BP diastolic",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                onChanged: (val) {
                  setState(() => bpd = val);
                  inputBP();
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: "Sugar before meal",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                onChanged: (val) {
                  setState(() => sugarb = val);
                  inputSugar();
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(width: 50,),
            Expanded(
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: "Sugar after meal",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                onChanged: (val) {
                  setState(() => sugara = val);
                  inputSugar();
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_dateTime == null
                      ? 'Date has not been picked yet'
                      : dateStr,
                    style: TextStyle(
                        fontSize: 16
                    ),),
                  Container(height: 5,),
                  RaisedButton(
                    child: Text('Pick a date'),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: _dateTime == null
                              ? DateTime.now()
                              : _dateTime,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2021))
                          .then((date) {
                        setState(() {
                          _dateTime = date;
                          dateStr = "${_dateTime.toLocal()}".split(' ')[0];
                          inputBP();
                          inputSugar();
                        },);
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        Text(
          "To Do List",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        ToDoList(),
        Center(
          child: PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Ambulance"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Police"),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Fire"),
              ),
              PopupMenuItem(
                value: 4,
                child: Text("Family 1"),
              ),
              PopupMenuItem(
                value: 5,
                child: Text("Family 2"),
              ),
            ],
            onCanceled: () {
              print("You have canceled the call");
            },
            onSelected: (value) {
              if (value == 1)
                number = '102';
              else if (value == 2)
                number = '100';
              else if (value == 3)
                number = '101';
              else if (value == 4)
                number = 'XXX';
              else if (value == 5)
                number = 'XXX';
              _service.call(number);
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 55,
              child: Text(
                'EMERGENCY',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputBP() async{
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    await DatabaseService(uid: uid).addBP(bps, bpd, dateStr);
  }

  void inputSugar() async{
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    await DatabaseService(uid: uid).addSugar(sugarb, sugara, dateStr);
  }

  String getBP(){
    return bps;
  }
}
