import 'package:flutter/material.dart';
import 'package:testflutter/loginAnimation.dart';
import './ComputerPage.dart' as ComputerPage;
import './HeadsetPage.dart' as HeadsetPage;
import './RadioPage.dart' as RadioPage;
import './SmarrtphonePage.dart' as SmartphonePage;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './detail.dart';
import './Settings.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    title: "Learning Flutter",
//    home: new ListViewJsonData(data: new List<String>.generate(300,(i)=>"ini data ke $i" ),),

    home: new LoginPage(),
    theme: buildTheme(),
    routes: <String, WidgetBuilder>{
      '/NavigationAndRoute': (BuildContext context) => new NavigationAndRoute(),
      '/SpeakerPage': (BuildContext context) => new SpeakerPage(),
    },
  ));
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.white,
  );
}

//##################################################################
//membuat hello world
class HalHallo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new Text("Hallo World"),
    ));
  }
}

//##############################################################################
//membuat style, text dan icon
class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new Container(
      color: Colors.blue[900],
      width: 200,
      height: 100,
      child: new Center(
        //text style
        /* child: new Text(
                "Fajarudin Ramdani",
                style: new TextStyle(
                    color: Colors.white, fontFamily: "serif", fontSize: 20),
              ),*/

        //icon style
        child: new Icon(
          Icons.android,
          color: Colors.white,
          size: 20,
        ),
      ),
    )));
  }
}

//###############################################################################################
//membuat application bar
class ApplicationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: new AppBar(
          backgroundColor: Colors.red,
          leading: Icon(Icons.home),
          title: new Center(
            child: new Text("Learning Flutter"),
          ),
          actions: <Widget>[new Icon(Icons.search)],
        ));
  }
}

//##############################################################################################
//mengatur row dan column
class RowAndColumn extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: new AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.home),
        title: new Center(
          child: new Text("Learning Flutter"),
        ),
        actions: <Widget>[new Icon(Icons.search)],
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          new Icon(
            Icons.local_pizza,
            size: 70,
            color: Colors.black87,
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.donut_large,
                size: 70,
                color: Colors.black87,
              ),
              new Icon(
                Icons.donut_large,
                size: 70,
                color: Colors.black87,
              ),
              new Icon(
                Icons.donut_large,
                size: 70,
                color: Colors.black87,
              ),
            ],
          ),
          new Icon(
            Icons.cake,
            size: 70,
            color: Colors.black87,
          ),
        ],
      )),
    );
  }
}

//###################################################################################################
//membuat card dan parsing data
class CardAndParsing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card & Parsing"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new CardMenu(
              icon: Icons.home,
              homeTeks: "Home",
              colorIcon: Colors.brown,
            ),
            new CardMenu(
              icon: Icons.favorite,
              homeTeks: "Favorite",
              colorIcon: Colors.brown,
            ),
            new CardMenu(
              icon: Icons.place,
              homeTeks: "Place",
              colorIcon: Colors.brown,
            ),
            new CardMenu(
              icon: Icons.settings,
              homeTeks: "Settings",
              colorIcon: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}

//class card untuk dipanggil di class Card&Parsing
class CardMenu extends StatelessWidget {
  CardMenu({this.icon, this.homeTeks, this.colorIcon});

  final IconData icon;
  final String homeTeks;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Card(
      child: new Column(
        children: <Widget>[
          new Icon(icon, size: 50, color: colorIcon),
          new Text(
            homeTeks,
            style: new TextStyle(fontSize: 20),
          )
        ],
      ),
    ));
  }
}
//#######################################################################################

//membuat navidation & route
class NavigationAndRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Music"),
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(
            Icons.headset,
            size: 50,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/SpeakerPage');
          },
        ),
      ),
    );
  }
}

class SpeakerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Speaker"),
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(
            Icons.speaker,
            size: 50,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/NavigationAndRoute');
          },
        ),
      ),
    );
  }
}

//##################################################
//Tab Bar

class MakeTabBar extends StatefulWidget {
  @override
  _MakeTabBarState createState() => _MakeTabBarState();
}

class _MakeTabBarState extends State<MakeTabBar>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
              text: "Computer",
            ),
            new Tab(icon: new Icon(Icons.headset), text: "Headset"),
            new Tab(icon: new Icon(Icons.radio), text: "Radio"),
            new Tab(icon: new Icon(Icons.smartphone), text: "Smartphone"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new ComputerPage.ComputerPage(),
          new HeadsetPage.HeadsetPage(),
          new RadioPage.RadioPage(),
          new SmartphonePage.SmartphonePage()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
                icon: new Icon(
              Icons.computer,
            )),
            new Tab(
                icon: new Icon(
              Icons.headset,
            )),
            new Tab(
                icon: new Icon(
              Icons.radio,
            )),
            new Tab(
                icon: new Icon(
              Icons.smartphone,
            )),
          ],
        ),
      ),
    );
  }
}

//#########################################
//membuat list view
class MakeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black12,
        title: new Text("Daftar Barang"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListBarang(
            ikon: Icons.speaker,
            judul: "SPEAKER",
          ),
          new ListBarang(
            ikon: Icons.tv,
            judul: "TELEVISI",
          ),
          new ListBarang(
            ikon: Icons.smartphone,
            judul: "SMARTPHONE",
          )
        ],
      ),
    );
  }
}

class ListBarang extends StatelessWidget {
  ListBarang({this.ikon, this.judul});

  final IconData ikon;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(20),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Icon(
              ikon,
              size: 200,
            ),
            new Text(
              judul,
              style: new TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
//##############################################################

//List View data dari array dan JSON
class ListViewArray extends StatelessWidget {
  final List<String> data;
  ListViewArray({this.data});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List View JSON Data"),
      ),
      body: new Container(
        child: new ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return new ListTile(
                leading: new Icon(Icons.widgets),
                title: new Text("${data[index]}"),
              );
            }),
      ),
    );
  }
}

class ListViewJsonData extends StatefulWidget {
  @override
  _ListViewJsonDataState createState() => _ListViewJsonDataState();
}

class _ListViewJsonDataState extends State<ListViewJsonData> {
  List dataJson;

  Future<String> getData() async {
    http.Response result = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJson = json.decode(result.body);
    });
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Icon(Icons.weekend),
        title: new Text("List View JSON Data"),
      ),
      body: new ListView.builder(
        itemCount: dataJson == null ? 0 : dataJson.length,
        itemBuilder: (context, index) {
          return new Container(
              padding: new EdgeInsets.all(20),
              child: new Card(
                  child: new Container(
                      child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    dataJson[index]['title'],
                    style: new TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  new Text(
                    dataJson[index]['body'],
                    style: new TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ))));
        },
      ),
    );
  }
}
//#####################################################

//###################################################################
//input text,alertd dialog & snackbar

class TextAlertSnack extends StatefulWidget {
  @override
  _TextAlertSnackState createState() => _TextAlertSnackState();
}

class _TextAlertSnackState extends State<TextAlertSnack> {
  String teks = "";
  String alert = "";
  TextEditingController controllerInput = new TextEditingController();
  TextEditingController controllerAlert = new TextEditingController();
  TextEditingController controllerSnack = new TextEditingController();

  void _alertDialog(String str) {
    if (str.isEmpty) return;
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
        str,
        style: new TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.purple,
          child: new Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  void _snackbar(String str) {
    if (str.isEmpty) return;
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text(
        str,
        style: new TextStyle(fontSize: 20),
      ),
      duration: new Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      appBar: new AppBar(
        title: new Text("Input text, alert dialog & snackbar"),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: controllerInput,
            decoration: new InputDecoration(hintText: "Tulis di sini"),
            onSubmitted: (String str) {
              setState(() {
                teks = str;
                controllerInput.text = "";
              });
            },
          ),
          new Text(teks, style: new TextStyle(fontSize: 20)),
          new TextField(
            controller: controllerAlert,
            decoration: new InputDecoration(hintText: "Tulis untuk alert"),
            onSubmitted: (String str) {
              _alertDialog(str);
              controllerAlert.text = "";
            },
          ),
          new TextField(
            controller: controllerSnack,
            decoration: new InputDecoration(hintText: "Tulis untuk Snackbar"),
            onSubmitted: (String str) {
              _snackbar(str);
              controllerSnack.text = "";
            },
          ),
        ],
      ),
    );
  }
}

//######################################
//SIDEBAR
class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

String gambar1 = "http://idrcorner.com/images/icon/gw.jpg";
String gambar2 = "http://idrcorner.com/assets/nn/imgs/html.jpg";
String backup;

String nama1 = "Fajarudin Ramdani";
String nama2 = "Isna Yustika";
String backupNama;

String email1 = "fajarudin.ramdani@gmail.com";
String email2 = "isna@gmail.com";
String backupEmail;

class _SideBarState extends State<SideBar> {
  void changeUser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupNama = nama1;
      nama1 = nama2;
      nama2 = backupNama;

      backupEmail = email1;
      email1 = email2;
      email2 = backupEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Sidebar"),
        backgroundColor: Colors.red,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                color: Colors.red,
              ),
              accountName: new Text(nama1),
              accountEmail: new Text(email1),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            nama: nama1,
                            gambar: gambar1,
                          )));
                },
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => changeUser(),
                  child: new CircleAvatar(
                    backgroundImage: NetworkImage(gambar2),
                  ),
                )
              ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Settings()));
              },
            ),
            new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
      body: new Container(),
    );
  }
}
//###################################

class HeroGrid extends StatefulWidget {
  @override
  _HeroGridState createState() => _HeroGridState();
}

class _HeroGridState extends State<HeroGrid> {
  List<Container> daftarSuperHero = new List();

  var karakter = [
    {"nama": "aquaman", "gambar": "Koala.jpg"},
    {"nama": "Batman", "gambar": "Penguins.jpg"},
    {"nama": "Captain America", "gambar": "Koala.jpg"},
    {"nama": "Catwoman", "gambar": "Penguins.jpg"},
    {"nama": "Flash", "gambar": "Koala.jpg"},
    {"nama": "Hulk", "gambar": "Penguins.jpg"},
    {"nama": "Ironman", "gambar": "Koala.jpg"},
    {"nama": "Spiderman", "gambar": "Penguins.jpg"},
    {"nama": "Venom", "gambar": "Koala.jpg"},
    {"nama": "Superman", "gambar": "Penguins.jpg"},
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
      appBar: new AppBar(
        title: new Text(
          "Super Hero",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class DetailHero extends StatelessWidget {
  final String nama;
  final String gambar;

  DetailHero({this.nama, this.gambar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("$nama"),
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
          new BagianIcon(),
          new BagianKeterangan(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(nama,
                    style: new TextStyle(fontSize: 20, color: Colors.blue)),
                new Text("$nama\@gmail.com",
                    style: new TextStyle(fontSize: 17, color: Colors.grey))
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata leta",
            style: new TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
//##############################################

//membuat form
class Formulir extends StatefulWidget {
  @override
  _FormulirState createState() => _FormulirState();
}

class _FormulirState extends State<Formulir> {
  List<String> agama = ["Islam", "Katolik", "Protestan", "Hindu", "Budha"];
  String agamaDefault = "Islam";
  String jk;
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void pilihJk(String value) {
    setState(() {
      jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      agamaDefault = value;
    });
  }

  void kirimData() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Password : ${controllerPass.text}"),
            new Text("Alamat : ${controllerMoto.text}"),
            new Text("Jenis Kelamin : $jk"),
            new Text("Agama : $agamaDefault"),
            new RaisedButton(
                child: new Text("OK"),
                color: Colors.teal,
                onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Icon(Icons.list),
        title: new Text("Registration"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new TextField(
                  maxLines: 3,
                  controller: controllerMoto,
                  decoration: new InputDecoration(
                      hintText: "Alamat",
                      labelText: "Alamat",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20))),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new RadioListTile(
                  value: "Laki-Laki",
                  title: new Text("Laki-laki"),
                  groupValue: jk,
                  onChanged: (String value) {
                    pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Pilih ini jika anda perempuan"),
                ),
                new RadioListTile(
                  value: "Perempuan",
                  title: new Text("Perempuan"),
                  groupValue: jk,
                  onChanged: (String value) {
                    pilihJk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: new Text("Pilih ini jika anda perempuan"),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                Row(
                  children: <Widget>[
                    new Text(
                      "Agama   ",
                      style: new TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                    new DropdownButton(
                      onChanged: (String value) {
                        pilihAgama(value);
                      },
                      value: agamaDefault,
                      items: agama.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.teal,
                  onPressed: () {
                    kirimData();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//###########################

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var statusKlik = 0;
  TextEditingController editingControllerUsername;
  TextEditingController editingControllerPassword;
  AnimationController animationControllerButton;

  @override
  void initState() {
    editingControllerUsername = new TextEditingController(text: '');
    editingControllerPassword = new TextEditingController(text: '');
    super.initState();
    animationControllerButton =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                statusKlik = 0;
              });
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/bg.jpg"), fit: BoxFit.cover),

                ),

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromARGB(162, 146, 199, 1),
                Color.fromARGB(51, 51, 63, 1),
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 270)),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            TextField(
                              controller: editingControllerUsername,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            TextField(
                              controller: editingControllerPassword,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                            FlatButton(
                              padding: EdgeInsets.only(top: 220, bottom: 30),
                              onPressed: null,
                              child: Text(
                                "Don't have an account ? Sign Up here",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  statusKlik == 0
                      ? new InkWell(
                          onTap: () {
                            setState(() {
                              statusKlik = 1;
                            });
                            _playAnimation();
                          },
                          child: new SignIn(),
                        )
                      : new StartAnimation(
                          buttonController: animationControllerButton.view,
                          user: editingControllerUsername.text,
                          password: editingControllerPassword.text,
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Container(
          alignment: Alignment.center,
          width: 320,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Text("Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5))),
    );
  }
}
