import 'package:flutter/material.dart';
import 'package:FitnessApp/models/Record.dart';
import 'package:FitnessApp/models/RecordList.dart';
import 'package:FitnessApp/models/RecordService.dart';
import 'package:FitnessApp/Sports menu/DetailsPage.dart';
import 'package:FitnessApp/helpers/Constants.dart';

import 'package:FitnessApp/poseRecognition/detection.dart';


class PoseListV2ForTest extends StatefulWidget {
  @override
  State<PoseListV2ForTest> createState() {
    return _PoseListV2ForTestState();
  }
}

class _PoseListV2ForTestState extends State<PoseListV2ForTest> {
  final TextEditingController _filter = new TextEditingController();
  RecordList _records = new RecordList(records: []);
  RecordList _filteredRecords = new RecordList(records: []);
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(appTitle);

  @override
  void initState() {
    super.initState();

    _records.records = [];
    _filteredRecords.records = [];

    _getRecords();
  }

  void _getRecords() async {
    RecordList records = await RecordService().loadRecords();
    setState(() {
      for (Record record in records.records) {
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildBar(context),
      backgroundColor: appDarkGreyColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: _banner(context), // 此頁面app bar
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              color: appGreyColor,
              alignment: Alignment.center,
              child: _buildList(context), // 建立card
            ),
          ),
        ],
      ),
      // resizeToAvoidBottomInset: false,
    );
  }

  Widget _banner(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: -10,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_return,
                    size: 20,
                  )),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: Text(
                '課表解說' 'XXXXXXXXXXXXXXXXX',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: appGreyColor,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 20,
              child: ElevatedButton(
                onPressed: null,
                child: Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      )
      //padding: EdgeInsets.all(20),
      //content: Text('課表介紹'),
      // leading: Icon(Icons.agriculture_outlined),
      // backgroundColor: appDarkGreyColor, //Color(0xFFE0E0E0)
      // actions: <Widget>[
      /*TextButton(
          onPressed: null,
          child: Text('OPEN'),
        ),
        TextButton(
          onPressed: null,
          child: Text('DISMISS'),
        ),
        */
    );
  }

  Widget _buildList(BuildContext context) { //建立Card
    if (!(_searchText.isEmpty)) {
      _filteredRecords.records = [];
      for (int i = 0; i < _records.records.length; i++) {
        if (_records.records[i].name
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            _records.records[i].context
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this
          ._filteredRecords
          .records
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child:CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(record.photo),
                  )
          ),
          title: Text(
            record.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: record.context,
                        style: TextStyle(color: Colors.white),
                      ),
                      maxLines: 3,
                      softWrap: true,
                    )
                  ]))
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Detection() ));
          },
        ),
      ),
    );
  }



/*
  void _resetRecords() {
    this._filteredRecords.records = [];
    for (Record record in _records.records) {
      this._filteredRecords.records.add(record);
    }
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            fillColor: Colors.white,
            hintText: 'Search by name',
            hintStyle: TextStyle(color: Colors.white),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(appTitle);
        _filter.clear();
      }
    });
  }*/
}
