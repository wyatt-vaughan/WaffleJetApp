import 'package:flutter/material.dart';
import 'package:qc_collegeandcareer/Navigation/bottom_bar.dart';
import 'package:qc_collegeandcareer/appbar.dart';
import 'package:qc_collegeandcareer/color_pallet.dart';
import 'package:qc_collegeandcareer/create_events/create_event_screen.dart';
import 'package:qc_collegeandcareer/events/event_gridview.dart';

import 'package:qc_collegeandcareer/firebase.dart';
import 'package:qc_collegeandcareer/navigation_drawer.dart';
import 'package:qc_collegeandcareer/specific_post/specific_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        GradientBackground(color: colorAccentSecond),
        Scaffold(
          key: globalKey,
          drawer: drawer(context),
          backgroundColor: colorThird.withOpacity(.3),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Column(children: [
                      welcomeBanner(context),
                  
                      homeScreenSectionBuilder(context, "Events", "event"),
                      homeScreenSectionBuilder(context, "Service Projects", "service project")
                    ]),
                  ),
                ),
              ),
             BottomBar(),
            ]),
          ),
        ),
      ],
    );
  }
}

Widget welcomeBanner(BuildContext context) {
  double height = MediaQuery.of(context).size.height;

  return Container(
    height: height / 3,
    
    child: Center(
        child: Icon(
          
      Icons.kayaking,
      size: height / 3.2,
      color: colorFirst,
      shadows: [Shadow(color: Colors.black.withOpacity(.5), blurRadius: 20, offset: Offset(7,7))],
    )),
  );
}

Widget homeScreenSectionBuilder(BuildContext context, String label, String tag) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        Container(
          height: 65,
          width: double.infinity,
          
          decoration: BoxDecoration( 
            color: colorFourth,
            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.75),
                                  blurRadius: 15,
                                  offset: Offset(7, 7))
                            ],),
          child: Center(
              child: Text(
            label,
            style: styleTitle,
          )),
        ),
        Container(width: double.infinity,
        height: 7,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), color: colorMap[tag]),
        ),
        futureCardBuilder(context, tag)
      ],
    ),
  );
}

Widget futureCardBuilder(BuildContext context, String tag) {
  return FutureBuilder(
    future: getEventsByTag(tag),
    builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else if (snapshot.hasData) {
          List<Widget> widgetList = <Widget>[];

          for (var event in snapshot.data as List<Event>) {
            widgetList.add(eventCard(context, event));
          }

          return Wrap(
            children: widgetList,
          );
        }
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    }),
  );
}
