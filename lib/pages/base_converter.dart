import 'package:flutter/material.dart';
import 'dart:math';

class Base_converter extends StatefulWidget {
  const Base_converter({Key? key}) : super(key: key);

  @override
  State<Base_converter> createState() => _Base_converterState();
}

class _Base_converterState extends State<Base_converter> {
  @override
  String binaryValue='1010';
  String octalValue='12';
  String decimalValue='10';
  String hexaValue='a';
  
  bool isBinary=false;
  bool isOctal=false;
  bool isDecimal=false;
  bool isHexa=false;

  void setBaseStates(){
     isBinary=false;
     isOctal=false;
     isDecimal=false;
     isHexa=false;
  }

/*
  int convertTo(String value){
    if(value==''){
      return
    }
  }
*/

  int decimal(String bin,String base){
    if(bin=='a'){
      bin=10.toString();
    }else if(bin=='b'){
      bin=11.toString();
    }else if(bin=='c'){
      bin=12.toString();
    }else if(bin=='d') {
      bin = 13.toString();
    }else if(bin=='e') {
      bin = 14.toString();
    }else if(bin=='f') {
      bin = 15.toString();
    }else{
      bin=bin;
    }
    int result=0;
    int q=0;
    int a;
    int i=bin.length-1;
    while(i>=0){
      while(q<bin.length){
        a=int.parse(bin[i]);
        i--;
        result=result+a*pow(int.parse(base), q)as int;
        q++;
      }
    }
    return result;
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0XFF0a041c),
      appBar: AppBar(
          backgroundColor: Color(0xFF1D1E33),
          title: Center(
            child: Text(
              'BASE CONVERTER',
              style: TextStyle(fontSize: 20.0),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Binary (Base 2)',
                    style: TextStyle(color: Color(0XFF907bd1), fontSize: 15.0),
                  )),
            ),
            SizedBox(
              height: 5.0,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TextField(
                onTap: (){
                  setState((){
                    setBaseStates();
                    isBinary=true;
                  });
                },
                onChanged: (value){
                  setState((){
                    binaryValue=value;
                  });
                },
                style: TextStyle(color: Colors.white),
                maxLength: 50,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: isHexa ? decimal(hexaValue, 16.toString()).toRadixString(2) :
                  isDecimal? decimal(decimalValue, 10.toString()).toRadixString(2) :
                  isBinary ? binaryValue :
                  decimal(octalValue, 8.toString()).toRadixString(2),
                  filled: true,
                  fillColor: Color(0xFF1D1E33),
                  hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF907bd1)),
                  ),
                ),
                cursorColor: Colors.blueAccent,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Octal (Base 8)',
                    style: TextStyle(fontSize: 15.0, color: Color(0XFF907bd1)),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TextField(
                onTap: (){
                  setState((){
                    setBaseStates();
                    isOctal=true;
                  });
                },
                onChanged: (value){
                  setState((){
                    octalValue=value;
                  });
                },
                maxLength: 15,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blueAccent,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1D1E33),
                    hintText: isHexa ? decimal(hexaValue, 16.toString()).toRadixString(8) :
                    isDecimal? decimal(decimalValue, 10.toString()).toRadixString(8) :
                    isBinary ? decimal(binaryValue, 2.toString()).toRadixString(8) :
                    octalValue ,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF907bd1)))),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Decimal (Base 10)',
                  style: TextStyle(color: Color(0XFF907bd1), fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TextField(
                onTap: (){
                  setState((){
                    setBaseStates();
                    isDecimal=true;
                  });
                },
                onChanged: (value){
                  setState((){
                    decimalValue=value;
                  });
                },
                maxLength: 15,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blueAccent,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: isHexa? decimal(hexaValue, 16.toString()).toString() :
                  isDecimal? decimalValue :
                  isBinary ? decimal(binaryValue, 2.toString()).toString():
                    decimal(octalValue, 8.toString()).toString(),
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFF1D1E33),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF907bd1)))),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hexadecimal (Base 10)',
                  style: TextStyle(color: Color(0XFF907bd1), fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TextField(
                onTap: (){
                  setState((){
                    setBaseStates();
                    isHexa=true;
                  });
                },
                onChanged: (value){
                  setState((){
                    hexaValue=value;
                  });
                },
                maxLength: 15,
                scrollPadding: EdgeInsets.only(bottom: 40.0),
                cursorColor: Colors.blueAccent,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: isHexa? hexaValue :
                  isDecimal? decimal(decimalValue, 10.toString()).toRadixString(16) :
                  isBinary ? decimal(binaryValue, 2.toString()).toRadixString(16):
                  decimal(octalValue, 8.toString()).toRadixString(16),
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFF1D1E33),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF907bd1)))),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
