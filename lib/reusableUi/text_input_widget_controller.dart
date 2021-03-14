import 'package:flutter/cupertino.dart';

class TextInputController {
  TextEditingController textEditingController;
  Function textChangeHandler;

  TextInputController(this.textChangeHandler) {
    textEditingController = TextEditingController();
    textEditingController
        .addListener(() => textChangeHandler(textEditingController.text));
  }
}
