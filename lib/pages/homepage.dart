import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Futura',
      ),
      home: DefaultTabController(
        length: 4,
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: TabBarView(
          children: [],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
      child: Container(

        //margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              const SizedBox(height: 10),
              _searchBox(),
              _tabBar()
            ],
          ),
        ),
      ),
    );
  }
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Color(0xFFC4EEF0), // Set the desired background color
    );
  }
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: _log(),
        ),
        Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                  color: Colors.orange, // Icon color
                ),
              ),
              SizedBox(width: 8,),
              Text(
                _getCurrentDate(), // Display current date
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),


        )


      ],
    );
  }

  Widget _searchBox() {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 35,
              child: TextFormField(
                textAlign: TextAlign.start,
                controller: _searchText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.all(0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // Do something when the menu icon is pressed
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _log() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Lord ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'builders ',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Image.network(
            "assets/img.png",
            width: 20, // Adjust size as needed
            height: 20, // Adjust size as needed
          ),
          Column(
            children: [
              Text(
                'Krishna',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'flats & villas',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.black,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.teal.shade800,
      tabs: const [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.group),
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          text: 'Long Term',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          text: 'Short Term',
        ),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(


      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.blue,),
          label: 'settings',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.blue, // Background color of the avatar
            child: Icon(Icons.home, color: Colors.orange), // Home icon inside the avatar
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Colors.blue),
          label: 'Person',
        ),
      ],
      currentIndex: 0, // Initially selected item index
      selectedItemColor: Colors.teal,

      onTap: (int index) {
        // Handle tap on bottom navigation bar item
      },
    );
  }
}

_getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEE, MMM d, yyyy').format(now);
  return formattedDate;
}


