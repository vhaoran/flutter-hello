import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

const url =
    "http://p.0755yicai.com/803b9dcd-b15c-4258-aecf-f3fa8175081a?e=1905816125&token=gEpp05gnISRQeLZ6d5GCnAryXSFDnMfl_G5iG5p5:NqjQIKHcWDGNBjifvMYFBTUff9c=";

class ImageViewPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
            ExtendedImage.network(
              url,
              // width: ScreenUtil.instance.setWidth(400),
              // height: ScreenUtil.instance.setWidth(400),
              fit: BoxFit.contain,
              cache: true,
              border: Border.all(color: Colors.red, width: 1.0),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },

              //cancelToken: cancellationToken,
            ),
          ],
        ));
  }
}
