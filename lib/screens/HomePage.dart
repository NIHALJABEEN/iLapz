import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ilapz_test/screens/HomePageDetail.dart';
import 'package:ilapz_test/screens/HomePresenter.dart';
import 'package:ilapz_test/utils/Constants.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeContract{
  List<UsersList> userList = [];
  List<UsersList> _searchResult  = [];
  var loading = false;
  HomePresenter _presenter;
  TextEditingController controller = new TextEditingController();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter =new HomePresenter(this);

    setState(() {
      loading = true;

    });
    _presenter.getDataFromDB();
   // fetchDataFromApi();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Employee List'),
        centerTitle: true,
      ),

      body: Container(
        child: loading ?
        Center (child: CircularProgressIndicator()) :
        Column(
          children: [
            new Container(
              color: Theme.of(context).primaryColor,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? new ListView.builder(
                  itemCount: _searchResult.length,
                  itemBuilder: (context, i){
                    final empDataList = _searchResult[i];

                    final companydata = jsonDecode(empDataList.company);
                    final addressdata = jsonDecode(empDataList.address);


                    return Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePageDetail(
                                dprofileImage: empDataList.profile_image,
                                dName: empDataList.name,
                                dUserName: empDataList.username,
                                dAddress: addressdata!=null?
                                addressdata["street"]+","+
                                    addressdata["suite"]+","+
                                    addressdata["city"]+","+
                                    addressdata["zipcode"]:"",
                                dEmail: empDataList.email,
                                dPhone: empDataList.phone,
                                dWebsite: empDataList.website,
                                dCompany: companydata!=null?
                                companydata["name"]
                                    :"",
                              )));
                        },
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(15),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: empDataList.profile_image!=null?empDataList.profile_image:"",
                                  placeholder: (context, url) => new Image.asset(
                                    'assets/images/dummy.png',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) => new Image.asset(
                                    'assets/images/dummy.png',
                                    fit: BoxFit.cover,
                                  ),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                Text(empDataList.name, style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green),
                                ),
                                Text(companydata!=null?companydata["name"]:""),



                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              )
                  :ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, i){
                    final empDataList = userList[i];

                    final companydata = jsonDecode(empDataList.company);
                    final addressdata = jsonDecode(empDataList.address);


                    return Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePageDetail(
                                dprofileImage: empDataList.profile_image,
                            dName: empDataList.name,
                            dUserName: empDataList.username,
                            dAddress: addressdata!=null?
                            addressdata["street"]+","+
                            addressdata["suite"]+","+
                            addressdata["city"]+","+
                            addressdata["zipcode"]:"",
                            dEmail: empDataList.email,
                            dPhone: empDataList.phone,
                            dWebsite: empDataList.website,
                            dCompany: companydata!=null?
                            companydata["name"]
                                :"",
                          )));
                        },
                        child: Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(15),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: empDataList.profile_image!=null?empDataList.profile_image:"",
                                  placeholder: (context, url) => new Image.asset(
                                    'assets/images/dummy.png',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) => new Image.asset(
                                    'assets/images/dummy.png',
                                    fit: BoxFit.cover,
                                  ),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                Text(empDataList.name, style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green),
                                ),
                                Text(companydata!=null?companydata["name"]:""),



                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),

    );
  }


  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    userList.forEach((userDetail) {
      if (userDetail.name.contains(text) || userDetail.email.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }


  @override
  void onDataFetchedFromApi(List<UsersList> response) {
    // TODO: implement onDataFetchedFromApi
    _presenter.getDataFromDB();
  }

  @override
  void onDataFetchedFromDB(List<UsersList> response) {
    // TODO: implement onDataFetchedFromDB

    setState(() {
      userList=response;
      if(userList.isEmpty){
        _presenter.getDataFromAPI();
      }
      else{

        setState(() {
          //userList=response;
          loading=false;
        });
      }
    });

  }

  @override
  void onResponseError(String response) {
    // TODO: implement onResponseError

    print("Error:"+response);
  }
}