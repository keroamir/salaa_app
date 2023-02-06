import 'package:flutter/material.dart';
import 'package:salaa_app/constant.dart';

import 'view/screens/contentScreen.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  TextDirection? direction;

  CustomText(
      {required this.text,
       this.direction,
      this.align,
      required this.color,
      required this.size,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textDirection: direction,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget? leading;
  String? title;

  CustomAppBar({this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: leading,
      title: CustomText(
          text: title, color: black, weight: FontWeight.w600, size: 26),
      backgroundColor: white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomStack extends StatelessWidget {
  String? img;
  String? title;

  CustomStack({required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ContentScreen("$title");
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Image.asset(img!, width: MediaQuery.of(context).size.width),
            Positioned(
              child: CustomText(
                  direction: TextDirection.rtl,
                  text: title, size: 18, color: white, weight: FontWeight.w600),
              bottom: 20,
              right: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAzkarCard extends StatefulWidget {
  int count;
  String text;

  @override
  State<CustomAzkarCard> createState() => _CustomAzkarCardState();

  CustomAzkarCard({required this.count, required this.text});
}

class _CustomAzkarCardState extends State<CustomAzkarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if (widget.count > 0) {
            setState(() {
              widget.count--;
            });
          }
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                        text: "${widget.text}",
                        size: 16,
                        color: black,
                        weight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                          direction: TextDirection.rtl,
                          text: "${widget.count}",
                          color: white,
                          size: 14,
                          weight: FontWeight.w500,
                          align: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
