import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: SpinKitChasingDots(color: Colors.white,size: 50.0,),
      ),
    );
  }
}
