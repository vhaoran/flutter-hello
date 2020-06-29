import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_image_crop/simple_image_crop.dart';

typedef FnGetFile = void Function(File file);

void getCropedFile(BuildContext context, {FnGetFile onGetFile}) {
  Navigator.push<String>(context,
      new MaterialPageRoute(builder: (BuildContext context) {
    return new ImageCropDemo(
      onGetFile: onGetFile,
    );
  }));
}

enum _sheetType { gallery, camera }

class ImageCropDemo extends StatefulWidget {
  ImageCropDemo({this.onGetFile});

  FnGetFile onGetFile;

  @override
  _ImageCropDemoState createState() => new _ImageCropDemoState();
}

class _ImageCropDemoState extends State<ImageCropDemo> {
  final cropKey = GlobalKey<ImgCropState>();

  Future getImage(type) async {
    var image = await ImagePicker.pickImage(
        source: type == _sheetType.gallery
            ? ImageSource.gallery
            : ImageSource.camera);
    if (image == null) return;
    Navigator.of(context).pop();

    //Navigator.of(context).pushNamed('crop_page', arguments: {'image': image});
    Navigator.push<String>(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return SimpleCropRoute(file: image, onGetFile: widget.onGetFile);
    }));
  }

  void _showActionSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min, // 设置最小的弹出
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text("相机拍照"),
                  onTap: () async {
                    getImage(_sheetType.camera);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text("相册选择"),
                  onTap: () async {
                    getImage(_sheetType.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select image'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showActionSheet,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SimpleCropRoute extends StatefulWidget {
  SimpleCropRoute({this.file, this.onGetFile});

  FnGetFile onGetFile;

  final File file;

  @override
  _SimpleCropRouteState createState() => _SimpleCropRouteState();
}

class _SimpleCropRouteState extends State<SimpleCropRoute> {
  final cropKey = GlobalKey<ImgCropState>();

  Future<Null> showImage(BuildContext context, File file) async {
    new FileImage(file)
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      print('-------------------------------------------$info');
    }));
    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                'Current screenshot：',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.1),
              ),
              content: Image.file(file));
        });
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '绽放及剪裁',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon:
                new Icon(Icons.navigate_before, color: Colors.black, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: ImgCrop(
            key: cropKey,

            chipRadius: 150,
            chipShape: 'rect',
            maximumScale: 2,
            //image: FileImage(args['image']),
            image: FileImage(widget.file),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final crop = cropKey.currentState;
            final croppedFile =
                await crop.cropCompleted(widget.file, pictureQuality: 600);
            if (widget.onGetFile != null) {
              widget.onGetFile(croppedFile);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else {
              showImage(context, croppedFile);
            }
          },
          tooltip: 'Increment',
          child: Text('Crop'),
        ));
  }
}
