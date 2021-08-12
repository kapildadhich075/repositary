import 'package:flutter/material.dart';
import 'package:opcamera/Screens/image_category.dart';
import 'package:opcamera/Screens/video_category.dart';
import 'package:photo_manager/photo_manager.dart';

class CategoriesOp extends StatefulWidget {
  const CategoriesOp();

  @override
  _CategoriesOpState createState() => _CategoriesOpState();
}

class _CategoriesOpState extends State<CategoriesOp> {
  createNewFolder(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Please enter the name of the new folder"),
            content: TextField(
              controller: myController,
            ),
            actions: [
              MaterialButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.of(context).pop(myController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final permitted = await PhotoManager.requestPermission();
                if (!permitted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ImageGallery()),
                );
              },
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final permitted = await PhotoManager.requestPermission();
                if (!permitted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => VideoGallery()),
                );
              },
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Video",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          createNewFolder(context);
        },
      ),
    );
  }
}
