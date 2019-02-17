import 'package:flutter/material.dart';
import 'package:myapps/marketplace/marketplace.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String gambar1 =
    "http://3.bp.blogspot.com/-ZrVqwYS0N2E/ViZIjeZnmII/AAAAAAAAxqc/4Ibb8kZVuBs/s1600/Pegawai%2BDesa%2BJangan%2BGaptek.jpg";
String gambar2 = "http://idrcorner.com/assets/nn/imgs/html.jpg";
String backup;

String nama1 = "Fajarudin Ramdani";
String nama2 = "Isna Yustika";
String backupNama;

String email1 = "fajarudin.ramdani@gmail.com";
String email2 = "isna@gmail.com";
String backupEmail;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home",style:new TextStyle()),
        backgroundColor: Colors.green[600],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/bg.jpg"), fit: BoxFit.cover),
              ),
              accountName: new Text(nama1,style:new TextStyle()),
              accountEmail: new Text(email1,style:new TextStyle()),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  /*  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            nama: nama1,
                            gambar: gambar1,
                          )));*/
                },
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () {},
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
            new ListTile(
              title: new Text("Profile",style:new TextStyle()),
              trailing: new Icon(Icons.settings),
              onTap: () {
                /*Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Settings()));*/
              },
            ),
            new ListTile(
                title: new Text("Logout",style:new TextStyle()),
                trailing: new Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
      body: new Container(child: new Marketplace()),
    );
  }
}

