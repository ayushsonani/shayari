import 'package:exam/datas.dart';
import 'package:exam/second_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPages(),
  ));
}

class FirstPages extends StatefulWidget {
  const FirstPages({super.key});

  @override
  State<FirstPages> createState() => _FirstPagesState();
}

class _FirstPagesState extends State<FirstPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: data.shyri_typ.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchingToList(index);
                  },));
                  setState(() {});
                },
                leading: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${data.shyri_Image[index]}")))),
                title: Text("${data.shyri_typ[index]}",style: TextStyle(fontSize: 20)),
              ),
            );
          },
        ));
  }
}
