import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  String keyName = 'counter_key';
  int _counter = 0;
  void increment() {
    setState(() {
      _counter++;
    });
  }

  void clear() {
    setState(() {
      _counter = 0;
    });
  }
  
  void saveCounter() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyName, _counter);
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(keyName) ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void deleteCounter() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(keyName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1A33),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Counter app",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(height: 100),
                Text(
                  _counter.toString(),
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ),
                Text(
                  "CURRENT COUNT",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          increment();
                          saveCounter();
                        },
                        child: Text(" + Increment "),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          deleteCounter();
                          clear();
                        },
                        child: Text(" Clear "),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
