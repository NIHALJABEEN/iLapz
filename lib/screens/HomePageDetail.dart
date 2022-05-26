import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePageDetail extends StatefulWidget {
  String dprofileImage,dName,dUserName, dEmail, dAddress,dPhone, dWebsite, dCompany;

  HomePageDetail({this.dprofileImage,this.dName,this.dUserName ,this.dEmail,this.dAddress,
    this.dPhone, this.dWebsite, this.dCompany});

  @override
  _HomePageDetailState createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: widget.dprofileImage!=null?widget.dprofileImage:"",
                        placeholder: (context, url) => new Image.asset(
                          'assets/images/dummy.png',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => new Image.asset(
                          'assets/images/dummy.png',
                          fit: BoxFit.cover,
                        ),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "${widget.dName}",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Username : ${widget.dUserName}",
                        style: TextStyle(fontSize: 16),
                      ),Text(
                        "Email : ${widget.dEmail}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Phone : ${widget.dPhone}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Address : ${widget.dAddress}",
                        style: TextStyle(fontSize: 16),
                      ),Text(
                        "Company : ${widget.dCompany}",
                        style: TextStyle(fontSize: 16),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameDetail extends StatelessWidget {
  final String name, email;
  NameDetail({this.name, this.email});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24),
                ),
                Text(
                  "Email : $email",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 40,
                color: Colors.orange,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}

