import 'package:flutter/material.dart';
import 'package:salaa_app/component.dart';
import 'package:salaa_app/constant.dart';

class AzkarScreen extends StatefulWidget {



  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "الأذكار"),
      body: ListView(
        children: [
          CustomStack(img: morning, title: "أذكار الصباح"),
          CustomStack(img: night, title: "أذكار المساء"),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: CustomText(
                direction: TextDirection.rtl,
                  text: "أذكار متنوعة",
                  size: 18,
                  color: black,
                  weight: FontWeight.w600,
                  align: TextAlign.right),
            ),
          ),
          CustomStack(img: midnight, title: "أذكار قيام الليل"),
          CustomStack(img: pray, title: "أذكار الصلاة"),
          CustomStack(img: bedtime, title: "أذكار النوم"),
          CustomStack(img: random, title: "أدعية متنوعة"),

        ],
      ),
    );
  }
}
