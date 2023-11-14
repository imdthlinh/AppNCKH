import 'package:flutter/material.dart';

var notFormatedPass= "Passwords must be longer than 8 characters";
var notFormatedEmail= "Email not available";
var unmatchedPass="Unmatched password";
var fillin="Fill in this field";

var emailWrongFotmat=false;
var passWrongFormat=false;
var npassWrongFormat=false;
var passUnmatched=false;

var isSuccessSignup=false;
var isSuccessLogin=false;

TextEditingController newUsername = new TextEditingController();
TextEditingController newPass = new TextEditingController();
TextEditingController newRepPass = new TextEditingController();
TextEditingController newEmail = new TextEditingController();
TextEditingController userController = new TextEditingController();
TextEditingController passController = new TextEditingController();





