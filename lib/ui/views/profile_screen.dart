import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/views/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile2.jpg"),
                radius: width * 0.2,
              ),
            ),
            Text(
              "Doo Bia",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
              width: width,
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrdersScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Orders",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(
              width: width,
              child: Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
