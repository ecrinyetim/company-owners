import 'package:company_owners/servis/post-model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';


class SOdev extends StatefulWidget {
  const SOdev({Key? key}) : super(key: key);

  @override
  State<SOdev> createState() => _SOdevState();
}

class _SOdevState extends State<SOdev> {
  List<PostModel>? _items;
  Text name=Text("Company Owners",);
  @override
  void initState(){
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response= await Dio().get('https://jsonplaceholder.typicode.com/users');

    if(response.statusCode==HttpStatus.ok){
      final _datas=response.data;
      if(_datas is List){
        setState(() {
          _items=_datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true,
        title: name,
      ),
      body:ListView.builder(itemCount: _items?.length ?? 0,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(_items![index].name ?? ''),
                subtitle: Text(_items![index].company?.name ?? ''),
                leading: Icon(Icons.account_circle_sharp,color:Renk2.Copper,),
                trailing:Column(
                  children: [
                    Padding(
                      padding: Paddings.all,
                      child: Icon(Icons.location_on,color: Renk2.Copper,),
                    ),
                    Text(_items![index].address?.city ?? ''),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

class Renk2{
  static Color Copper= Color.fromRGBO( 190, 107, 60,1);
}
class Paddings{
  static const EdgeInsets all=EdgeInsets.all(5);
}