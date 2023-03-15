import 'dart:convert';
import 'package:connection/Presentation/AppBar/CustomAppBar.dart';
import 'package:connection/Presentation/create_accomodation_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/CustomColors.dart';
import '../Helper/Api.path.dart';
import '../Models/AccomodationdetailsModel.dart';


// class AccommodationScreen extends StatefulWidget {
//   const AccommodationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AccommodationScreen> createState() => _AccommodationScreenState();
// }
//
// class _AccommodationScreenState extends State<AccommodationScreen> {
//   TextEditingController searchCtr = TextEditingController();
//
//   AccomodationdetailsModel? accomodationdetailsModel;
//   accodomationList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? user_id = prefs.getString('user_id');
//     var headers = {
//       'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
//     };
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('${ApiPath.baseUrl}get_accodomation_list'));
//     request.fields.addAll({
//       'user_id': user_id.toString(),
//     });
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = json.decode(finalResponse);
//       var accomodationList =
//           AccomodationdetailsModel.fromJson(jsonDecode(finalResponse));
//       setState(() {
//         accomodationdetailsModel = accomodationList;
//       });
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   searchAccomodation() async {
//     var headers = {
//       'Cookie': 'ci_session=bd1aeb5653cb1b5c5814febbcff1af2959efc103'
//     };
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             'https://developmentalphawizz.com/connection/api/search_accodomation'));
//     request.fields.addAll({
//       'text': searchCtr.text,
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds: 500), () {
//       return accodomationList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> party = [
//       {
//         'image': "assets/images/Accommodationimage2.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       {
//         'image': "assets/images/Accommodationimage3.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//
//       {
//         'image': "assets/images/Accommodationimage4.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       {
//         'image': "assets/images/Accommodationimage5.png",
//         'image1': "assets/images/rideiconImage.png",
//       },
//       // {"image": "assets/images/2022.png", "name":"Party night" ,"location":"assets/images/location.png","address": "Palsia, Indore"},
//     ];
//
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image:
//                               AssetImage('assets/images/rideScreenimage3.png'),
//                           fit: BoxFit.fill)),
//                   // child: CustomAppbar2(Text2: 'Accommodation',)
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 290.0, left: 5, right: 5),
//                   child: Material(
//                     elevation: 4,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height / 1.5,
//                       width: MediaQuery.of(context).size.width * 2,
//                       child: Card(
//                         elevation: 40,
//                         child: accomodationdetailsModel == null
//                             ? Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : accomodationdetailsModel! == null
//                                 ? Center(
//                                     child: Text(
//                                       "No data to show",
//                                       style: TextStyle(fontFamily: 'Lora'),
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     // physics: const NeverScrollableScrollPhysics(),
//                                     shrinkWrap: false,
//                                     scrollDirection: Axis.vertical,
//                                     itemCount:
//                                         accomodationdetailsModel!.data!.length,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.all(4.0),
//                                         child: Card(
//                                           elevation: 4,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15)),
//                                           child: Container(
//                                             padding: EdgeInsets.all(4),
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width -
//                                                 30,
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   height: 80,
//                                                   width: 80,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               12),
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               "${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}"),
//                                                           fit: BoxFit.fill)),
//                                                   // child: Image.network("${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}", fit: BoxFit.fill, height: 100, width: 90,
//                                                   // ),
//                                                 ),
//                                                 SizedBox(width: 5),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Container(
//                                                           width: 130,
//                                                           child: Row(
//                                                             children: [
//                                                              const Icon(
//                                                                   Icons
//                                                                       .location_on_outlined,
//                                                                   size: 20,
//                                                                   color: Colors
//                                                                       .red),
//                                                               SizedBox(
//                                                                   width: 5),
//                                                               Text(
//                                                                   '${accomodationdetailsModel!.data![index].address}'),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         Row(
//                                                           children: const [
//                                                             Text(
//                                                               "Status :",
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .red),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 5,
//                                                             ),
//                                                             Text(
//                                                               'Available',
//                                                               style: TextStyle(
//                                                                   fontSize: 10),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         top: 10.0,
//                                                         right: 180,
//                                                       ),
//                                                       child: Text(
//                                                         '\$ ${accomodationdetailsModel!.data![index].mrpPrice}',
//                                                         style: TextStyle(
//                                                             fontSize: 20),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                         top: 8.0,
//                                                       ),
//                                                       child: Row(
//                                                         children: [
//                                                           const Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     right: 10),
//                                                             child: Text(
//                                                               'Move in Date :',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .red,
//                                                                   fontSize: 12),
//                                                             ),
//                                                           ),
//                                                           // SizedBox(width: 1,),
//                                                           Text(
//                                                             '${accomodationdetailsModel!.data![index].date}',
//                                                             style:
//                                                                 const TextStyle(
//                                                                     fontSize:
//                                                                         12,
//                                                                     ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(left: 130.0),
//                                                       child: ElevatedButton(
//                                                         child: Text('Know More'),
//                                                         style: ElevatedButton
//                                                             .styleFrom(
//                                                           shape: RoundedRectangleBorder(
//                                                               borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                   30)),
//                                                           primary: CustomColors
//                                                               .secondaryColor,
//                                                           textStyle:
//                                                           const TextStyle(
//                                                               color: Colors
//                                                                   .white,
//                                                               fontSize: 13,
//                                                               fontStyle:
//                                                               FontStyle
//                                                                   .normal),
//                                                         ),
//                                                         onPressed: () {},
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 100.0, left: 25),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Accomodation",
//                         style: TextStyle(
//                             fontSize: 20, color: CustomColors.primaryColor),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           searchAccomodation();
//                         },
//                         child: Container(
//                           height: 55,
//                           width: MediaQuery.of(context).size.width / 1.1,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: CustomColors.TransparentColor),
//                           child: TextFormField(
//                             controller: searchCtr,
//                             keyboardType: TextInputType.phone,
//                             decoration: const InputDecoration(
//                               suffixIcon: Padding(
//                                 padding: EdgeInsets.only(top: 5),
//                                 child: Icon(
//                                   Icons.search,
//                                 ),
//                               ),
//                               contentPadding: EdgeInsets.only(top: 15, left: 5),
//                               border: InputBorder.none,
//                               hintText: "Search Accommodation by city",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> AccomodationCreatePost()));
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height / 1.5,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                               image: AssetImage(
//                             "assets/Accomodation/banner.png",
//                           )),
//                         ),
//                         // width: MediaQuery.of(context).size.width/1.1,
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Image.asset(
//                               "assets/Accomodation/addicon.png",
//                               height: 50,
//                               width: 50,
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                               "Create Post",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 25,
//                                   color: CustomColors.primaryColor),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class AccommodationScreen extends StatefulWidget {
  const AccommodationScreen({Key? key}) : super(key: key);

  @override
  State<AccommodationScreen> createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {

  TextEditingController searchCtr = TextEditingController();

  AccomodationdetailsModel? accomodationdetailsModel;
  accodomationList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    var headers = {
      'Cookie': 'ci_session=f39a53b47d4ae69d6958691534596e54ef9fb9cc'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}get_accodomation_list'));
    request.fields.addAll({
      'user_id': user_id.toString(),
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      var accomodationList =
      AccomodationdetailsModel.fromJson(jsonDecode(finalResponse));
      setState(() {
        accomodationdetailsModel = accomodationList;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  searchAccomodation() async {
    var headers = {
      'Cookie': 'ci_session=bd1aeb5653cb1b5c5814febbcff1af2959efc103'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/connection/api/search_accodomation'));
    request.fields.addAll({
      'text': searchCtr.text,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
  // RideListModel? rideListData;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accodomationList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/3,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/rideScreenimage3.png'),fit:BoxFit.fill)),
                        child: CustomAppbar2(Text2: 'Accommodation',)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0,left: 5,right: 5),
                      child: Container(
                        height: MediaQuery.of(context).size.height/1,
                        width: MediaQuery.of(context).size.width*2,
                        child: Card(
                          elevation: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0,left: 15, right: 10),
                                child: Container(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.TransparentColor),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      suffixIcon: Padding(
                                        padding:  EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 15, left: 5),
                                      border: InputBorder.none,
                                      hintText: "Search accommodations by city",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AccomodationCreatePost()));
                                    },
                                    child: Container(
                                      width:320,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/Accomodation/banner.png',),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/Accomodation/addicon.png",
                                              height: 50,
                                              width: 50,
                                            ),
                                            const SizedBox(width: 10,),
                                            const   Text('Create Post',style: TextStyle(
                                                color: CustomColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                // Image.asset('assets/images/rideScreenimage.png',height: 150,width:380,),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      width: 130,
                                      child: const Divider(
                                        color: CustomColors.lightgray,
                                        thickness: 0.7,
                                      ),
                                    ),
                                  ),
                                 const  SizedBox(width: 10,),
                                  const Text('OR',style: TextStyle(color: CustomColors.grayColor),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 150,
                                      child: const Divider(
                                        color: CustomColors.lightgray,
                                        thickness: 0.7,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: accomodationdetailsModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width -
                                                30,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}"),
                                                          fit: BoxFit.fill)),
                                                  // child: Image.network("${ApiPath.imgUrl}${accomodationdetailsModel!.data![index].servicesImage![0]}", fit: BoxFit.fill, height: 100, width: 90,
                                                  // ),
                                                ),
                                                SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 130,
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .red),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                  '${accomodationdetailsModel!.data![index].address}'),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Row(
                                                          children: const [
                                                            Text(
                                                              "Status :",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Available',
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                        top: 10.0,
                                                        right: 180,
                                                      ),
                                                      child: Text(
                                                        '\$ ${accomodationdetailsModel!.data![index].mrpPrice}',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                        top: 8.0,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                            child: Text(
                                                              'Move in Date :',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          // SizedBox(width: 1,),
                                                          Text(
                                                            '${accomodationdetailsModel!.data![index].date}',
                                                            style:
                                                            const TextStyle(
                                                              fontSize:
                                                              12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 130.0),
                                                      child: ElevatedButton(
                                                        child: Text('Know More'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  30)),
                                                          primary: CustomColors
                                                              .secondaryColor,
                                                          textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 13,
                                                              fontStyle:
                                                              FontStyle
                                                                  .normal),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestinfoScreens()));
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 228.0,left: 90),
                    //     child: Text('Create A New Request ',style: TextStyle(fontSize: 20,color: CustomColors.primaryColor),),
                    //   ),
                    // ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}