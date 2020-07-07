import 'package:flutter/material.dart';
import 'package:flutter_forms_bloc/src/blocs/provider.dart';
import '../src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC Form'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              emailField(bloc),
              passwordField(bloc),
              SizedBox(
                height: 20.0,
              ),
              submitButton(bloc),
            ],
          ),
        ),
      ),
    );
  }

//  With a StreamBuilder we are going to be watching Stream
//  Whenever stream has new value come through it builder method is going re-run
//  snapshot contains the information about the event that just came through the stream

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Id',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('submit'),
          color: Colors.teal,
          textColor: Colors.white,
        );
      },
    );
  }
}
