import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:codeland/AppTheme/app_color.dart';
import 'package:codeland/main.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class UploadImgScreen extends StatefulWidget {
  const UploadImgScreen({super.key});

  @override
  State<UploadImgScreen> createState() => _UploadImgScreenState();
}

class _UploadImgScreenState extends State<UploadImgScreen> {
  File? _image;
  final picker = ImagePicker();
  String? fileName;

  Future getImageFromCamera() async {
    final pickerImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickerImage != null) {
        _image = File(pickerImage.path);
        fileName = pickerImage.name.substring(pickerImage.name.length - 10);
        print(_image);
      } else {
        print('no images seleted');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickerImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickerImage != null) {
        fileName = pickerImage.name.substring(pickerImage.name.length - 10);
        _image = File(pickerImage.path);
      } else {
        print('no images seleted');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: mq.height * 1,
        width: mq.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Upload  a  Image',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 23),
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [10, 13, 12, 13],
              radius: Radius.circular(12),
              child: InkWell(
                onTap: () {
                  ShowBottomSheet();
                },
                child: Container(
                    height: mq.height * .6,
                    width: mq.width * .8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 100,
                          color: AppColor().darkgrey,
                        ),
                        _image != null
                            ? Text(fileName.toString())
                            : Text('Tap to Select image')
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Upload Button
                SizedBox(
                  width: mq.width * 0.3,
                  child: ElevatedButton(
                      onPressed: () {
                        Flushbar(
                          message: 'Image Uploaded Successfully',
                          duration: Duration(seconds: 3),
                          flushbarPosition: FlushbarPosition.TOP,
                          messageColor: AppColor().white,
                          backgroundColor: AppColor().black,
                        )..show(context);

                        _image = null;
                        fileName = null;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor().orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColor().white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                ),

                // View Button
                SizedBox(
                  width: mq.width * 0.3,
                  child: ElevatedButton(
                      onPressed: () {
                        ShowAlertDialouge();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor().grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'View',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColor().black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // ModalBottom Sheet
  void ShowBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: mq.height * .3,
            child: Column(
              children: [
                SizedBox(
                  height: mq.height * .05,
                ),
                const Text(
                  'Upload Image from',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: mq.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        getImageFromCamera();
                      },
                      child: Container(
                        height: mq.width * .25,
                        width: mq.width * .25,
                        decoration: BoxDecoration(
                            color: AppColor().grey,
                            borderRadius:
                                BorderRadius.circular(mq.width * .125)),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getImageFromGallery();
                      },
                      child: Container(
                        height: mq.width * .25,
                        width: mq.width * .25,
                        decoration: BoxDecoration(
                            color: AppColor().grey,
                            borderRadius:
                                BorderRadius.circular(mq.width * .125)),
                        child: Icon(
                          Icons.image,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  // View Image
  void ShowAlertDialouge() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content:
                _image != null ? Image.file(_image!) : Text('No Image to show'),
          );
        });
  }
}
