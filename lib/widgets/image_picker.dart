import 'dart:io';
import 'package:delivery_boy/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPicCard extends StatefulWidget {
  @override
  _ShopPicCardState createState() => _ShopPicCardState();
}

class _ShopPicCardState extends State<ShopPicCard> {
  File _image;
  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          _authData.getImage().then((image){
            setState(() {
              _image=image;
            });
            if(image!=null){
              _authData.isPicAvail=true;
            }
          });
        },
        child: SizedBox(
          height: 150,
          width: 150,
          child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: _image == null ? Center(
                    child: Text(
                      'Add Profile Image', //if no image picked
                      style: TextStyle(color: Colors.grey),
                    )):Image.file(_image,fit: BoxFit.fill,),
              )//after pick image
          ),
        ),
      ),
    );
  }
}



