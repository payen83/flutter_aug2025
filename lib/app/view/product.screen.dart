
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_aug2025/app/service/api.service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List productList = [];

  @override
  void initState(){
    super.initState();
    getProducts();
  }

  void getProducts() async {
    try {
      var result = await api.getHttp('/products');
      if(result != null ){
        setState(() {
          productList = result?['products'];
          log(productList.toString());
        });
      }
    } catch(e){
      log('Error in getting');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            for(var product in productList)
            Card(
              margin: EdgeInsets.fromLTRB(32, 0, 31, 24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 1)),
                    child: product['thumbnail'] != null
                      ? Image.network(product['thumbnail'], fit: BoxFit.cover)
                      : Image.asset('assets/images/shapes.png', fit: BoxFit.cover),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(product['title'], style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}