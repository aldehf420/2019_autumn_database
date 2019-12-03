import 'package:date_format/date_format.dart';
import 'package:dbapp/src/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbapp/src/test_movie_buy.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:dbapp/src/my.dart';

import 'data/sign_in.dart';

class Screen_purchase extends StatefulWidget {
  List<String> select_list;
  List<String> select_list_rank;
  DocumentSnapshot document_movie; // movie.docuemnt
  DocumentSnapshot document_table;//
  int money;// time_table.document

  Screen_purchase(List<String> getlist, List<String> getlist_2,
      DocumentSnapshot getmovie, DocumentSnapshot gettable, int getmoney) {
    select_list = getlist;
    select_list_rank = getlist_2;
    document_movie = getmovie;
    document_table = gettable;
    money = getmoney;

  }

  @override
  _Screen_purchaseState createState() => _Screen_purchaseState();
}

class _Screen_purchaseState extends State<Screen_purchase> {
  final db = Firestore.instance;

  int price;
  int mileage;

  List<String> list = ['Aa', "Bb"];

  String x = "none11";

  var i;

  var j;

  List<List<String>> mylist = [[], [], [], [], [], [], [], [], [], []];

  String seat;

  List<String> select = [];

  @override
  Widget build(BuildContext context) {
//    global_time_table_ID = document_table.documentID;
//    print(global_time_table_ID);
//    global_select_list = select_list;
//    know = "correct";
    for (i = 0; i < 10; i++) {
      for (j = 0; j < 10; j++) {
        if (i == 0) {
          seat = "A" + j.toString();
        } else if (i == 1) {
          seat = "B" + j.toString();
        } else if (i == 2) {
          seat = "C" + j.toString();
        } else if (i == 3) {
          seat = "D" + j.toString();
        } else if (i == 4) {
          seat = "E" + j.toString();
        } else if (i == 5) {
          seat = "F" + j.toString();
        } else if (i == 6) {
          seat = "G" + j.toString();
        } else if (i == 7) {
          seat = "H" + j.toString();
        } else if (i == 8) {
          seat = "I" + j.toString();
        } else if (i == 9) {
          seat = "J" + j.toString();
        } else if (i == 10) {
          seat = "K" + j.toString();
        } else {
          seat = "L" + j.toString();
        }
        mylist[i].add(seat);
      }
    }

    return Scaffold(
      body: Start(context, widget.select_list, widget.select_list_rank),
    );
  }

  Widget Start(BuildContext ctx, List<String> se_li, List<String> se_li_ra) {
    List<String> test = se_li;
    List<String> test2 = se_li_ra;
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: double.parse((widget.money).toString()));
//    print(fmf);

//    print("여기가ㅏ각 ");
//    final timeStamp = document_table['startAt'].millisecondsSinceEpoch;
//    print("timeStamp:$timeStamp");
//    String time2 = formatDate(timeStamp, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]);

//    print(time2);
//
//    Timestamp a = document_table['startAt'];
//    String formatted = formatTime(document_table['startAt'].toData().subtract(Duration(hours: 2)).millisecondsSinceEpoch);
//    print(a.seconds);
//    print(a);
//
//    print((document_table['startAt']));
//    print("adfdkjfkd");
//    print(formatted);
    String time = formatDate((widget.document_table['startAt']).toDate(),
        [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]);
////    print(formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]));

    List<String> sub = [];
    for (var i = 0; i < widget.select_list.length; i++) {
      sub.add(widget.select_list[i]);
    }

    List<String> sub2 = [];
    for (var i = 0; i < widget.select_list.length; i++) {
      sub2.add(widget.select_list_rank[i]);
    }

    List<String> sort_array = [];
    for (var i = 0; i < widget.select_list.length; i++) {
      sort_array.add(widget.select_list[i]);
    }

    sort_array.sort((String l, String r) {
      return l.compareTo(r);
    });

    Color bor = Colors.blue;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "결제",
        textAlign: TextAlign.center,
      )),
      body: Column(
        children: <Widget>[
          Container(
            child: // 전체
                Column(
              children: <Widget>[
                Container(
                  child: // 포스터 + 정보
                      Row(
                    children: <Widget>[
                      Container(
                        child: // 포스터
                            Image.network(
                          widget.document_movie['img'],
                          fit: BoxFit.cover,
//                      height: MediaQuery.of(ctx).size.height * 0.2,
//                      width: MediaQuery.of(ctx).size.height * 0.2,
                        ),
                        width: MediaQuery.of(ctx).size.width * 0.35,
                        height: MediaQuery.of(ctx).size.height * 0.3,
                        margin: EdgeInsets.only(left: 15),
//                        height: 300,
//                        decoration: BoxDecoration(
//                          border: Border.all(width: 2, color: Colors.red),
//                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(ctx).size.width * 0.53,
                                height: MediaQuery.of(ctx).size.height * 0.25,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 2, color: bor),
//                           ),
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        widget.document_movie['name'],
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        widget.document_movie['en_name'],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 17),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        widget.select_list.length.toString() + "명",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "본점 " + widget.document_table['theater'] + "관",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )),
                            Container(
                              width: MediaQuery.of(ctx).size.width * 0.53,
//                         height: MediaQuery.of(ctx).size.height * 0.25,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2, color: bor),
//                         ),
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                fmf.output.withoutFractionDigits + " 원",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
//                  decoration: BoxDecoration(
//                    border: Border.all(width: 2, color: bor),
//                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 40),
          ),
          Container(
              margin : EdgeInsets.only(top : 18, bottom : 10),
              width: MediaQuery.of(context).size.width * 0.9, // 제품사진
              decoration: BoxDecoration(
              border: Border(
                bottom:
                BorderSide(width: 1.0, color: Colors.grey[400]),
              ),),


            ),
          Load_user_data(ctx),
//          Container(child: Text(this.document_member['email']),),
          Expanded(
              child: Row(
            children: <Widget>[
              Container(
                child: InkWell(
                  onTap: () async {
                    print("sdffsfdsds : "+'$name');
                    print('$name' == null);
                    await db.collection('payment_movie').add({
                            'memberID': name,
                            'email': email,
                            'movieID': widget.document_movie.documentID,
                            'time_tableID': widget.document_table.documentID,
                            'seats': sort_array,
                            'payTime': Timestamp.now(),
                          });
                    // 선택한 좌석 firebase 변경
                    for (var i = 0; i < sub.length; i++) {
                      Firestore.instance
                          .collection("time_table")
                          .document(widget.document_table.documentID)
                          .collection('seats')
                          .document('1')
                          .updateData({
                        sub[i]: <String, dynamic>{
                          'number': "0",
                          'type': sub2[i],
                        }
                      });
                    }
                    Firestore.instance
                        .collection("time_table")
                        .document(widget.document_table.documentID)
                        .updateData({
                      'select_count':
                          widget.document_table['select_count'] + sub.length
                    });
                    Navigator.of(ctx).push(MaterialPageRoute(
                        builder: (context) => Payment(price)));

//                    Navigator.of(ctx).push( MaterialPageRoute(builder: (context) => Payment(select_list,document_table, price)));
                    },
                  child: Text(
                    "결제하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.red,
                width: MediaQuery.of(ctx).size.width * 1,
                height: 60,
                alignment: Alignment(0, 0),
                //              height: MediaQuery.of(ctx).size.height * 0.3,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
          ))
        ],
      ),
    );
  }

  Widget make_title(str) {
    return Text(
      str,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    );
  }

  Widget make_detail(str) {
    return Text(
      str,
      style: TextStyle(
        fontSize: 17,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget Load_user_data(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('member').where("email" , isEqualTo: "kuran0415@gmail.com")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error : ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new Wrap(
//                  itemExtent: 80,
                  children: snapshot.data.documents
                      .map((document) => Make_mileage_box(context, document))
                      .toList(),
                );
            }
          }
    );
  }

  @override
  Widget Make_mileage_box(BuildContext context, DocumentSnapshot document){
    return Container(child: Row(children: <Widget>[
    Container(
      margin : EdgeInsets.only(left : 20),
        child:
    Text("마일리지", style: TextStyle(
      fontSize: 15,
    ),),),

    //Text("총액 : " + (widget.money - document['Mileage']).toString()),
      Expanded(child:
      InkWell(
          onTap: () {
            setState(() {
             if(document['Mileage'] == 0 || this.mileage != 0){// 마일리가 없음
                showDialog2("마일리지 잔액이 없습니다");
             }
             else{
               widget.money = widget.money - document['Mileage'];
               this.mileage = document['Mileage'];
               showDialog2("마일리지가 사용되었습니다");
             }
            });
          },
          child: Container(

            margin: EdgeInsets.only(right : 20),
              alignment: Alignment.centerRight,
              width: 200,
              height: 40,
//              decoration: BoxDecoration(
////                shape: BoxShape.circle,
//                border: Border.all(width: 2, color: Colors.black),
//              ),
//                  child: Icon(Icons.expand_more),
              child: Text(
                document['Mileage'].toString() + " 포인트",
                style: TextStyle(
                  fontSize: 15,
                ),
              )))
          ,)
    ],));
  }



//  void showDialog_ok(BuildContext context, String str) {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return CupertinoAlertDialog(
//          title: new Text("확인"),
//          content: new Text(str),
//          actions: <Widget>[
//            // usually buttons at the bottom of the dialog
//            new FlatButton(
//              child: new Text("예"),
//              onPressed: () async {
//                setState(() {
//                  widget.select.update(name, (dynamic val) => 0);
//                  widget.select.remove([name]);
//                });
//                Navigator.of(context).pop();
//              },
//              textColor: Colors.blue,
//            ),
//            new FlatButton(
//              child: new Text("아니요"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//              textColor: Colors.red,
//            ),
//          ],
//        );
//      },
//    );
//
//  }

  void showDialog2(str) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Message"),
              content: new Text(
                str,
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text("닫기"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}

