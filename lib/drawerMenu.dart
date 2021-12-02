import 'package:flutter/material.dart';
import 'package:flutter_app/profile.dart';
import 'LoginScreen.dart';
import 'package:localstorage/localstorage.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
  final LocalStorage storage = new LocalStorage('localstorage_app');

    return Container(
        // color: Colors.red,
        height: screen_height,
        width: screen_width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDiAfAphfa9fiIb4vQzPH8KuZsd_bW8SE3Yg&usqp=CAU"),
              ),
              accountName: Text(storage.getItem('userName')),
              accountEmail: Text(storage.getItem('emailAddress')),
            ),
            Menu_list(
              icon_name: Icons.border_color,
              menu_name: 'Orders',
            ),
            Menu_list(
              icon_name: Icons.bookmark,
              menu_name: 'Address',
            ),
            Menu_list(
              icon_name: Icons.notifications,
              menu_name: 'Notication',
            ),
            Menu_list(
              icon_name: Icons.help,
              menu_name: 'Help',
            ),
            Menu_list(
              icon_name: Icons.account_box,
              menu_name: 'Profile',
            ),
            Menu_list(
              icon_name: Icons.star_half,
              menu_name: 'Rate Us',
            ),
            Menu_list(
              icon_name: Icons.exit_to_app,
              menu_name: 'Logout',
            ),
          ]),
        ));
  }
}

class Menu_list extends StatelessWidget {
  final String menu_name;
  final IconData icon_name;

  const Menu_list({
    required this.icon_name,
    required this.menu_name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (menu_name == "Logout") {
          final LocalStorage storage = new LocalStorage('localstorage_app');

          storage.deleteItem('emailAddress');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        } else if (menu_name == "Profile") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }
      },
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white38, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon_name,
          color: Colors.white,
        ),
      ),
      title: Container(
        margin: EdgeInsets.only(left: 0),
        child: Text(
          menu_name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
