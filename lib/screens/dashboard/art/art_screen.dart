import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_helper_funtions.dart';
import 'package:string_art/utils/custom_appbar.dart';

enum ImageType { image }

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key});

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  File? _imageFile;
  String? storeImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: texts.art,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: FractionalOffset.centerLeft,
              child: InkWell(
                onTap: () => uploadImage(context, ImageType.image),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2, color: appColors.gradient1)),
                  child: Image.asset(
                    ConstantImage.gallery,
                    fit: BoxFit.fill,
                    scale: 9,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: appColors.gradient1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: ConstantImage.appLogo,
                          placeholder: (context, url) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              ConstantImage.appLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                          errorWidget: (context, url, error) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              ConstantImage.appLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Positioned(
                  right: 12,
                  bottom: 12,
                  child: InkWell(
                    onTap: () => uploadImage(context, ImageType.image),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent.shade100,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 22,
                        color: appColors.appWhite,
                      ),
                    ),
                  ),
                ),*/

  void uploadImage(BuildContext context, ImageType imageType) {
    Future<void> Function({required ImageSource src}) imagePickerFunction;

    switch (imageType) {
      case ImageType.image:
        imagePickerFunction = getImage;
        break;
    }

    AppHelperFunction().chooseImages(
      context: context,
      onCameraCLick: () => imagePickerFunction(src: ImageSource.camera),
      onGalleryCLick: () => imagePickerFunction(src: ImageSource.gallery),
    );
  }

  Future<void> getImage({required ImageSource src}) async {
    final value =
        await AppHelperFunction().pickImage(img: src, context: context);
    if (value != null) {
      setState(() {
        _imageFile = value;
      });
    } else {
      log("Exception on uploading file");
    }
  }
}
