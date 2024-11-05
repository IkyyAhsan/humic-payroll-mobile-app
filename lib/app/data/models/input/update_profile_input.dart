import 'dart:io';

class UpdateProfileInput {
  String name;
  File? image;

  UpdateProfileInput({
    required this.name,
     this.image,
  });
}
