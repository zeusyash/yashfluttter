import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest App',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey=GlobalKey<_MyHomePageState>();
  String res='';
  TextEditingController p = TextEditingController();
  TextEditingController i = TextEditingController();
  TextEditingController t = TextEditingController();
  bool _autovalidate=false;
  int amt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.00),
        child: Form(
          autovalidate: _autovalidate,
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: p,
                    decoration: InputDecoration(
                      labelText: "Enter principle",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.00)),
                    ),
                  )),
              SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: i,
                decoration: InputDecoration(
                  labelText: "Enter Interest",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.00)),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: t,
                decoration: InputDecoration(
                  labelText: "Enter Time",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.00)),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.res=calc();
                        });
                      },
                      child: Text('Calculate'),
                      color: Colors.teal,

                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: RaisedButton(
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          reset();
                        });
                      },
                      color: Colors.teal,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Text(res)
            ],
          ),
        ),
      ),
    );
  }

  String calc() {
    double amt=0.0;
    double principle=double.parse(p.text);
    double interest=double.parse(i.text);
    double time=double.parse(t.text);
    amt= (principle*interest*time)/100;
    amt=amt+principle;
    return 'Your Interest is $amt';
  }

  void reset() {
    p.text='';
    i.text='';
    t.text='';
    res='';
  }
}
