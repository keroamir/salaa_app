import 'package:flutter/material.dart';
import 'package:salaa_app/component.dart';
import 'package:salaa_app/constant.dart';

import '../../controller/azkar.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "أذكار الصباح",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 25,
          color: black,
        ),
      ),
      body: FutureBuilder(
        future: AzkarApi.fetchAzkar(),
        builder: (context, snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
            itemCount: (snapshot.data as List).length ,
            itemBuilder: (BuildContext context, int index) {
              return CustomAzkarCard(
                  count: (snapshot.data as List)[index].repeat,
                  text:
                  "${(snapshot.data as List)[index].zekr}");
            },
          )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
