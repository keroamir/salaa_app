import 'package:flutter/material.dart';
import 'package:salaa_app/component.dart';
import 'package:salaa_app/constant.dart';

import '../../controller/azkar.dart';

class ContentScreen extends StatefulWidget {
  String mainTitle;

  ContentScreen(this.mainTitle);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: "${widget.mainTitle}",
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
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomAzkarCard(
                          count: snapshot.data[index].repeat,
                          text: "${snapshot.data[index].zekr}"),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
