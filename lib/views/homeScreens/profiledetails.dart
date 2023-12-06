import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List? imgg = await pickImage(ImageSource.gallery);
    setState(() {
      _image = imgg;
    });
  }

  //String userName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.grey,
              )),
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    //width: double.infinity,
                    child: Column(
                      children: [
                        _image != null
                            ? Image(
                                image: MemoryImage(_image!),
                                width: 110.w,
                                height: 100.h,
                              )
                            : const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("assets/user.png"),
                              ),
                        TextButton(
                            onPressed: selectImage,
                            child: const Text(
                              "Change Profile Image",
                              style: TextStyle(
                                color: Color.fromRGBO(24, 119, 242, 1),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Profile Information",
                        style:
                            Theme.of(context).textTheme.headlineMedium!.apply(
                                  color: Colors.black,
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ProfileModel(
                    title: 'name',
                    value: "ahmedhany",
                  ),
                  ProfileModel(
                    title: 'Address',
                    value: "Mit elharoun",
                  ),

                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Personal Information",
                        style:
                            Theme.of(context).textTheme.headlineMedium!.apply(
                                  color: Colors.black,
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  // profile_model(onPRessed: () {  }, title: 'User ID', value: '111',iconn: Icons.copy,),

                  ProfileModel(
                    title: 'E-mail',
                    value: "ahmedhany@gmail.com",
                  ),
                  ProfileModel(
                    title: 'Phone Number',
                    value: "01009624550",
                  ),
                  ProfileModel(
                    title: 'Gender',
                    value: 'Male',
                  ),
                  ProfileModel(
                    title: 'Data of Birth',
                    value: '1 Jan,2002',
                  ),

                  const Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Close Account",
                          style: TextStyle(color: Colors.red),
                        )),
                  )
                ],
              )),
        ));
  }
}

// ignore: must_be_immutable
class ProfileModel extends StatefulWidget {
  ProfileModel({
    super.key,
    required this.title,
    required this.value,
    this.iconn = Icons.arrow_forward_ios,
  });
  String title, value;
  final IconData iconn;
//final VoidCallback onPRessed;

  @override
  State<ProfileModel> createState() => _ProfileModelState();
}

class _ProfileModelState extends State<ProfileModel> {
  String userName = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update ${widget.title}'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter your ${widget.title}',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                setState(() {
                  widget.value = _controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopup(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text("${widget.title} :",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ))),
            Expanded(
                flex: 5,
                child: Text(widget.value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ))),
            Expanded(
                child: Icon(
              widget.iconn,
              color: Colors.black,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No Images selected");
}
