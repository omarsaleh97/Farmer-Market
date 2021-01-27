import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmer_market/src/app.dart';
import 'package:farmer_market/src/blocs/auth_bloc.dart';
import 'package:farmer_market/src/blocs/product_bloc.dart';
import 'package:farmer_market/src/models/product.dart';
import 'package:farmer_market/src/styles/colors.dart';
import 'package:farmer_market/src/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoToolbar(
          items: <CupertinoToolbarItem>[
            CupertinoToolbarItem(
                icon: CupertinoIcons.add_circled,
                onPressed: () =>
                    Navigator.of(context).pushNamed('/editproduct'))
          ],
          body: pageBody(productBloc, context, authBloc.userId),
        ),
      );
    } else {
      return Scaffold(
        body: pageBody(productBloc, context, authBloc.userId),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.straw,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
        ),
      );
    }
  }

  Widget pageBody(
      ProductBloc productBloc, BuildContext context, String vendorId) {
    return StreamBuilder<List<Product>>(
        stream: productBloc.productByVendorId(vendorId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return (Platform.isIOS)
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var product = snapshot.data[index];
                    return GestureDetector(
                      child: AppCard(
                          productName: product.productName,
                          unitType: product.unitType,
                          availableUnits: product.availableUnits,
                          price: product.unitPrice),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/editproduct/${product.productId}');
                      },
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: AppColors.straw,
                  child: (Platform.isIOS)
                      ? Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                          size: 35,
                        )
                      : Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 35,
                        ),
                ),
                onTap: ()=>Navigator.of(context).pushNamed('/editproduct'),
              )
            ],
          );
        });
  }
}
