import 'package:octopus/pages/fragments/first_fragment.dart';
import 'package:octopus/pages/fragments/second_fragment.dart';
import 'package:octopus/pages/fragments/third_fragment.dart';
import 'package:octopus/pages/fragments/four_fragment.dart';
import 'package:octopus/pages/fragments/five_fragment.dart';
import 'package:octopus/pages/fragments/six_fragment.dart';
import 'package:flutter/material.dart';
import 'package:octopus/pages/Widgets/bottomsheetwidget.dart';
import 'package:flutter_tts/flutter_tts.dart';


class DrawerItem {
  String title;
  IconData icon;
  IconData iconappbar;
  DrawerItem(this.title, this.icon, this.iconappbar,);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Главная", Icons.home,Icons.info,),
    new DrawerItem("Магазин", Icons.shop,Icons.shopping_cart,),
    new DrawerItem("Достижения", Icons.card_giftcard,Icons.assignment_turned_in,),
    new DrawerItem("Настройки", Icons.settings,null,),
    new DrawerItem("Техподдержка", Icons.message,Icons.info,),
    new DrawerItem("Профиль", Icons.info,null,)
  ];




  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}


class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;



  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      case 3:
        return new FourFragment();
      case 4:
        return new FiveFragment();
      case 5:
        return new SixFragment();
      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ),
      );
       Scaffold(
        appBar: AppBar(
          actions: <Widget>[
                    new IconButton(icon: Icon(d.iconappbar), onPressed: () {})
          ],
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        actions: <Widget>[
                new IconButton(icon: Icon(widget.drawerItems[_selectedDrawerIndex].iconappbar), onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Saburchik Ogyrchik"), accountEmail: null, currentAccountPicture: null,),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      floatingActionButton: MyFloatingButton()
    );
  }
}

class MyFloatingButton extends StatefulWidget {
  MyFloatingButton({Key key}) : super(key: key);
  @override
  _MyFloatingActionButton createState() => _MyFloatingActionButton();
}

class _MyFloatingActionButton extends State<MyFloatingButton> {
  Color _color = Colors.blue;
  IconData _iconData = Icons.menu;
  bool _show = true;
  bool _isTap = false;

  TextFormField text;

  String resultText = "";

  final FlutterTts flutterTts = FlutterTts();

  Future speak() async {
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("ru-RU");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _show
        ? FloatingActionButton(
      backgroundColor: _color,
      child: Icon(_iconData,color: Colors.white,),
      onPressed: ()  {
        var sheetController = showBottomSheet(
          context: context,
          builder: (context) => BottomSheetWidget());


        setState(() {
          _isTap = true;
          _isTap ? _iconData = Icons.close : _iconData = Icons.menu;
          _isTap ? _color = Colors.red : _color = Colors.blue;
        });

        _showButton(true);

        sheetController.closed.then((value) {
          _showButton(true);
          _iconData = Icons.menu;
          _color = Colors.blue;
        });
        flutterTts.speak("Привет,меня зовут Спрутоняшка!");
      },
      ) : Container();
  }
  void _showButton(bool value) {
    setState(() {
      _show = value;
    });
  }
}
