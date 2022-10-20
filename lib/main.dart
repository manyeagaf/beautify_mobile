import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:beautify/core/viewmodels/category_model.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/views/home_screen.dart';
import 'package:beautify/ui/views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
        ChangeNotifierProvider<CategoryModel>(create: (_) => CategoryModel()),
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
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
        scaffoldBackgroundColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
      ),
      home: HomeScreen(),
    );
  }
}
