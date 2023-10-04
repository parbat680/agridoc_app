import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _getOrders;

  @override
  void initState() {
    ProductHandler handler = ProductHandler();
    _getOrders = handler.getOrders('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Text(
          "Your Orders",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _getOrders,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return productList(snapshot.data as List);
            }

            return Container();
          },
        ),
      ),
    );
  }

  productList(List products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 3)
                ]),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.white),
              child: ExpansionTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(product['product']['images'][0]),
                ),
                title: Text(product['product']['name']),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantity: ${product['quantity'].toString()}'),
                      Text(
                          'Delivery Address: ${product['delivery']['address1']} ${product['delivery']['address2']} ${product['delivery']['city']}')
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
