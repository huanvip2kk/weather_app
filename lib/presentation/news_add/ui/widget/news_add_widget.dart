import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../../common/widget/common_text_form_field.dart';
import '../../bloc/news_add_bloc.dart';

class NewsAddWidget extends StatefulWidget {
  const NewsAddWidget({
    Key? key,
  }) : super(key: key);

  @override
  _NewsAddWidgetState createState() => _NewsAddWidgetState();
}

class _NewsAddWidgetState extends State<NewsAddWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // final HtmlEditorController _contentController = HtmlEditorController();

  final TextEditingController _briefController = TextEditingController();

  final List<File> _images = [];

  final picker = ImagePicker();

  File? thumbnails;

  chooseImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _images.add(File(pickedFile!.path));
    });
  }

  chooseThumbnails() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      thumbnails = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fileName =
        thumbnails != null ? thumbnails!.path : S.current.noImageSelected;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextFormField(
              controller: _titleController,
              labelText: S.current.title,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommonTextFormField(
              controller: _briefController,
              labelText: S.current.brief,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 10.h,
            ),
            CommonTextFormField(
              controller: _contentController,
              labelText: S.current.content,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            // HtmlEditor(
            //   controller: _contentController,
            //   htmlEditorOptions: HtmlEditorOptions(
            //     hint: S.current.content,
            //   ),
            //   otherOptions: OtherOptions(
            //     height: 400.h,
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            Text('${S.current.chooseThumbnail}: '),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      chooseThumbnails();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  thumbnails == (null)
                      ? Text(fileName)
                      : Image.file(
                          thumbnails!,
                          width: 200.w,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 57,
              width: double.infinity,
              child: CommonElevatedButton(
                text: S.current.add,
                onPressed: () {
                  context.read<NewsAddBloc>().add(
                        NewsAddPressedEvent(
                          title: _titleController.text,
                          content: _contentController.text,
                          images: _images,
                          thumbnails: thumbnails!,
                          brief: _briefController.text,
                        ),
                      );
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
