import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:beautify/core/viewmodels/category_model.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/core/viewmodels/order_model.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/views/home_screen.dart';
import 'package:beautify/ui/views/login_screen.dart';
import 'package:beautify/ui/views/product_detail.dart';
import 'package:beautify/ui/views/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
        ChangeNotifierProvider<CategoryModel>(create: (_) => CategoryModel()),
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
        ChangeNotifierProvider<OrderModel>(create: (_) => OrderModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beautify',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
        ),
        accentColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: kPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: kPrimaryColor),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
