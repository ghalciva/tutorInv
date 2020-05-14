import 'dart:io';

import 'package:flutter/material.dart';

class UploadFilesScreen extends StatefulWidget {
  @override
  _UploadFilesScreenState createState() => _UploadFilesScreenState();
}

class _UploadFilesScreenState extends State<UploadFilesScreen> {

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController fileController = TextEditingController();
  String dropdownValue = 'Precio fijo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir archivos', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
     body: Container(
       padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Text('Titulo', style: TextStyle(fontSize: 16),),
            TextFormField(
              controller: subjectController,
              validator: (value){
                if(value.isEmpty){
                  return 'Ingrese un titulo';
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Que necesitas?',
                contentPadding: const EdgeInsets.all(5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Descripcion', style: TextStyle(fontSize: 16),),
            TextFormField(
              controller: descriptionController,
              validator: (value){
                if(value.isEmpty){
                  return 'Ingrese una descripcion';
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Ingresa mas detalles',
                contentPadding: const EdgeInsets.all(5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Tipo de proyecto', style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            DropdownButton(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Precio fijo', 'Por hora']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Text('Presupuesto', style: TextStyle(fontSize: 16),),
            TextFormField(
              controller: budgetController,
              validator: (value){
                if(value.isEmpty){
                  return 'Ingrese su presupuesto en numeros';
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Ingrese su presupuesto',
                contentPadding: const EdgeInsets.all(5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Archivo', style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            FlatButton(
              child: Text(
                'Cargar archivo',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.white,
              textColor: Colors.deepOrange,
              padding: const EdgeInsets.all(15),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}