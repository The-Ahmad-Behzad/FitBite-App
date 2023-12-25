import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'my_drawer_header.dart';

void main() => runApp(MaterialApp(home: LoginOrSignUp()));
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

class LoginOrSignUp extends StatelessWidget {
  const LoginOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                          "assets/tp logo 1.png",
                        height: 130.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 200.0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 15.0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login()),
                                  );
                                },
                                child: Text(
                                    "Log in",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                            ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 15.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                  "Sign up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontFamily: 'Poppins',
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login({super.key});

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _pwdEmpty = false;
  bool _emailEmpty = false;
  bool _emailNotContainsAT = false;
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/bg login.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 15.0,
                          ),
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginOrSignUp()));
                              },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                            ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Text(
                      'Login to your account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 320.0,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              isDense: true,
                              labelText: ' Email',
                              floatingLabelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'enter your Email',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              errorText: _emailEmpty ? ('This is a required field') : (_emailNotContainsAT? 'Must include @' : null),
                              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 320.0,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              isDense: true,
                              labelText: ' Password',
                              floatingLabelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              errorText: _pwdEmpty ? 'This is a required field' : null,
                              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 13.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                          margin: EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 15.0,
                            ),
                          onPressed: () {
                          _email.text.isEmpty ? _emailEmpty = true : _emailEmpty = false;
                          !(_email.text.contains('@')) ? _emailNotContainsAT =  true : _emailNotContainsAT = false;
                          _password.text.isEmpty ? _pwdEmpty = true : _pwdEmpty = false;

                          bool _allCriteriasMet = !_emailEmpty &&
                              !_emailNotContainsAT && !_pwdEmpty;

                          if (_allCriteriasMet){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EatOrWork()),
                            );
                          }
                        },
                        child: Text('Login', style: TextStyle( letterSpacing: 1.0),),
                      )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                            child: Text('Dont have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

bool _pwdEmpty = false;
bool _SUpwdNotMeetsCriteria = false;

void validatePassword(TextEditingController value) {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)()");
  if (value.text.isEmpty) {
    _pwdEmpty = true;
  }
  else {
    _pwdEmpty = false;
    if (!pass_valid.hasMatch(value.text) || value.text.length <8) {
      _SUpwdNotMeetsCriteria = true;
    }
    else {
      _SUpwdNotMeetsCriteria = false;
    }
  }
}



class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _name = TextEditingController();
  final _phoneNo = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPwd = TextEditingController();

  bool _nameEmpty = false;
  bool _phoneNoEmpty = false;
  bool _phnNoNotMeetCriteria = false;
  bool _emailEmpty = false;
  bool _emailNotContainsAT = false;
  bool _confirmPwdEmpty = false;
  bool _pwdNotConfirmed = false;

  void dispose() {
    _name.dispose();
    _phoneNo.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/bg login.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 15.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginOrSignUp()));
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                        'Sign up for an account',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        width: 320.0,
                        child: TextField(
                          controller: _name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                            ),
                            isDense: true,
                            labelText: 'Name',
                            hintText: ' eg: AliJanjuaTiktoker',
                            floatingLabelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.blue[200],
                            ),
                            errorText: _nameEmpty ? 'This is a required field' : null,
                            errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        width: 320.0,
                        child: TextField(
                          controller: _phoneNo,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                            ),
                            isDense: true,
                            labelText: 'Phone no',
                            hintText: ' eg: 03331234567',
                            floatingLabelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.blue[200],
                            ),
                            errorText: _phoneNoEmpty ? 'This is a required field' : (_phnNoNotMeetCriteria? 'Invalid Phone number' : null),
                            errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 320.0,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              isDense: true,
                              labelText: ' Email',
                              floatingLabelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: ' eg: AliJanjua123@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.blue[200],
                              ),
                              errorText: _emailEmpty ? ('This is a required field') : (_emailNotContainsAT? 'Must include @' : null),
                              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 320.0,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              isDense: true,
                              labelText: ' Password',
                              floatingLabelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'eg: MyPassword#123',
                              hintStyle: TextStyle(
                                color: Colors.blue[200],
                              ),
                              errorText: _pwdEmpty ? ('This is a required field') : (!_SUpwdNotMeetsCriteria ? null : 'Password must:\n- be 8 characters long\n- include 1 Upper and 1 Lower case letter,\n- 1 Number, 1 Special char'),
                              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 320.0,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: _confirmPwd,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              isDense: true,
                              labelText: ' Confirm Password',
                              floatingLabelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'eg: MyPassword#123',
                              hintStyle: TextStyle(
                                color: Colors.blue[200],
                              ),
                              errorText: _confirmPwdEmpty ? ('This is a required field') : (!_pwdNotConfirmed ? null : 'Passwords do not match'),
                              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _name.text.isEmpty ? _nameEmpty = true : _nameEmpty = false;

                          _phoneNo.text.isEmpty ? _phoneNoEmpty = true : _phoneNoEmpty = false;
                          RegExp phoneNo_valid = RegExp(r"(?=.*\d)");
                          (double.tryParse(_phoneNo.text) == null || _phoneNo.text.length != 11) ? _phnNoNotMeetCriteria = true : _phnNoNotMeetCriteria = false;


                          _email.text.isEmpty ? _emailEmpty = true : _emailEmpty = false;
                          !(_email.text.contains('@')) ? _emailNotContainsAT =  true : _emailNotContainsAT = false;

                          _password.text.isEmpty ? _pwdEmpty = true : _pwdEmpty = false;

                          _confirmPwd.text.isEmpty ? _confirmPwdEmpty = true : _confirmPwdEmpty = false;
                          validatePassword(_password);

                          if (!_pwdEmpty && !_SUpwdNotMeetsCriteria) {
                            _password.text != _confirmPwd.text ? _pwdNotConfirmed = true : _pwdNotConfirmed = false;
                          }
                          bool _allCriteriasMet = !_nameEmpty && !_phoneNoEmpty && !_phnNoNotMeetCriteria && !_emailEmpty &&
                              !_emailNotContainsAT && !_pwdEmpty && !_SUpwdNotMeetsCriteria && !_confirmPwdEmpty && !_pwdNotConfirmed;
                          if (_allCriteriasMet){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EatOrWork()),
                              );
                            }
                        },
                        child: Text('Sign up'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                            child: Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ),
          ]
        ),
      ),
    );
  }
}

class EatOrWork extends StatelessWidget {
  const EatOrWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              'What do you want to do today?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 224,
                width: 224,
                margin: EdgeInsets.all(30),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Order()),
                    );
                  },
                  child: Image.asset('assets/mp food icon.jpg'),
                ),
              ),
              Container(
                height: 223,
                width: 223,
                margin: EdgeInsets.all(30),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Image.asset('assets/mp workout icon.jpg'),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}

class Order extends StatelessWidget {
  Order({super.key});

  final _search = TextEditingController();
  int _mode = 0;
  int _category = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/abc.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: ToggleSwitch(
                      animate: true,
                      animationDuration: 250,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: ['Normal', 'Diet'],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Delicious, healthy food just for you',
                    style: TextStyle(
                      fontSize: 22.0,
                      letterSpacing: 1.0,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 0.1),
                    child: Center(
                      child: TextField(
                        controller: _search,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Set the text to bold
                          color: Colors.black, // Set the desired text color
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey[200], // Set the desired background color
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: const Color(0xff504f4f), // Change the border fill color here
                              width: 2, // Set the desired border width
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                if (_search.text.toUpperCase() == 'BIRYANI'){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RiceRecipe()),
                                  );
                                }
                                else if (_search.text.toUpperCase() == 'GREEK SALAD'){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => StewRecipe()),
                                  );
                                }
                              },
                              child: Text('Search')
                          ),
                        ]
                    ),
                  ),

                ],
              ),
              Container(
                child: ToggleSwitch(
                  animate: true,
                  animationDuration: 250,
                  minWidth: 200,
                  initialLabelIndex: 0,
                  totalSwitches: 4,
                  labels: ['Spicy', 'Savoury', 'Sweet', 'Fast Food'],
                  onToggle: (index) {
                    print('switched to: $index');
                    _category = index!;
                  },
                ),
              ),
              Positioned(
                top: 500,
                left: 50,
                right: 50,
                child: Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xff075460),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/biryani1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RiceRecipe()),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            'Biryani',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 670,
                left: 50,
                right: 50,
                child: Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xff075460),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/greekSalad.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HealthyRecipe()),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            'Greek Salad',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          drawer: MainDrawer(),
        ),
      ],
    );
  }
}


class MoodChoice extends StatelessWidget {
  const MoodChoice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          drawer: Drawer(
            child: MainDrawer(), // Populate the Drawer in the next step.
          ),
          backgroundColor: Colors.white, // Set the background color to white
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1),
                Container(
                  child: Image.asset(
                    "assets/image.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                //SizedBox(height: 2),
                //Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);

                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Set the text to bold
                      color: Colors.black, // Set the desired text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                      Colors.grey[200], // Set the desired background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          // Set the desired border color
                          color: const Color(
                              0xff504f4f), // Change the border fill color here
                          width: 2, // Set the desired border width
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "                 Go to Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87, // Set the desired text color
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 70, right: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/angry.png",
                                width: 94,
                                height: 94,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/sad.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 70, right: 30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/depressed.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/happy.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 70, right: 30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/excited.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/confuse.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 70, right: 30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/tired.png",
                                width: 93,
                                height: 93,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Choices()));
                              },
                              child: Image.asset(
                                "assets/bore.png",
                                width: 94,
                                height: 94,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    "\nor you want to Choose food.\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 14.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 147),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Choices()));
                    },
                    child: Text(
                      "Click here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87, // Set the desired text color
                        fontSize: 14.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Choices extends StatelessWidget {
  const Choices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          drawer: Drawer(
            child: MainDrawer(), // Populate the Drawer in the next step.
          ),
          backgroundColor: Colors.white, // Set the background color to white
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1),
                Container(
                  child: Image.asset(
                    "assets/imag.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                //SizedBox(height: 2),
                //Rect myRect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);

                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Set the text to bold
                      color: Colors.black, // Set the desired text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                      Colors.grey[200], // Set the desired background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          // Set the desired border color
                          color: const Color(
                              0xff504f4f), // Change the border fill color here
                          width: 2, // Set the desired border width
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 170),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MoodChoice()));
                        },
                        child: Text(
                          "    Return Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87, // Set the desired text color
                            fontSize: 15.0,
                            letterSpacing: 2.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Sweet()));
                        },
                        child: Image.asset(
                          "assets/sweet.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Salty()));
                        },
                        child: Image.asset(
                          "assets/salty.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Healthy()));
                        },
                        child: Image.asset(
                          "assets/healthy.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.only(left: 170),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Choices2()));
                    },
                    child: Text(
                      "    More Options",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87, // Set the desired text color
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Choices2 extends StatelessWidget {
  const Choices2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          drawer: Drawer(
            child: MainDrawer(), // Populate the Drawer in the next step.
          ),
          backgroundColor: Colors.white, // Set the background color to white
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1),
                Container(
                  child: Image.asset(
                    "assets/imag.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Set the text to bold
                      color: Colors.black, // Set the desired text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                      Colors.grey[200], // Set the desired background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          // Set the desired border color
                          color: const Color(
                              0xff504f4f), // Change the border fill color here
                          width: 2, // Set the desired border width
                        ),
                      ),
                    ),
                  ),
                ),
                // Expanded(child: Container()),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.only(left: 170),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Choices()));
                    },
                    child: Text(
                      "    Return Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87, // Set the desired text color
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Savory()));
                        },
                        child: Image.asset(
                          "assets/savory.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Spicy()));
                        },
                        child: Image.asset(
                          "assets/spicy.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Drinks()));
                        },
                        child: Image.asset(
                          "assets/drinks.png",
                          width: 195,
                          height: 140,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.only(left: 170),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "    Go to Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87, // Set the desired text color
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Sweet extends StatelessWidget {
  const Sweet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices()));
                  },
                  child: Text(
                    "    Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/AcaiBowl.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/FruitSalad.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/dessert.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Salty extends StatelessWidget {
  const Salty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices()));
                  },
                  child: Text(
                    "    Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/pulao.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/fried-rice.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/chickenrice.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Healthy extends StatelessWidget {
  const Healthy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices()));
                  },
                  child: Text(
                    "    Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/greensalad.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/egg.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/beans.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Savory extends StatelessWidget {
  const Savory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitHeight,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices2()));
                  },
                  child: Text(
                    "   Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/samosy.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/pakory.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/fries.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Spicy extends StatelessWidget {
  const Spicy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices2()));
                  },
                  child: Text(
                    "   Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Jjigae.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Tteok-bokki.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/K-friendchiken.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Drinks extends StatelessWidget {
  const Drinks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1),
          Container(
            child: Image.asset(
              "assets/imag.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0.1),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold, // Set the text to bold
                color: Colors.black, // Set the desired text color
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200], // Set the desired background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    // Set the desired border color
                    color: const Color(
                        0xff504f4f), // Change the border fill color here
                    width: 2, // Set the desired border width
                  ),
                ),
              ),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: 10,
            width: 200,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 170),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Choices2()));
                  },
                  child: Text(
                    "    Return Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87, // Set the desired text color
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/juice.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/yakhni.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 75),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/colddrink.png",
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class FoodPortion extends StatelessWidget {
  const FoodPortion({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/foodpagebg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 30,
              ),
            ),
            Text(
              'Hello Fitsters!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Text(
              'Make Your Own Food',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                fontFamily: 'Poppins',
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            FloatingActionButton.extended(
              label: Text('Let\'s Go'), // <-- Text
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesFood()),
                );
              },
            ),
          ],
        )
      ],
      ),
    );
  }
}

class CategoriesFood extends StatelessWidget {
  const CategoriesFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/FoodCategoriesBg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Top Recipes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.cyan[900],
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 180,
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  final List<Map<String, dynamic>> categoryData = [
                    {
                      'route': Korean(
                        category: 'Korean',
                      ),
                      'image': 'assets/teokbeokie.png',
                      'name': 'Korean',
                    },
                    {
                      'route': Rice(
                        category: 'Rice',
                      ),
                      'image': 'assets/rice1.png',
                      'name': 'Rice',
                    },
                    {
                      'route': Stew(
                        category: 'Stew',
                      ),
                      'image': 'assets/stew1.png',
                      'name': 'Stew',
                    },
                    {
                      'route': Healthy1(
                        category: 'Healthy1',
                      ),
                      'image': 'assets/salad.png',
                      'name': 'Healthy',
                    },
                  ];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => categoryData[index]['route'],
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff075460),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            //for circular images
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              categoryData[index]['image'],
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            categoryData[index]['name'],
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 240,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.cyan[900],
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 50,
            right: 50,
            child: Container(
              height: 130,
              width: 90,
              decoration: BoxDecoration(
                color: Color(0xff075460),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/biryani1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RiceRecipe()),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'Biryani',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 670,
            left: 50,
            right: 50,
            child: Container(
              height: 130,
              width: 90,
              decoration: BoxDecoration(
                color: Color(0xff075460),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/greekSalad.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HealthyRecipe()),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'Greek Salad',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Korean extends StatelessWidget {
  final String category;
  const Korean({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(
          children: <Widget>[
        Image.asset(
          "assets/korean1.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 150,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/teokbeokie.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KoreanRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Tteokbbeokie',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 310,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/jigae.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KoreanRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Jjigae',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 470,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/friedchicken.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KoreanRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'K-Fried Chicken',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Stew extends StatelessWidget {
  final String category;
  const Stew({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/stew.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 150,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/nihari.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StewRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Nihari',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 310,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/beanstew.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StewRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'White Bean Stew',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 470,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/yakhni.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StewRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Chicken Yakhni',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Healthy1 extends StatelessWidget {
  final String category;
  const Healthy1({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/healthy1.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 150,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/acai.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthyRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Acai Bowl',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 310,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/greekSalad.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthyRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Greek Salad',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 470,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/chickpea.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthyRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Chickpea Salad',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Rice extends StatelessWidget {
  final String category;
  const Rice({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/rice.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 150,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/biryani1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiceRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Biryani',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 310,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/kabuli.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiceRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Kabuli Pulao',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 470,
          left: 50,
          right: 50,
          child: Container(
            height: 130,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xff075460),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/chinese.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiceRecipe()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Chinese Rice',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class HealthyRecipe extends StatelessWidget {
  const HealthyRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff075460),
        automaticallyImplyLeading: true,
        title: Text('Greek Salad Recipe'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('assets/greekSalad.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ingredients:\n- 2 large tomatoes, diced\n- 1 cucumber, diced\n- 1/2 red onion, thinly sliced\n- 1/2 green bell pepper, diced\n- 1/2 cup kalamata olives\n- 1/2 cup crumbled feta cheese\n- 1/4 cup extra-virgin olive oil\n- 2 tablespoons red wine vinegar\n- 1 teaspoon dried oregano\n- Salt and freshly ground black pepper, to taste\n\nInstructions:\n1. In a large bowl, combine the tomatoes, cucumber, red onion, bell pepper, and olives.\n2. In a small bowl, whisk together the olive oil, red wine vinegar, oregano, salt, and pepper.\n3. Pour the dressing over the salad and toss well to combine.\n4. Add the crumbled feta cheese and gently toss again.\n5. Serve chilled and enjoy!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class KoreanRecipe extends StatelessWidget {
  const KoreanRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff075460),
        automaticallyImplyLeading: true,
        title: Text('Tteokbokki Recipe'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('assets/teokbeokie.png'),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ingredients:\n- 500g tteok (Korean rice cakes)\n- 150g fish cakes\n- 1 onion, sliced\n- 2 green onions, chopped\n- 2 tablespoons gochujang (Korean red pepper paste)\n- 1 tablespoon gochugaru (Korean red pepper flakes)\n- 1 tablespoon sugar\n- 1 tablespoon soy sauce\n- 1 tablespoon minced garlic\n- 1 tablespoon sesame oil\n- 4 cups water\n\nInstructions:\n1. In a large pot, add the water, onion, fish cakes, gochujang, gochugaru, sugar, soy sauce, and minced garlic. Mix well and bring to a boil.\n2. Add the tteok to the pot and stir gently to prevent the rice cakes from sticking together.\n3. Cook for about 10-15 minutes over medium heat until the tteok is cooked and the sauce thickens.\n4. Add the chopped green onions and sesame oil and stir well.\n5. Serve hot and enjoy!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class StewRecipe extends StatelessWidget {
  const StewRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff075460),
        automaticallyImplyLeading: true,
        title: Text('Chicken Yakhni Recipe'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('assets/yakhni.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ingredients:\n- 1 kg chicken\n- 2 onions, sliced\n- 1 tbsp ginger paste\n- 1 tbsp garlic paste\n- 1/2 cup yogurt\n- 2 tsp coriander powder\n- 1 tsp cumin seeds\n- 1 tsp fennel seeds\n- 1 tsp black peppercorns\n- 4 cloves\n- 4 green cardamom\n- 1 cinnamon stick\n- Salt to taste\n- 1/4 cup oil\n- 1 liter water\n\nInstructions:\n1. Heat oil in a pot and add sliced onions. Fry until onions are golden brown.\n2. Add chicken and fry for a few minutes until chicken is browned.\n3. Add ginger paste, garlic paste, coriander powder, cumin seeds, fennel seeds, black peppercorns, cloves, green cardamom, cinnamon stick, and salt. Mix well.\n4. Add yogurt and cook for a few minutes until the yogurt is well incorporated.\n5. Add water and bring to a boil.\n6. Reduce heat and let the yakhni simmer for 30-40 minutes or until the chicken is tender and the broth is flavorful.\n7. Serve hot with naan or rice.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class RiceRecipe extends StatelessWidget {
  const RiceRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff075460),
        automaticallyImplyLeading: true,
        title: Text('Biryani Recipe'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('assets/biryani1.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ingredients:\n- 1 kg basmati rice\n- 1 kg chicken\n- 2 cups yogurt\n- 2 cups fried onions\n- 1/2 cup ghee\n- 2 tbsp ginger paste\n- 2 tbsp garlic paste\n- 4 bay leaves\n- 6 green cardamom\n- 1 cinnamon stick\n- 1 tsp cumin seeds\n- 1 tsp coriander seeds\n- 1 tsp black peppercorns\n- 1 tsp red chili powder\n- Salt to taste\n\nInstructions:\n1. Soak the rice in water for 30 minutes.\n2. Heat the ghee in a large pot and add the bay leaves, green cardamom, cinnamon stick, cumin seeds, coriander seeds, and black peppercorns. Fry for a few seconds.\n3. Add the chicken, ginger paste, garlic paste, red chili powder, and salt. Cook until the chicken is browned.\n4. Add the yogurt and fried onions, and stir to combine.\n5. Drain the rice and add it to the pot. Add enough water to cover the rice by about 1 inch.\n6. Cover the pot and cook on low heat for 20-25 minutes, or until the rice is cooked and the water has been absorbed.\n7. Serve hot with raita and salad.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
