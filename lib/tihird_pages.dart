import 'dart:math';

import 'package:exam/datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fourth_pages.dart';

class ThirdAndMainPages extends StatefulWidget {
  List l2 = [];
  int inx2;

  ThirdAndMainPages(this.l2, this.inx2);

  @override
  State<ThirdAndMainPages> createState() => _ThirdAndMainPagesState();
}

class _ThirdAndMainPagesState extends State<ThirdAndMainPages> {
  PageController controller = PageController(initialPage: 2);
  var gcol = [Colors.red, Colors.red];

  Share_pre() async {


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Share.share("${widget.l2[widget.inx2]}");
              },
              icon: Icon(Icons.share)),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          itemCount: data.g_color.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {

                                gcol = data.g_color[index];


                                // SharedPreferences prefs = await SharedPreferences.getInstance();
                                // prefs.setInt("colorss", index);
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: data.g_color[index])),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.zoom_out_map)),
              Text(
                "${widget.inx2 + 1}/${widget.l2.length}",
                style: TextStyle(fontSize: 35),
              ),
              IconButton(
                  onPressed: () async {


                    int r = Random().nextInt(data.g_color.length);
                    gcol = data.g_color[r];
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    //
                    // prefs.setInt("colorss", r);

                    setState(() {});
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: widget.l2.length,
              onPageChanged: (value) {
                widget.inx2 = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(gradient: LinearGradient(colors: gcol)),
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.l2[index]}",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: "${widget.l2[widget.inx2]}"));
                  },
                  icon: Icon(Icons.copy)),
              IconButton(
                  onPressed: () {
                    if (widget.inx2 > 0) {
                      widget.inx2--;
                      controller.jumpToPage(widget.inx2);
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LastPageInApp(widget.l2, widget.inx2, gcol);
                      },
                    ));
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    if (widget.inx2 < widget.l2.length - 1) {
                      widget.inx2++;
                      controller.jumpToPage(widget.inx2);
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
              IconButton(
                  onPressed: () {
                    Share.share('${widget.l2[widget.inx2]}');
                    setState(() {});
                  },
                  icon: Icon(Icons.share))
            ],
          )
        ],
      ),
    );
  }
}
