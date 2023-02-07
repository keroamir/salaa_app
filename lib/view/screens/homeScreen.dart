import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:salaa_app/component.dart';
import 'package:salaa_app/constant.dart';
import 'package:salaa_app/controller/timeprayer.dart';

import 'package:salaa_app/dateAndLocation.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateAndLocation _dateAndLocation = DateAndLocation();
  Position? userLocation;
  String? cityState;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    userLocation = await _dateAndLocation.getUserLocation();
    cityState = userLocation!.latitude.toString() + ", " + userLocation!.longitude.toString();



  }


  @override
  Widget build(BuildContext context) {



    var date = _dateAndLocation.getCurrentDateInArabic();

     var hijriCalendar = HijriCalendar.now();
     var today = hijriCalendar.fullDate();


    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                    text: date,
                    color: black,
                    size: 18,
                    weight: FontWeight.w600),
                CustomText(
                    text: today,
                    color: mainColor,
                    size: 14,
                    weight: FontWeight.w500),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: mainColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: cityState,
                            color: white,
                            size: 14,
                            weight: FontWeight.w500),
                        const Icon(
                          Icons.location_on_sharp,
                          color: white,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "متبقي على",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                                text: "دقيقة",
                                color: white,
                                size: 14,
                                weight: FontWeight.w500),
                            CustomText(
                                text: "15:20",
                                color: white,
                                size: 34,
                                weight: FontWeight.w600),
                          ],
                        ),
                        CustomText(
                            text: "صلاة الظهر",
                            color: white,
                            size: 34,
                            weight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: FutureBuilder(
                future: TimePrayer.getTimePrayer(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData) ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                child: CustomText(
                                    text: "مواعيد الصلاة",
                                    color: white,
                                    size: 18,
                                    weight: FontWeight.w600),
                              ),
                              SvgPicture.asset("assets/icons/mosque.svg")
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.fajr}",
                                color: sala,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "الفجر",
                                color: sala,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.shurooq}",
                                color: sala,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "الشروق",
                                color: sala,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.dhuhr}",
                                color: mainColor,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "الظهر",
                                color: mainColor,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.asr}",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "العصر",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.maghrib}",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "المغرب",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${snapshot.data.isha}",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                            CustomText(
                                text: "العشاء",
                                color: black,
                                size: 16,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                    ],
                  ) : Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: 15),
            Card(
              color: white,
              elevation: 5,
              child: Column(

                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomText(
                        text: 'دعاء اليوم',
                        size: 14,
                        color: mainColor,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomText(
                        align: TextAlign.right,
                        text:
                        '(اللَّهُمَّ إنِّي أعُوذُ بكَ مِنَ الهَمِّ والحَزَنِ، والعَجْزِ والكَسَلِ، والبُخْلِ، والجُبْنِ، وضَلَعِ الدَّيْنِ، وغَلَبَةِ الرِّجالِ)',
                        size: 18,
                        color: black,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
