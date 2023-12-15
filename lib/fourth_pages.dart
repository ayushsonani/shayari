import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class LastPageInApp extends StatefulWidget {
  List l3 = [];
  int inx3;
  var gcol2;

  LastPageInApp(this.l3, this.inx3, this.gcol2);

  @override
  State<LastPageInApp> createState() => _LastPageInAppState();
}

class _LastPageInAppState extends State<LastPageInApp> {
  int t_size = 25;

  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();

// to save image bytes of widget
  Uint8List? bytes;

  get_per() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      // print(statuses[Permission.location]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetsToImage(
            controller: controller,
            child: Container(
              width: double.infinity,
              height: 350,
              decoration:
                  BoxDecoration(gradient: LinearGradient(colors: widget.gcol2)),
              alignment: Alignment.center,
              child: Text(
                "${widget.l3[widget.inx3]}",
                style: TextStyle(fontSize: t_size.toDouble()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async {
                    get_per();

                    setState(() {});

                    final bytes = await controller.capture();

                    var path =
                        await ExternalPath.getExternalStoragePublicDirectory(
                                ExternalPath.DIRECTORY_DOWNLOADS) +
                            "/Dell_shayari_app";

                    Directory dir = Directory(path);

                    if (!await dir.exists()) {
                      dir.create();
                    }

                    int r = Random().nextInt(10000);
                    String Image_name = "DellImage${r}.jpg";

                    File f = File("${dir.path}/${Image_name}");
                    f.writeAsBytes(bytes!);

                    Share.shareFiles(['${f.path}'], text: 'Dell shayari app ');

                    setState(() {});
                  },
                  icon: Icon(Icons.share)),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState1) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              child: Slider(
                                max: 100,
                                min: 1,
                                value: t_size.toDouble(),
                                onChanged: (value) {
                                  t_size = value.toInt();
                                  setState(() {});
                                  setState1(() {});
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.format_size))
            ],
          )
        ],
      ),
    );
  }
}
