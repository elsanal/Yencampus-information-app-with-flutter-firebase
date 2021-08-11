import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

UlrLauncher(BuildContext context,String url)async{
  final snackBar = SnackBar(
    content: Text("Can't open the website..."),);
  final waitSnackBar = SnackBar(
    content: Text("Waiting..."),);
  ScaffoldMessenger.of(context).showSnackBar(waitSnackBar);
  await canLaunch(url)?launch(url):ScaffoldMessenger.of(context).showSnackBar(snackBar);
}