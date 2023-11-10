import 'package:flutter/material.dart';

var wrongCredentialErr= "Wrong username or passwords";
var notFormatedPass= "Passwords must be longer than 8 characters";
var notFormatedEmail= "Email not available";
var notAvailUser="Username not availlable";
var unmatchedPass="Unmatched password";

var userNotAvail=false;
var emailWrongFotmat=false;
var passWrongFormat=false;
var passUnmatched=false;
var userInvalid=false;
var passInvalid=false;

TextEditingController newUsername = new TextEditingController();
TextEditingController newPass = new TextEditingController();
TextEditingController newRepPass = new TextEditingController();
TextEditingController newEmail = new TextEditingController();
TextEditingController userController = new TextEditingController();
TextEditingController passController = new TextEditingController();

void validMethod() {
    if (newPass.text.length < 8)  passWrongFormat=true;
    else passWrongFormat=false;
    if (!newEmail.text.contains('@')) emailWrongFotmat=true;
    else emailWrongFotmat=false;
    if (newPass != newRepPass) passUnmatched=true;
    else passUnmatched=false;
    if (passController.text.length < 8)  passWrongFormat=true;
    else passWrongFormat=false;
}
