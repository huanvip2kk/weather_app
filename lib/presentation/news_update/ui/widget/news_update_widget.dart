import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/model/news/news_model.dart';
import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../../common/widget/common_text_form_field.dart';
import '../../bloc/news_update_bloc.dart';

class NewsUpdateWidget extends StatefulWidget {
  const NewsUpdateWidget({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  _NewsUpdateWidgetState createState() => _NewsUpdateWidgetState();
}

class _NewsUpdateWidgetState extends State<NewsUpdateWidget> {
  late TextEditingController _titleController;

  late TextEditingController _contentController;

  late TextEditingController _briefController;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.newsModel.title);
    _briefController = TextEditingController(text: widget.newsModel.brief);
    _contentController = TextEditingController(text: widget.newsModel.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              ),
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
                        ? Image.network(
                            widget.newsModel.thumbnails,
                            width: 200.w,
                            height: 200.h,
                            fit: BoxFit.cover,
                          )
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
                    if (thumbnails != null) {
                      context.read<NewsUpdateBloc>().add(
                            NewsUpdatePressedEvent(
                              title: _titleController.text,
                              content: _contentController.text,
                              images: _images,
                              thumbnails: thumbnails!,
                              brief: _briefController.text,
                              uploadTime: widget.newsModel.uploadTime,
                              docID: widget.newsModel.docID,
                            ),
                          );
                      Navigator.pop(context);
                    } else {
                      context.read<NewsUpdateBloc>().add(
                            NewsUpdatePressedEvent(
                              title: _titleController.text,
                              content: _contentController.text,
                              images: _images,
                              brief: _briefController.text,
                              uploadTime: widget.newsModel.uploadTime,
                              thumbnailsLink: widget.newsModel.thumbnails,
                              docID: widget.newsModel.docID,
                            ),
                          );
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
