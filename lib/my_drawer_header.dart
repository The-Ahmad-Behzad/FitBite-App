import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[200],
      width: 250,
      child: SingleChildScrollView(
        child: Container(
        child: Column(
        children: [
        Container(
    child: Padding(
    padding: EdgeInsets.only(top: 50.0, left: 20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Image.asset(
    "assets/sb logo.png",
    fit: BoxFit.fitWidth,
    ),
    ],
    ),
    ),
    ),
    SizedBox(
    height: 20.0,
    ),
    ListTile(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            //ahmad k page ka link ayga home ka
              builder: (BuildContext context) => Order()));
    },
    leading: Image.asset(
    "assets/sb home 2.png",
    // color: Colors.black,
      width: 20,
      height: 20,
    ),
    title: Text("   Home",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    )),
    ),
    ListTile(
    onTap: () {
    //Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Select()));
    },
    leading: Icon(
      Icons.no_food_rounded,
    ),
    title: Text(
    "   Food",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    ),
    ),
    trailing: Icon(
      Icons.arrow_drop_up,
      size: 30,
      color: Colors.grey[600],
    )
    ),
    Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: ListTile(
      onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MoodChoice()));
      },
      leading: Icon(
      Icons.fiber_manual_record,
      color: Color(0xff363636),
      size: 15,
      ),
      title: Text(
      "Mood Based",
      style: TextStyle(
      //fontWeight: FontWeight.bold,
      fontSize: 14.0,
      letterSpacing: 2.0,
      fontFamily: 'Poppins',
      ),
      ),
      ),
    ),
    Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: ListTile(
      onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            //moimma ki recipies wala link ayga yhan
              builder: (BuildContext context) => FoodPortion()));
      },
      leading: Icon(
      Icons.fiber_manual_record,
      color: Color(0xff363636),
      size: 15,
      ),
      title: Text(
      "Recipies",
      style: TextStyle(
      fontSize: 14.0,
      letterSpacing: 2.0,
      fontFamily: 'Poppins',
      ),
      ),
      ),
    ),
    ListTile(
    onTap: () {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       //ahmad the workout wala link ayga yhan
    //         builder: (BuildContext context) => MoodChoice()));
    },
    leading: Icon(
    Icons.fitness_center_outlined,
    color: Colors.black,
    size: 35,
    ),
    title: Text(
    "    Workout",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    ),
    ),
    trailing: Text(
    "9+",
    style: TextStyle(
    color: Colors.grey[600],
    fontSize: 14.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    ),
    ),
    ),
    ListTile(
    onTap: () {},
    leading: Icon(
    Icons.bookmark_border,
    color: Colors.black,
    size: 35,
    ),
    title: Text(
    "    Saved",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    ),
    ),
    ),
    ListTile(
    onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LoginOrSignUp()));
    },
    leading: Icon(
    Icons.supervisor_account,
    color: Colors.black,
    size: 40,
    ),
    title: Text(
    "    Account",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    letterSpacing: 2.0,
    fontFamily: 'Poppins',
    ),
    ),
    ),
    ],
    ),      ),
    ),
    );
  }
}
