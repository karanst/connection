import 'dart:convert';

import 'package:connection/Helper/Api.path.dart';
import 'package:connection/Models/tiffin_service_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/CustomColors.dart';
import 'AppBar/CustomAppBar.dart';
import 'buttons/CustomButton.dart';
import 'package:http/http.dart' as http;

class TiffinService extends StatefulWidget {
  const TiffinService({Key? key}) : super(key: key);

  @override
  State<TiffinService> createState() => _TiffinServiceState();
}

class _TiffinServiceState extends State<TiffinService> {
  TiffinServiceResponse? tiffinServiceResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTiffinList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/rideScreenimage3.png'),
                                  fit: BoxFit.fill)),
                          child: CustomAppbar2(
                            Text2: 'Tiffin Services',
                          ))),
                  Positioned(
                      top: 170,
                      left: 5,
                      right: 5,
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                           const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.TransparentColor),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Icon(
                                      Icons.search,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(top: 16, left: 5),
                                  border: InputBorder.none,
                                  hintText: "Search Tiffin Center",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // SingleChildScrollView(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 8),
                            //   scrollDirection: Axis.horizontal,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: const Center(child: Text('City')),
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: Center(child: Text('Veg')),
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: Center(child: Text('non-veg')),
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: Center(child: Text('Jain')),
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: Center(child: Text('Jain')),
                            //       ),
                            //       const SizedBox(
                            //         width: 10,
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 75,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.circular(10),
                            //             border: Border.all(color: Colors.grey)),
                            //         child: Center(child: Text('Jain')),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            tiffinServiceResponse != null ?
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    tiffinServiceResponse!.data!.length,
                                itemBuilder: (context, index) {
                                  var item =
                                      tiffinServiceResponse!.data![index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 110,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        item.profileImage ??
                                                            '',
                                                      )),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                       Text(
                                                        item.uname.toString(),
                                                          // 'Name Of Tiffin Centre',
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                          fontWeight: FontWeight.w600)),
                                                      const SizedBox(
                                                        width: 65,
                                                      ),
                                                      // Image.asset(
                                                      //   'assets/images/mark.png',
                                                      //   height: 15,
                                                      //   width: 15,
                                                      // )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    width: 210,
                                                    child: GridView.builder(
                                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisSpacing: 20,
                                                          mainAxisSpacing: 0,
                                                          childAspectRatio: 3,
                                                          crossAxisCount: 2),
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemCount: item!.description!.length,
                                                        itemBuilder: (context, i){
                                                      return  Text(item.description![i]);
                                                    }, ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      CustomAppBtn(
                                                        onPress: () {
                                                          detailsPopUp(item);
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FestivalEventsScreen()));
                                                        },
                                                        height: 30,
                                                        width: 80,
                                                        title: 'Know more',
                                                        fSize: 12,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                            : Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<bool> detailsPopUp(Data item) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => Dialog(
              insetPadding: EdgeInsets.symmetric(vertical: 100),
              backgroundColor: Colors.transparent,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 70,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: CustomColors2.dialogColor,),
                          height: MediaQuery.of(context).size.height / 1.25,
                          width: double.maxFinite,

                        )),
                    Positioned(
                        top: 5,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                CircleAvatar(
                                    maxRadius: 70,
                                    backgroundImage: NetworkImage(item.profileImage ?? '')),
                                SizedBox(
                                  width: 70,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close,
                                          color: Colors.white, size: 30),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                   const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      item.address.toString(),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: CustomColors.primaryColor),
                                    ),
                                  ],
                                ),
                                 Text(
                                   item.uname.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: CustomColors.primaryColor),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                                  height: 140,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.primaryColor),
                                  ),
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 0,
                                        childAspectRatio: 2,
                                        crossAxisCount: 3),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: item.description!.length,
                                    itemBuilder: (context, i){
                                      return  Text(item.description![i], style: const TextStyle(
                                        color: Colors.white
                                      ),);
                                    }, ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.primaryColor),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text('Per day :',
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: CustomColors
                                                            .primaryColor)),
                                                Text(
                                                  '\$ ${item.perDayCharge.toString()}',
                                                  style: TextStyle(
                                                      color: CustomColors
                                                          .redColor),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text('Monthly :',
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: CustomColors
                                                            .primaryColor)),
                                                Text(
                                                  '\$ ${item.perDayCharge.toString()}',
                                                  style: TextStyle(
                                                      color: CustomColors
                                                          .redColor),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text('Yearly :',
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: CustomColors
                                                            .primaryColor)),
                                                Text(
                                                  '\$ ${item.perDayCharge.toString()}',
                                                  style: TextStyle(
                                                      color: CustomColors
                                                          .redColor),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Download PDF'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      fixedSize: Size(230, 40)),
                                )
                              ],
                            ),
                          ],
                        )),
                    Positioned(
                      top: 210,
                      left: 130,
                      right: 130,
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          color: CustomColors2.dialogColor,
                          border: Border.all(color: CustomColors2.lightyellow),
                        ),
                        child: const Center(
                          child: Text(
                            'Dishes available',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors2.lightyellow,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 373,
                      left: 150,
                      right: 150,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: CustomColors2.dialogColor,
                          border: Border.all(color: CustomColors2.lightyellow),
                        ),
                        child: const Center(
                          child: Text(
                            'Price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors2.lightyellow,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  getTiffinList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    var headers = {
      'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}get_tiffin'));
    /*request.fields.addAll({
      //'user_id': user_id.toString(),
    });*/

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var accomodationList =
          TiffinServiceResponse.fromJson(jsonDecode(finalResponse));
      setState(() {
        tiffinServiceResponse = accomodationList;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}
