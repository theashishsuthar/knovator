import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detailscreen.dart';
import 'model/user.dart';

class Homescreen extends StatefulWidget {
  final String? token;

  const Homescreen({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
  }

  //A method for getting user-detail

  Future findUser() async {
    var headers = {
      'content-type': 'application/json',
      'Accept-Language': 'en',
      'User-Agent': 'android',
      'X-Install-Type': 'telehealer-india',
      'Content-Type': 'application/json; charset=UTF-8',
      'Host': '44.238.77.66:8082',
      'X-Access-Token': "${widget.token}",
    };

    //Making http request

    final response = await http.get(
        Uri.parse(
          'http://44.238.77.66:8082/api/associations-v2?paginate=true&page=1&page_size=20&medical_assistant=false',
        ),
        headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Homescreen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: FutureBuilder(
                  future: findUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<User> _list = [];
                    if (snapshot.hasData) {
                      snapshot.data!.forEach((element) {
                        User e = User.fromJson(element);
                        _list.add(e);
                      });

                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return DetailsScreen(
                                    url: _list[i].useravatar != null
                                        ? _list[i].useravatar
                                        : "No",
                                    email: _list[i].email,
                                    fav: _list[i].favorite,
                                    firstname: _list[i].firstname,
                                    lastname: _list[i].lastname,
                                    phone: _list[i].phone,
                                    dob: _list[i].dob,
                                    gender: _list[i].gender,
                                    paymentcc: _list[i]
                                        .paymentaccountinfo!['is_cc_captured']
                                        .toString(),
                                    paymentcv: _list[i]
                                        .paymentaccountinfo![
                                            "is_default_card_valid"]
                                        .toString(),
                                  );
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.012,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey[400]!,
                                    )),
                                alignment: Alignment.centerLeft,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: double.infinity,
                                child: ListTile(
                                  trailing: Column(children: [
                                    _list[i].paymentaccountinfo![
                                                    'is_cc_captured'] ==
                                                true &&
                                            _list[i].paymentaccountinfo![
                                                    "is_default_card_valid"] ==
                                                true
                                        ? Icon(
                                            Icons.payment,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.payment,
                                            color: Colors.red,
                                          ),
                                    _list[i].gender == 'male'
                                        ? Icon(
                                            Icons.male,
                                            color: Colors.blue,
                                          )
                                        : Icon(
                                            Icons.female,
                                            color: Colors.red[200],
                                          )
                                  ]),
                                  leading: Stack(
                                    children: [
                                      _list[i].useravatar != null
                                          ? CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              backgroundImage: NetworkImage(
                                                  _list[i].useravatar!),
                                            )
                                          : CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                            ),
                                      _list[i].status == "AVAILABLE"
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.035,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.035,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.035,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.145,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.035,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                            )
                                    ],
                                  ),
                                  title: Text(_list[i].firstname! +
                                      ' ' +
                                      _list[i].lastname!),
                                  subtitle: Text("Dob: " + _list[i].dob!),
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Oops! something went wrong!",
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
