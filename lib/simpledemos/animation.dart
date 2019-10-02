import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class Demo6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Animation"),
          ),
          body: DraggableCard(
              child: FlutterLogo(
                size: 128,
              )
          )
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {

  final Widget child;

  DraggableCard({this.child});

  @override
  State<StatefulWidget> createState() {
    return DraggableCardState();
  }
}

class DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Alignment dragAlignment = Alignment.center;
  Animation<Alignment> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.addListener((){
      setState(() {
        dragAlignment = animation.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onPanDown: (details) {
        animationController.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          dragAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2)
          );
        });
      },
      onPanEnd: (details) {
        runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }

  void runAnimation(Offset pixelsPerSecond, Size size){
    animation = animationController.drive(
      AlignmentTween(
        begin: dragAlignment,
        end: Alignment.center
      )
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1
    );

    final Simulation springSimulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    animationController.animateWith(springSimulation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}