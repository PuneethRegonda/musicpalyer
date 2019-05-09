import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';

void main(){
  runApp(
      MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blueGrey,
    ),
        home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return FileReaderExample(storage: Storage(),);

  }

}

class FileReaderExample extends StatefulWidget {

  final Storage storage ;






  const FileReaderExample({Key key, @required this.storage}) : super(key: key);

  @override
  _FileReaderExampleState createState() => _FileReaderExampleState();
}

class _FileReaderExampleState extends State<FileReaderExample> {

  TextEditingController controller=TextEditingController();
  TextEditingController pathCont=TextEditingController();
  String state;
  Future<Directory> _appDocDir;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String data){
      setState(() {
        state = data;
      });
    });
  }

  Future<File> wirteData() async {
    String t = await  widget.storage.readData();
    setState(() {

      state= controller.text;
      controller.text='';
    });


   return widget.storage.writeData(state);
  }

  void getDir() async{
    setState(() {

      _appDocDir = getApplicationDocumentsDirectory();


    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pathCont,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${state??"File is empty"}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Colors.transparent,

                onPressed: wirteData,
//
// onPressed: (){
//                   widget.storage.writeData(controller.text);
//                   controller.text='';
//                },
              child: Text("Click to save the data To File "),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Get Directory "),
                  onPressed:  getDir,
              ),
            ),

            FutureBuilder(

                future: _appDocDir,

                builder: (BuildContext context, AsyncSnapshot<Directory> snapshot){
                  Text text= Text("");

                  if(snapshot.connectionState==ConnectionState.done){
                    if(snapshot.hasError){
                      text = Text("Error: ${snapshot.error}");
                    }
                   else if(snapshot.hasData){

                       pathCont.text=snapshot.data.path;

                     text= Text("Text PAth :\n ${snapshot.data.path}");
                    }
                    else{
                      text= Text("Unavailable ");
                    }
                  }

                  return  text;
                },

                ),



          ],
        ),
      ),
    );
  }
}

class Storage {

  Future<String> get localpath async{


    ///Temporary directory: A temporary directory (cache) that the system can clear at any time.
    /// On iOS, this corresponds to the value that [NSTemporaryDirectory] returns.
    /// On Android, this is the value that [getCacheDir()] returns.
    ///
    ///Documents directory: A directory for the app to store files that only it can access.
    ///The system clears the directory only when the app is deleted.
    /// On iOS, this corresponds to [NSDocumentDirectory].
    /// On Android, this is the [AppData] directory.

    final  dir = await getApplicationDocumentsDirectory();

    return dir.path;

  }

  Future<File> get  localfile async {

//    final path= await localpath;

    return File('/0/Folder1/sampletextFile.txt');

  }

  Future<String> readData() async {

    try{

      final  file = await localfile;

      String data= await file.readAsString();

      return data;
    }

    catch(e){

      return e.toString();
    }
  }

  Future<File> writeData(String data) async
  {
//    final file = await localfile;


    final  file = await localfile;

//    String data= await file.readAsString();


    return file.writeAsString("$data");

  }

}