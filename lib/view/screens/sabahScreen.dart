import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salaa_app/constant.dart';

import '../../component.dart';

class SabahScreen extends StatefulWidget {
  const SabahScreen({Key? key}) : super(key: key);

  @override
  State<SabahScreen> createState() => _SabahScreenState();
}

class _SabahScreenState extends State<SabahScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "السبحة الإلكترونية"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  shadowColor: mainColor.withOpacity(0.5),
                  primary: mainColor,
                  padding: EdgeInsets.all(40),
                  shape: CircleBorder(),
                ),
                child: Center(
                  child: Column(
                    children: [
                      CustomText(
                          text: "$count",
                          color: white,
                          size: 82,
                          weight: FontWeight.w600),
                      CustomText(
                          text: "سبح",
                          color: darkGreen,
                          size: 18,
                          weight: FontWeight.w600)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: white,
                elevation: 10,
                padding: EdgeInsets.all(5),

              ),
              child: SvgPicture.asset("assets/icons/Resetico.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
