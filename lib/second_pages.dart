import 'package:exam/tihird_pages.dart';
import 'package:flutter/material.dart';

import 'datas.dart';

class SearchingToList extends StatefulWidget {
  int inx;

  SearchingToList(this.inx);

  @override
  State<SearchingToList> createState() => _SearchingToListState();
}

class _SearchingToListState extends State<SearchingToList> {
  List l1 = [];
  String photos = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    photos = data.shyri_Image[widget.inx];

    switch (widget.inx) {
      case 0:
        {
          l1 = data.shubhkamna;
        }
      case 1:
        {
          l1 = data.dosti;
        }
      case 2:
        {
          l1 = data.moj;
        }
      case 3:
        {
          l1 = data.dosti;
        }
    }

    for (int i = 0; i < data.shyri_typ.length; i++) {
      if (i == widget.inx) {
        if (i == 0) {
          l1 = data.shubhkamna;
        }
        if (i == 1) {
          l1 = data.dosti;
        }
        if (i == 2) {
          l1 = data.moj;
        }
        if (i == 3) {
          l1 = data.bhgvan;
        }

        if (i == 4) {
          l1 = data.prem;
        }
        if (i == 5) {
          l1 = data.jivan;
        }

        if (i == 6) {
          l1 = data.mohabt;
        }

        if (i == 7) {
          l1 = data.yade;
        }
        if (i == 8) {
          l1 = data.any;
        }

        if (i == 9) {
          l1 = data.rajniti;
        }

        if (i == 10) {
          l1 = data.prem;
        }

        if (i == 11) {
          l1 = data.dard;
        }

        if (i == 12) {
          l1 = data.bevfa;
        }

        if (i == 13) {
          l1 = data.janmdin;
        }

        if (i == 14) {
          l1 = data.holi;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: l1.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThirdAndMainPages(l1,index);
                },));
                setState(() {

                });
              },
              title: Text("${l1[index]}"),
              leading: Image.asset("${photos}"),
            ),
          );
        },
      ),
    );
  }
}
