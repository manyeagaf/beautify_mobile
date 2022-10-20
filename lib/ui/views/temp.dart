import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../shared/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("STORES"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("ESTORES"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY FASHION"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY JEWELLERY"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY MEN"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY PRIVE"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        iconSize: 20.0,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Shudo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  color: kTextColor,
                  icon: Icon(
                    Icons.menu,
                  ),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: kBackgroundColor,
            floating: true,
            pinned: true,
            snap: false,
            title: Text(
              "Beautify",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                color: kTextColor,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                color: kTextColor,
              ),
            ],
            bottom: AppBar(
              elevation: 0.0,
              backgroundColor: kBackgroundColor,
              automaticallyImplyLeading: false,
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 216, 216),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Search on Beautify',
                        hintStyle: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontSize: 15.0,
                        )
                        // prefixIcon: Icon(Icons.search),
                        // suffixIcon: Icon(
                        //   Icons.camera_alt,
                        // ),
                        ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(
                      'This is an awesomes hopping platform',
                    ),
                  ),
                ),
                Container(
                  height: 1000,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
