
import 'package:flutter/material.dart';

class ResultDetailWidget extends StatelessWidget {
  final String resultTitle;
  final String resultValue;
  const ResultDetailWidget({
    Key? key, required this.resultTitle, required this.resultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0),
              child: Text(
                resultTitle,
                style: TextStyle(
                    color: Color(0XFF907bd1), fontSize: 18.0),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 10.0),
          child: Expanded(
              child: Text(
                resultValue,
                style: TextStyle(fontSize: 18.0),
              )),
        )
      ],
    );
  }
}
