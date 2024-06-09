import 'package:design/constant/color_constants.dart';
import 'package:design/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class CustomFormBuilderTF extends StatelessWidget {
  CustomFormBuilderTF({
    super.key,
    this.textType,
    required this.controller,
    this.hintText,
    required this.isRequired,
    this.onChanged,
    this.isObsecureText,
    required this.name,
    this.isEmail,
    this.isLongTextField,
    this.hintStyle,
    this.labelText,
    this.isPassword,
  });

  final TextInputType? textType;
  final TextEditingController controller;
  final String? hintText;
  final bool isRequired;
  final Function? onChanged;

  final bool? isObsecureText;
  final bool? isEmail;
  final bool? isLongTextField;
  final TextStyle? hintStyle;
  final String name;

  final String? labelText;
  final bool? isPassword;

  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    bool longTextField = isLongTextField ?? false;
    bool obsecureText = isObsecureText ?? false;
    bool isPasswordd = isPassword ?? false;
    return FormBuilderTextField(
      name: name,
      obscureText: !_loginController.obsecureText.value && isPasswordd,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: textType,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!();
        }
      },
      maxLines: longTextField ? 7 : 1,
      decoration: InputDecoration(
        suffixIcon: obsecureText || isPasswordd
            ? Obx(
                () => InkWell(
                    onTap: () {
                      _loginController.obsecureText.value = !_loginController.obsecureText.value;
                    },
                    child: _loginController.obsecureText.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
              )
            : const SizedBox.shrink(),
        labelText: labelText,
        hintStyle: hintStyle,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldFillColor),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        fillColor: textFieldFillColor,
        filled: true,
        contentPadding: const EdgeInsets.all(16),
      ),
      validator: isRequired
          ? FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              if (isEmail == true) FormBuilderValidators.email(),
            ])
          : null,
    );
  }
}
