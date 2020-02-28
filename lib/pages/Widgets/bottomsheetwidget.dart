import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key key}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

  bool _isTap = false;
  IconData _iconDataButton = Icons.mic;
  Color _color = Colors.pinkAccent;

  SpeechRecognition _speechRecognition;


  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }

  @override
  Widget build( BuildContext context ) {

    Future speak() async {
      await flutterTts.setPitch(1);
      await flutterTts.setLanguage("ru-RU");
    }

    final GlobalKey<AnimatedListState> _listKey = GlobalKey();
    List<String> _data = [];

    void _insertSingleItem() {
      int insertIndex;
      if(_data.length > 0) {
        insertIndex = _data.length;
      }else{
        insertIndex = 0;
      }
      String item = "Item insert index + 1";
      _data.insert(insertIndex,item);
      _listKey.currentState.insertItem(insertIndex);
    }

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 60,
        padding: EdgeInsets.only(top: 5,right: 15,left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: 350,
          padding: EdgeInsets.only(top: 25,right: 150),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _data.length,
            itemBuilder: (context,index,animation) {
              return _buildItem(_data[index],animation,index);
            },
          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.amberAccent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_iconDataButton),
        onPressed: () {
          setState(()  {
            _isTap = true;
            _isTap ? _color = Colors.red : _color = Colors.pinkAccent;
            _isTap ? _iconDataButton = Icons.stop : _iconDataButton = Icons.mic;
          });
          _insertSingleItem();

          if (_isAvailable && !_isListening)
            _speechRecognition
                .listen(locale: "ru_RU")
                .then((result) => print('$result'));
          speak();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.keyboard),
                    iconSize: 35,
                    color: Colors.grey,
                    onPressed: () {
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildItem(String item,Animation animation,int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 5.0,
        child: ListTile(
          title: Text(resultText,style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  }
}



