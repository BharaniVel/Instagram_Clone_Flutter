import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/firestorage_methods.dart';
import 'package:instagram_clone/responsivelayout/mobileview/addpost_options.dart';
import 'package:instagram_clone/utils/utils.dart';

class AddpostMobile extends StatefulWidget {
  const AddpostMobile({super.key});

  @override
  State<AddpostMobile> createState() => _AddpostMobileState();
}

class _AddpostMobileState extends State<AddpostMobile> {
  final TextEditingController _descrptioncontroller = TextEditingController();
  Uint8List? _file;
  @override
  void dispose() {
    _descrptioncontroller.dispose();
    super.dispose();
  }

  void postImage(
    String uid,
    String username,
  ) async {
    try {
      String res = await FireStorageMethods().uploadPost(
        _descrptioncontroller.text,
        _file!,
        username,
        uid,
      );
    } catch (e) {}
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  List<int>? bytes = await pickImage(ImageSource.camera);
                  if (bytes != null) {
                    setState(() {
                      _file = Uint8List.fromList(bytes);
                    });
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Upload from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  List<int>? bytes = await pickImage(ImageSource.gallery);
                  if (bytes != null) {
                    setState(() {
                      _file = Uint8List.fromList(bytes);
                    });
                  }
                },
              ),
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Exit'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Center(
            child: IconButton(
              onPressed: () => _selectImage(context),
              icon: const Icon(Icons.upload),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: appbarcolor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: const Text(
                'New post',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Post'),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 270,
                    width: 280,
                    margin: const EdgeInsets.only(
                      left: 0,
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(_file!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Container(
                      height: 150,
                      child: TextField(
                        controller: _descrptioncontroller,
                        decoration: const InputDecoration(
                          hintText: '       Write a caption or add a poll....',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                  const Addpostoptions(options: 'Tag People', icon: Icons.tag),
                  const Addpostoptions(
                      options: 'Add music', icon: Icons.music_note),
                  const Addpostoptions(
                    options: 'Add product details',
                    icon: Icons.shopping_bag,
                  ),
                  const Addpostoptions(
                      options: 'Add remainder', icon: Icons.calendar_month),
                  const Addpostoptions(
                      options: 'Add location', icon: Icons.map),
                  const Addpostoptions(
                      options: 'Boost Post', icon: Icons.move_up),
                  // Add more options here if needed
                  SizedBox(height: 20), // Add some space at the bottom
                ],
              ),
            ),
          );
  }
}
