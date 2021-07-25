import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:test_app/View/GlobleClass.dart';
import 'package:test_app/View/Model/PostData.dart';

class PostController extends GetxController{
  var postModel = PostDataModel().obs;
  var isLoading=false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromServer();

  }

   fetchDataFromServer()async {
     isLoading(true);
     try{
       var dio =Dio();
       Response response = await dio.get(Globle.apiUrl);
       if (response.statusCode==200){
         isLoading(false);
         postModel.value=PostDataModel.fromJson(response.data);
       }
     }
     finally{
       isLoading(false);
     }

   }
}