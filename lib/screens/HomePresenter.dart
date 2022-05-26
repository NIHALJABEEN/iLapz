
import 'package:dio/dio.dart';
import 'package:ilapz_test/db/user_database.dart';
import 'package:ilapz_test/utils/Constants.dart';
import 'package:ilapz_test/utils/ds.dart';

abstract class HomeContract{
  void onDataFetchedFromApi(List<UsersList> response);
  void onDataFetchedFromDB(List<UsersList> response);
  void onResponseError(String response);
}

class HomePresenter{

  HomeContract _view;
  Datasource api=new Datasource();

  HomePresenter(this._view);

  getDataFromDB() async{
    try{
      List<UsersList> userList= await UserDatabase.instance.readAllUsers();
      _view.onDataFetchedFromDB(userList);
    }catch(e){
      _view.onResponseError(e.toString().substring(e.toString().indexOf(":")+1));

    }
  }
  getDataFromAPI() async{
    try{


      List<UsersList> response= await api.fetchDataFromApi();
      _view.onDataFetchedFromApi(response);

    }catch(e){
      _view.onResponseError(e.toString().substring(e.toString().indexOf(":")+1));

    }
  }



}