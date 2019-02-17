import 'package:flutter/material.dart';
import 'bpjs.dart';
import 'credit.dart';
import 'paketData.dart';
import 'pulsa.dart';
import 'shopping.dart';
import 'tokenPLN.dart';

class Marketplace extends StatefulWidget {
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  List<Container> daftarSuperHero = new List();

  var karakter = [
    {"id": "1", "nama": "Pulsa", "gambar": "pulsa.png"},
    {"id": "2", "nama": "Paket Data", "gambar": "data.png"},
    {"id": "3", "nama": "Token PLN", "gambar": "token.jpg"},
    {"id": "4", "nama": "BPJS", "gambar": "bpjs.jpg"},
    {"id": "5", "nama": "Credit", "gambar": "credit.jpg"},
    {"id": "6", "nama": "Shopping", "gambar": "credit.jpg"},
    
  ];

  _buatList() async {
    for (var i = 0; i < karakter.length; i++) {
      final kara = karakter[i];
      final String gambar = kara['gambar'];
      daftarSuperHero.add(new Container(
        padding: new EdgeInsets.all(5),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: kara['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new DetailHero(
                                  id: kara['id'],
                                  nama: kara['nama'],
                                  gambar: kara['gambar'],
                                ))),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(5),
              ),
              new Text(
                kara['nama'],
                style: new TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _buatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class DetailHero extends StatelessWidget {
  final String id;
  final String nama;
  final String gambar;

  DetailHero({this.id, this.nama, this.gambar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("$nama", style: new TextStyle()),
        backgroundColor: Colors.green[600],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            // padding: new EdgeInsets.all(10),
            height: 240,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "img/$gambar",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(
            nama: nama,
          ),
          //  new BagianIcon(),
          new BagianKeterangan(
            id: id,
          ),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  final String nama;
  BagianNama({this.nama});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Text("Your Credit : ",
                    style: new TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.attach_money,
                size: 30,
                color: Colors.yellow,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new IconteTeks(
            icon: Icons.call,
            teks: "Call",
          ),
          new IconteTeks(
            icon: Icons.message,
            teks: "Message",
          ),
          new IconteTeks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconteTeks extends StatelessWidget {
  final IconData icon;
  final String teks;

  IconteTeks({this.icon, this.teks});

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  final String id;
  BagianKeterangan({this.id});

  @override
  Widget build(BuildContext context) {
    switch (id) {
      case "1":
        return Pulsa();
        break;
      case "2":
        return PaketData();
        break;
      case "3":
        return TokenPLN();
        break;
      case "4":
        return BPJS();
        break;
      case "5":
        return Credit();
        break;
      case "6":
        return Shopping();
        break;
    }
    /*return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata leta",
            style:new TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );*/
  }
}
