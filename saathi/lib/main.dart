import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:saathi/screens/addPrescription.dart';
import 'package:saathi/screens/account.dart';
import 'package:saathi/screens/bloodPressureDisplay.dart';
import 'package:saathi/screens/home.dart';
import 'package:saathi/screens/medicineReminder.dart';
import 'package:saathi/screens/sugarDisplay.dart';
import 'package:saathi/services/auth.dart';
import 'services/call_service.dart';
import 'screens/wrapper.dart';
import 'models/user.dart';

GetIt locator = GetIt.I;
String dateStr = "";
String bps = "";
String bpd = "";
String sugarb = "";
String sugara = "";
String name = '';
String age = '';
String bloodGroup = '';
String emergencyContact1 = '';
String emergencyContact2 = '';
List<String> tasks = [];

void setupLocator() {
  locator.registerSingleton(CallService());
}

void main() {
  setupLocator();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      //),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
                'Saathi',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),),
        backgroundColor: Color(0xff52796f),),
        body: Home(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100.0,
                child: DrawerHeader(
                  child: Text(
                    'At your service',
                    style: TextStyle(
                        fontSize: 28.0,
                    color: Colors.white,),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff6bd60),
                  ),
                ),
              ),
              ListTile(
                title: Text('Medicines'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Reminders()));
                },
              ),
              ListTile(
                title: Text('Prescriptions'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Prescriptions()));
                },
              ),
              ListTile(
                title: Text('Blood Pressure'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BloodPressure()));
                },
              ),
              ListTile(
                title: Text('Sugar'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Sugar()));
                },
              ),
              ListTile(
                title: Text('My Account'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyAccount()));
                },
              ),
            ],
          ),
        ),
    );
  }
}

class Prescriptions extends StatefulWidget {
  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {

  @override
  Widget build(BuildContext context) {
    print('Prescription');
    return Scaffold(
      appBar: AppBar(
          title: Text('Prescriptions',),
      backgroundColor: Color(0xfff28482),),
      body: AddPrescription(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your service',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff6bd60),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Reminders');
    return Scaffold(
      appBar: AppBar(title: Text('Mediminder'),
          backgroundColor: Color(0xfff28482),),
      body: Center(
        child: RaisedButton(
            color: Color(0xfff6bd60),
          child: Text('Add a new Mediminder'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMedicineReminder()));
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your service',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff6bd60),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class BloodPressure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Blood Pressure'),
        backgroundColor: Color(0xfff28482),),
      body: BPDisplay(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your service',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff6bd60),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Sugar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sugar'),
        backgroundColor: Color(0xfff28482),),
      body: SugarDisplay(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your service',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff6bd60),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyAccount()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyAccount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        backgroundColor: Color(0xfff28482),
      ),
      body: Account(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'At your service',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,),
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff6bd60),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Medicines'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Reminders()));
              },
            ),
            ListTile(
              title: Text('Prescriptions'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Prescriptions()));
              },
            ),
            ListTile(
              title: Text('Blood Pressure'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BloodPressure()));
              },
            ),
            ListTile(
              title: Text('Sugar'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Sugar()));
              },
            ),
          ],
        ),
      ),
    );
  }
}