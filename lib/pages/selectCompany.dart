import 'package:flutter/material.dart';

class MyListview extends StatefulWidget {
  const MyListview({Key? key});

  @override
  State<MyListview> createState() => _MyListviewState();
}

class _MyListviewState extends State<MyListview> {
  // List of company details including name, image URL, and check state
  final List<Map<String, dynamic>> companies = [
    {'name': 'Lord Krishna Consturction', 'image': 'https://as2.ftcdn.net/v2/jpg/05/90/98/49/1000_F_590984956_sfLEosb32bWdY7nYRXlTGCagP7kVgWZD.jpg'},
    {'name': 'Lord Krishna Interior', 'image': 'https://as2.ftcdn.net/v2/jpg/05/90/98/49/1000_F_590984956_sfLEosb32bWdY7nYRXlTGCagP7kVgWZD.jpg'},
    {'name': 'Lord Krishna Material', 'image': 'https://as2.ftcdn.net/v2/jpg/05/90/98/49/1000_F_590984956_sfLEosb32bWdY7nYRXlTGCagP7kVgWZD.jpg'},
  ];

  String? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Companies List'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Select company:",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 600,
                height: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: companies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(companies[index]['image']),
                              ),
                              title: Text(companies[index]['name']),
                              trailing: selectedCompany == companies[index]['name']
                                  ? Icon(Icons.check_circle,
                                color: Colors.green[700],)
                                  : Icon(
                                Icons.circle_outlined,
                                color: Colors.grey,
                              ),

                              onTap: () {
                                setState(() {
                                  selectedCompany = companies[index]['name'];
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 29),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            print('Selected company: $selectedCompany');

                          },
                          child: Text('DONE'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

