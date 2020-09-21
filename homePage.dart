import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: open ? 1 : 1,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
          child: Stack(
            children: [
              open ? _circle() : Container(),
              Center(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: open ? 0.0 : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('hola'),
                      MaterialButton(
                        color: Colors.teal,
                        onPressed: () {
                          if (!open) {
                            setState(() {
                              open = !open;
                            });
                          } else {
                            setState(() {
                              open = !open;
                            });
                          }
                          print(open);
                        },
                        child: Text(
                          'onPressed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circle() {
    final size = MediaQuery.of(context).size;
    print('abrio');
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 0.5),
        duration: Duration(seconds: 1),
        builder: (context, value, widget) {
          
         return Container(
            width: size.width,
            height: size.height,
            color: Colors.black26.withOpacity(value),
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 400.0),
                duration: Duration(seconds: 1),
                builder: (context, value, widget) {
                  if (value == 300) {
                    print(value);
                  } else {
                    print(value);
                  }
                  return SafeArea(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: value == 400 ? size.width : value,
                      height: value == 400 ? size.height : value,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: value == 400
                              ? BorderRadius.all(Radius.circular(20))
                              : BorderRadius.all(Radius.circular(100))),
                      child: value == 400
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) =>
                                              HomePage(),
                                          transitionsBuilder:
                                              (c, anim, a2, child) =>
                                                  FadeTransition(
                                                      opacity: anim,
                                                      child: child),
                                          transitionDuration:
                                              Duration(milliseconds: 2000),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            )
                          : Container(),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
