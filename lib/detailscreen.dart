import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String? url;
  final String? fav;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? dob;
  final String? gender;
  final String? paymentcc;
  final String? paymentcv;

  const DetailsScreen({
    Key? key,
    this.url,
    this.email,
    this.fav,
    this.firstname,
    this.lastname,
    this.phone,
    this.dob,
    this.gender,
    this.paymentcc,
    this.paymentcv,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextStyle textStyle() {
    return TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            color: Colors.orange,
          ),
          showUnselectedLabels: true,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.orange,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
              ),
              title: Text(
                'call',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              title: Text(
                'Chat',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              title: Text(
                'Schedule',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.upload_file,
              ),
              title: Text(
                'Upload',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
          ]),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool isindexed) {
            return [
              SliverAppBar(
                centerTitle: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.06,
                title: Text(widget.firstname! + " " + widget.lastname!),
                backgroundColor: Colors.orange,
                // snap: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: widget.fav == 'true'
                        ? Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                  )
                ],

                pinned: true,
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    tabs: [
                      Text('About', style: textStyle()),
                      Text('Vitals', style: textStyle()),
                      Text('Document', style: textStyle()),
                      Text('Visits', style: textStyle()),
                      Text('Orders', style: textStyle())
                    ]),
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  title: Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.firstname!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              widget.lastname!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Dob: ' + widget.dob!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Column(children: [
                          widget.fav == 'true'
                              ? Icon(
                                  Icons.payment,
                                  color: Colors.green[300],
                                  size: 17,
                                )
                              : Icon(
                                  Icons.payment,
                                  color: Colors.red[500],
                                  size: 17,
                                ),
                          widget.gender == 'male'
                              ? Icon(
                                  Icons.male,
                                  color: Colors.blue[200],
                                )
                              : Icon(
                                  Icons.female,
                                  color: Colors.red[500],
                                ),
                        ]),
                      ],
                    ),
                  ),
                  background: widget.url != 'No'
                      ? Image.network(
                          widget.url!,
                          fit: BoxFit.fill,
                        )
                      : Container(
                          color: Colors.black12,
                        ),
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Health summary',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.picture_as_pdf,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Payment method',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('cash'),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.email!),
                              Icon(
                                Icons.email,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.phone!),
                              Icon(
                                Icons.phone,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        'disconnect',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
            Container(),
            Container(),
            Container(),
          ]),
        ),
      ),
    );
  }
}
