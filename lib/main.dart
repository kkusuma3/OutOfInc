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

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout Demo',
        home: Scaffold(
            body: AddWidget(),
        )
    );
  }
}

class AddWidget extends StatefulWidget {
  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
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
  static bool _isSelected = false;

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


  // Helper method to build icons with the corresponding color, image and string labels
  List<GestureDetector> _buildIcons(List<uniIcon> iconList) {
    void _toggleIconSelect(int iconNumber) {
      setState(() {
        _isSelected = !_isSelected;
      });
    }

    return List.generate(iconList.length, (i) =>
        GestureDetector(
          onTap: (){
            _toggleIconSelect(i);
          },
          child: Container(
              decoration: BoxDecoration(
                  border:
                  (_isSelected ? Border.all(color: Colors.blue) : Border.all(color: Colors.white))
              ),
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Image.asset(iconList[i].imageDir,
                    scale: 1, height: 100, fit: BoxFit.fill),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    iconList[i].iconLabel,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: iconList[i].color,
                    ),
                  ),
                ),
              ])))
        );
  }

  Widget _buildBody() {
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildIcons(uniList),
    );
  }

  Widget titleSection = Container(
      color: Colors.black12,
      child: Column(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text('Unifirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.blueAccent))),
        Container(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 15),
            child: Text(
                'Click on the school icons to add '
                    'their merchandises to your feed!',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 14, color: Colors.blueGrey)))
      ]));

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
  @override
  Widget build(BuildContext context) {
    return ListView(
        children:[ titleSection,_buildBody(),footerSection]
      );
  }
}
