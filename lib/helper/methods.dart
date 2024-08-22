


import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> imagePickGalleryAndroid()async{
  File? file;
  XFile? xFile;

  xFile=await ImagePicker().pickImage(source: ImageSource.gallery);

  if(xFile!=null)
  {
    file=File(xFile.path);
  }

  return file!;


}