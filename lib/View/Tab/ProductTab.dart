import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/View/Model/Controller/PostDataConreoller.dart';
import 'package:test_app/View/NavigationDrawer/NavigationDrawerHome.dart';
class ProductTab extends StatefulWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final postController=Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Product"),

      ),
      drawer: NavigationDrawerHome(),
      body: SafeArea(
        child:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Obx((){
            if(postController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return  Container(
                color: Colors.grey[200],
                 child: postController.postModel.value.data==null?
                      Center(
                        child: Container(
                          child: Text("No Data Found"),
                        ),
                      ):
                     ListView.builder(
                     itemCount: 10,
                     shrinkWrap: false,
                     itemBuilder: (BuildContext context, int index) {
                 return PostUI(index);
             })
                );
          }

          )
          ),
        )

    );
  }

  Widget PostUI(int index) {
    if(postController.postModel.value.data!=null)
      return Container(

        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.transparent,
        child: Column(
          children: [
            Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
             color: Colors.white,
            ),
                child: Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Row(
                    children: [
                    Container(
                    width: 80.0,
                    height: 80.0,

                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("Asset/image/download.png"
                            )
                        )
                    ),
                    ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ID: ${postController.postModel.value.data?[index].id}"),
                            Text("Name:${postController.postModel.value.data?[index].name}",maxLines: 3,),
                            Text("Gender: ${postController.postModel.value.data?[index].gender}"),
                            Text("Email: ${postController.postModel.value.data?[index].email}",maxLines:3,overflow:TextOverflow.ellipsis ,),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )


            )
          ],
        ),
      );
    return Container();

  }
}
