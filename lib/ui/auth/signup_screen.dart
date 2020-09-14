import 'package:facebookclone/resources/colors.dart';
import 'package:facebookclone/resources/strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( AppStrings.name , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Builder(
        builder: (context) => Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Text(AppStrings.qName,
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: ListTile(
                    title: Text('Please enter your first and last name ',
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                    trailing: Icon(Icons.error , color: Colors.red,),
                  ),
                ),
              ),
              _buildTextFields(),
              SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: RaisedButton(
                    color: AppColors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Next',
                      style: TextStyle(color: AppColors.white),
                    ),
                    onPressed: () {

                      !_formKey.currentState.validate() ? setState(() {
                        _visible = !_visible;
                      }) : Navigator.pushNamed(context, "/birthdayScreen");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20),
          Flexible(
            child: TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "first name !";
                }
              },
              decoration: InputDecoration(labelText: AppStrings.firstName),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "last name !";
                }
              },
              decoration: InputDecoration(labelText: AppStrings.lastName),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
