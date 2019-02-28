import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Class for uni Icons with its color, Image directory and icon Label
class uniIcon {
  Color color;
  String imageDir;
  String iconLabel;

  uniIcon(Color color, String imageDir, String iconLabel) {
    this.color = color;
    this.imageDir = imageDir;
    this.iconLabel = iconLabel;
  }
}

class MyApp extends StatelessWidget {
  // Variable declarations
  static uniIcon univIndonesia = uniIcon(
      Colors.black, 'images/universitasIndonesia.png', 'Universitas Indonesia');
  static uniIcon univPelitaHarapan =
  uniIcon(Colors.black, 'images/uph.png', 'Universitas Pelita Harapan');
  static uniIcon univAtmaJaya =
  uniIcon(Colors.black, 'images/atma.gif', 'Unika Atma Jaya');
  static uniIcon instTeknologiBandung =
  uniIcon(Colors.black, 'images/itb.png', 'Institut Teknologi Bandung');
  static uniIcon univGadjahMada =
  uniIcon(Colors.black, 'images/ugm.png', 'Universitas Gadjah Mada');
  static uniIcon univTar =
  uniIcon(Colors.black, 'images/untar.png', 'Universitas Tarumanegara');

  // List of unis
  static List<uniIcon> uniList = [
    univIndonesia,
    univPelitaHarapan,
    univAtmaJaya,
    instTeknologiBandung,
    univGadjahMada,
    univTar
  ];

  // titleSection for the top part of the page
  Widget titleSection = Container(
      color: Colors.black12,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
            child: Text('Unifirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.blueAccent))),
        Container(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: Text(
                'Click on the school icons to add '
                    'their merchandises to your feed!',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 14, color: Colors.blueGrey)))
      ]));

  // Helper method to build icons with the corresponding color, image and string labels
  static Expanded _buildIcons(uniIcon icon) {
    return Expanded(
        child: (Container(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(children: [
              Image.asset(icon.imageDir,
                  scale: 1, height: 100, fit: BoxFit.fill),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  icon.iconLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: icon.color,
                  ),
                ),
              ),
            ]))));
  }

  /*
   Helper method to generate the rows and columns containers for the body icons feed dynamically
   2 icons per row. If the icon number is greater than 2 put it in the next row and so on
  */
//  static Column _buildBodyContainer(List<uniIcon> uniList){
//    return Column(
//      children: [
//        Row(
//          Ex
//        )
//      ]
//    );
//  }

  // bodySection for the scrollable icons feed
  Widget bodySection = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcons(uniList[0]),
          _buildIcons(uniList[1]),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcons(uniList[2]),
          _buildIcons(uniList[3]),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIcons(uniList[4]),
          _buildIcons(uniList[5]),
        ],
      )
    ],
  );

  // footerSection for the button at the bottom of the page
  Widget footerSection = Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: FractionallySizedBox(
        widthFactor: 0.8,
        child: RaisedButton(
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'Add to Feed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )),
  );

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo',
      home: Scaffold(
        body: ListView(
          children: [
            titleSection,
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[bodySection],
            ),
            footerSection,
          ],
        ),
      ),
    );
  }
}
