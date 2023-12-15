import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sllidable(),
  ));
}

class Sllidable extends StatefulWidget {
  const Sllidable({super.key});

  @override
  State<Sllidable> createState() => _SllidableState();
}

class _SllidableState extends State<Sllidable> {
  List temp =List.filled(15, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Slidable(
              closeOnScroll: true,
                startActionPane: ActionPane(dragDismissible: true,motion: StretchMotion(), children: [
                  SlidableAction(
                    backgroundColor: Colors.blue,
                    onPressed: (context) {},
                    icon: CupertinoIcons.add,
                  ),SlidableAction(
                    backgroundColor: Colors.deepPurple,
                    onPressed: (context) {},
                    icon: CupertinoIcons.antenna_radiowaves_left_right,
                  )
                ]),
                child: ListTile(
                  onTap: () {
                    setState(() {

                    });
                  },
                  leading: Text(
                    "${index + 1}",
                  ),
                ));
          },
        ),
      ),
    );
  }
}
