import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

    _containerAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _containerAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Screen'),
         backgroundColor: Colors.black12,
         actions: <Widget>[
           IconButton(icon: Icon(Icons.person), onPressed: null)
         ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedBuilder(
              animation: _containerAnimationController,
              builder: (context, index) {
                return Container(
                  width: 500,
                  height: 665,
                  margin:EdgeInsets.all(20),
                  child: Text("WELCOME USER!",
              style: TextStyle(
                fontSize: 30,
              
              ),),
                  decoration: BoxDecoration(
                      borderRadius: _containerRadiusAnimation.value,
                      color: _containerColorAnimation.value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}