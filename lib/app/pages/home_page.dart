import 'package:dashboard_first/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  BackdroundDashboard(),
                  Container(
                    margin: EdgeInsets.only(top: 112, left: 22, right: 22),
                    child: Column(
                      children: <Widget>[
                        Company(),
                        Padding(
                          padding: EdgeInsets.only(top: 54),
                          child: Tanks(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: MenuDashboard(),
                        )
                      ],
                    ),
                  )
                  
                ],
              ),
            ),
      )
    );
  }
}

class BackdroundDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child:  Container(
        height: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.orange,
            ]
          )
        ),
      ),
    );
  }
}


class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();

    double x = size.width;
    double y = size.height;

    path.lineTo(0, y/1.2);
    path.lineTo(x/1.5, y/1.03);
    path.quadraticBezierTo(x/1.38, y-3, x/1.3, y/1.03); 
    path.lineTo(x, y/1.2);
    path.lineTo(x, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }

}


class Company extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Container(
                color: Colors.grey[300],
                height: 65,
                width: 65,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Paulo R. Silva Castelo', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),),
                SizedBox(
                  height: 5,
                ),
                Row(
                 
                  children: <Widget>[
                    Icon(Icons.gps_fixed,
                     color: Colors.grey[300],
                     size: 16,
                     ),
                    Text('Manaus, Compensa', style: TextStyle(fontSize: 14, color: Colors.grey[300], fontWeight: FontWeight.w600),)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                 
                  children: <Widget>[
                    Icon(Icons.date_range,
                     color: Colors.grey[300],
                     size: 16,
                     ),
                    Text('23/01/2020', style: TextStyle(fontSize: 14, color: Colors.grey[300], fontWeight: FontWeight.w600),)
                  ],
                )    
              ],
            ),
            )
          ],
        ),
    );
  }
}


class Tanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Tanque(s)' ,style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.w600)),
          ListTanks()

        ],
      ),
    );
  }
}

class ListTanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 8, bottom: 0, left: 0, right: 0),
        itemCount: 6,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                 color: Colors.white,
                 shape: BoxShape.rectangle,
                 borderRadius: BorderRadius.circular(12)
              ),
            ),
          );
        }
      ),
    );
  }
}

class MenuDashboard extends StatelessWidget {

  var homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Acessibilidade' ,style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          ListMenu(homeStore: homeStore,),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                homeStore.dropdownMenu();
              },
              child: Container(
                child: Center(
                  child: Observer(builder: (_) {
                    return Icon(
                      homeStore.isBoolMenu ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      size: 45.0,
                      color: Colors.orange,
                    );
                  },
                  ),
                ),
              ),
            ),
          )
          

        ],
      ),
    );
  }
}

class ListMenu extends StatelessWidget {

  final HomeStore homeStore;

  const ListMenu({Key key, this.homeStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
        return AnimatedContainer(
        duration: Duration(milliseconds: 300),  
        height: homeStore.isBoolMenu ? 330 : 110,
        child: ListView.builder(
          physics: new NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
          itemCount: 3,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width/2.4,
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.red,
                    //     Colors.orange,
                    //   ]
                    // ),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14.0),
                  ), 
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width/2.4, 
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.red,
                    //     Colors.orange,
                    //   ]
                    // ),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14.0),
                  ), 
                )
              ],
            ),
            );
          },
        ),
      );
    },
    );
  }
}