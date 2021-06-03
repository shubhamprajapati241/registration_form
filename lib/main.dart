import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Registration Form",
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();

  String dropdownValue = "Male";
  List<String> gender = [
    'Male',
    'Female',
    'Other',
  ];

  String password; 
  final passwordValidator = MultiValidator([  
    RequiredValidator(errorText: '**Required'),  
    MinLengthValidator(8, errorText: 'Must be at least 8 digits'),  
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Must have one special character')  
 ]);

  TextEditingController dateCtl = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration Form",
              style: TextStyle(
                fontFamily: "Time New Roman",
              )),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  autovalidate: true,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                  hintText: "e.g. John",
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z]*$')),
                                ],
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "**Required"),
                                  MinLengthValidator(3,
                                      errorText: "**Must have 3 letters"),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            new Flexible(
                              child: new TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                  hintText: "e.g. Smith",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z]*$')),
                                ],
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "**Required"),
                                  MinLengthValidator(3,
                                      errorText: "**Must have 3 letters"),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.purple)),
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.purple,
                            ),
                            hintText: "e.g. smith@gmail.com"
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "**Required"),
                            EmailValidator(
                                errorText: "Please enter a valid Email ID !!"),
                          ]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.purple)),
                            border: OutlineInputBorder(),
                            labelText: "Mobile",
                            labelStyle: TextStyle(
                              color: Colors.purple,
                            ),
                            hintText: "e.g. 999****999"
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: MultiValidator([
                            RequiredValidator(errorText: "**Required"),
                            MinLengthValidator(10,
                                errorText:
                                    "Please enter a valid Mobile number !!"),
                          ]),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  border: OutlineInputBorder(),
                                  labelText: "Gender",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                                value: dropdownValue,
                                onChanged: (String value) {
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                ),
                                items: gender.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            new Flexible(
                              child: TextFormField(
                                controller: dateCtl,
                                decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  border: OutlineInputBorder(),
                                  labelText: "Date of birth",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                                onTap: () async {
                                  DateTime date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  // dateCtl.text = date.toIso8601String();
                                  dateCtl.text =
                                      "${date.day}-${date.month}-${date.year}";
                                },
                                validator:
                                    RequiredValidator(errorText: "**Required"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                 validator: passwordValidator,
                                 onChanged: (val) => password = val,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            new Flexible(
                              child: new TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.purple)),
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                    color: Colors.purple,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (val) => MatchValidator(errorText: 'Passwords do not match').validateMatch(val, password),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
