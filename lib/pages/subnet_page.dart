import 'dart:math';
import 'package:flutter/material.dart';
import 'package:subnetting/widgets/result_detail_widget.dart';

class Subnet_page extends StatefulWidget {
  const Subnet_page({Key? key}) : super(key: key);

  @override
  State<Subnet_page> createState() => _Subnet_pageState();
}

class _Subnet_pageState extends State<Subnet_page> {
  bool isResult = false;
  String ipAddress='';
  late int hostBit;
  late int networkBit;
  late int blockSize;
  late int validIp;
  late String networkAddress;
  late String firstIp;
  late String lastIp;
  late String broadcastIp;

  void calculateSubnet(String ip){
    List<String> octets=ip.split('\.');
    /*if(int.parse(octets[0])<=223 && int.parse(octets[0])>191){
      hostBit=32-networkBit;
      blockSize=pow(2,hostBit) as int;
      validIp=blockSize-2;
      networkAddress=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+'0'+'/'+networkBit.toString();
      firstIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+'1';
      lastIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+validIp.toString();
      broadcastIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+(blockSize-1).toString();
      print(hostBit);
      print(blockSize);
      print(validIp);
      print(networkAddress);
      print(firstIp);
      print(lastIp);
      print(broadcastIp);

    }    else */if(networkBit<=16 && networkBit > 8){
      //hostBit=32-networkBit;
      //validIp=blockSize-2;
      int IPRange=definningIPRange(networkBit-8);
      blockSize=IPRange;
      networkAddress=octets[0]+'\.'+'0'+'\.'+'0'+'\.'+'0'+'/'+networkBit.toString();
      firstIp=octets[0]+'\.'+'0'+'\.'+'0'+'\.'+'1';
      lastIp=octets[0]+'\.'+(IPRange-1).toString()+'\.'+'255'+'\.'+'254';
      broadcastIp=octets[0]+'\.'+(IPRange-1).toString()+'\.'+'255'+'\.'+'255';
      //print(hostBit);
      print(blockSize);
      //print(validIp);
      print(networkAddress);
      print(firstIp);
      print(lastIp);
      print(broadcastIp);
    }
    if(networkBit<=24 && networkBit > 16){
      //hostBit=32-networkBit;
      //validIp=blockSize-2;
      int IPRange=definningIPRange(networkBit-16);
      blockSize=IPRange;
      networkAddress=octets[0]+'\.'+octets[1]+'\.'+'0'+'\.'+'0'+'/'+networkBit.toString();
      firstIp=octets[0]+'\.'+octets[1]+'\.'+'0'+'\.'+'1';
      lastIp=octets[0]+'\.'+octets[1]+'\.'+(IPRange-1).toString()+'\.'+'254';
      broadcastIp=octets[0]+'\.'+octets[1]+'\.'+(IPRange-1).toString()+'\.'+'255';
      //print(hostBit);
      print(blockSize);
      //print(validIp);
      print(networkAddress);
      print(firstIp);
      print(lastIp);
      print(broadcastIp);
    }
    if(networkBit <=32 && networkBit > 24){
      //hostBit=32-networkBit;
      //validIp=blockSize-2;
      int IPRange=definningIPRange(networkBit-24);
      blockSize=IPRange;
      networkAddress=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+'0'+'/'+networkBit.toString();
      firstIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+'1';
      lastIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+(IPRange-1).toString();
      broadcastIp=octets[0]+'\.'+octets[1]+'\.'+octets[2]+'\.'+(IPRange-1).toString();
      //print(hostBit);
      print(blockSize);
      //print(validIp);
      print(networkAddress);
      print(firstIp);
      print(lastIp);
      print(broadcastIp);
    }
  }

  int definningIPRange(int bit){
    switch(bit){
      case 0:
        return 256;
      case 1:
        return 128;
      case 2:
        return 64;
      case 3:
        return 32;
      case 4:
        return 16;
      case 5:
        return 8;
      case 6:
        return 4;
      case 7:
        return 2;
    }
   return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'VLSM CALCULATOR',
          style: TextStyle(fontSize: 20.0),
        )),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'IP Adress',
                  style: TextStyle(color: Color(0XFF907bd1), fontSize: 20.0),
                ),
              )),
          SizedBox(
            height: 10.0,
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextField(
                    onChanged: (String value){
                      ipAddress=value;
                    },
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'ex: 192.168.1.0',
                        hintStyle: TextStyle(fontSize: 18.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0xFF0a041c))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent))),
                    cursorColor: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text('/'),
              SizedBox(
                width: 5.0,
              ),
              SizedBox(
                  width: 60.0,
                  child: TextField(
                      onChanged: (value){
                        networkBit= int.parse(value);
                        calculateSubnet(ipAddress);
                      },
                      maxLength: 15,
                      cursorColor: Colors.blueGrey,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '24',
                          hintStyle: TextStyle(fontSize: 18.0),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(color: Color(0XFF0a041c))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.lightBlueAccent)))))
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add Subnet',
                          style: TextStyle(
                              color: Color(0XFF907bd1), fontSize: 20.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'NUmber of hosts requireds',
                          style: TextStyle(fontSize: 17.0),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 90.0,
                    child: TextField(
                      maxLength: 15,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'ex: 10',
                          hintStyle: TextStyle(fontSize: 18.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Color(0XFF0a041c)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightBlueAccent))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                  color: Color(0XFF0a041c),
                  child: Text(
                    '+  Add Subnet',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                  onPressed: (
                      ) {})
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 150.0,
              color: Color(0XFF1a181c),
              margin: EdgeInsets.only(left: 5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        'RQUIRED SUBNETS',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                            maxRadius: 15.0,
                            backgroundColor: Colors.blue,
                            child: Text('1')),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('H: 85'),
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                            maxRadius: 15.0,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close))
                      ],
                    )
                  ])),
          SizedBox(
            height: 20.0,
          ),
          //result section
          isResult ? Container(
            child: Flexible(
              child: Column(
                children: [
                  Container(
                    color: Color(0XFF1a181c),
                    margin: EdgeInsets.only(left: 5.0),
                    child: Column(children: <Widget>[
                      ResultDetailWidget(resultTitle: 'Major IP address',resultValue: '192.168.1.0/24',),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0,
                          child: ColoredBox(color: Colors.white),
                        ),
                      ),
                      ResultDetailWidget(resultTitle: 'Major Network',resultValue: '192.168.1.0/24',),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0,
                          child: ColoredBox(color: Colors.white),
                        ),
                      ),
                      ResultDetailWidget(resultTitle: 'Subnet Mask',resultValue: '255.255.255.0',),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0,
                          child: ColoredBox(color: Colors.white),
                        ),
                      ),
                      ResultDetailWidget(resultTitle: 'Major Network Space',resultValue: '254',),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0,
                          child: ColoredBox(color: Colors.white),
                        ),
                      ),
                      ResultDetailWidget(resultTitle: 'Total Space Required',resultValue: '85',),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1.0,
                          child: ColoredBox(color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Color(0XFF1a181c),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Calculated Subnet',
                            style: TextStyle(color: Colors.yellow, fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 140.0,
                          ),
                          Icon(
                            Icons.share,
                            size: 30.0,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Net 1',
                          style: TextStyle(color: Colors.greenAccent),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Required Host',resultValue: '35',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Available Space',resultValue: '62',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Network ID',resultValue: '192.168.1.0/25',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Subnet Mask',resultValue: '255.255.255.192',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'First IP',resultValue: '192.168.1.1',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Last IP',resultValue: '192.168.1.62',),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1.0,
                      child: ColoredBox(color: Colors.white),
                    ),
                  ),
                  ResultDetailWidget(resultTitle: 'Broadcast',resultValue: '192.168.1.63',),
                  SizedBox(width: double.infinity,height: 20.0,)
                ],
              ),
            ),
          ) : Container()
        , Padding(
          padding: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
          child: ButtonTheme(
      minWidth: double.infinity,height: 40.0,
            child: RaisedButton(color: Colors.red,shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),onPressed:(){
                setState((){
                  isResult=true;
                });
                /*Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Base_converter();
                }));*/
            },child: Text('Calculate',style: TextStyle(
                  color: Colors.white,fontSize: 23.0
              ),),),
          ),
        )],
      ),
    );
  }
}
