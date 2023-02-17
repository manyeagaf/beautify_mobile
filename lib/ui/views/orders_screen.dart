import 'package:beautify/core/enum/view_state.dart';
import 'package:beautify/core/viewmodels/order_model.dart';
import 'package:beautify/ui/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../../core/models/order/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  _buildOrders(List<Order> orders) {
    List<OrderCard> ordersCards = [];
    orders.forEach((order) {
      ordersCards.add(OrderCard(order: order));
    });
    return ordersCards;
  }

  @override
  Widget build(BuildContext context) {
    context.read<OrderModel>().getOrders;
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<OrderModel>(
        builder: (context, model, child) {
          return model.state == ViewState.Busy
              ? CircularProgressIndicator()
              : model.error
                  ? Center(
                      child: Text(model.errorMessage),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                      itemCount: model.orders.length,
                      itemBuilder: (context, index) =>
                          OrderCard(order: model.orders[index]),
                    );
        },
      ),
    );
  }
}
