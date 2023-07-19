import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vicoba_app_final_year_project/Bank/LoanRequest.dart';
import 'package:vicoba_app_final_year_project/payyment/data/model/add_date.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  var history;
  final box = Hive.box<Add_data>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 350, child: _head()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Groups Transactions Request',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          history = box.values.toList()[index];
                          return getList(history, index);
                        },
                        childCount: box.length,
                      ),
                    )
                  ],
                );
              })),
    );
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      onTap: (){
        Get.to(() => request());
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/group1.png', height: 40),
      ),
      title: Text(
        history.Select_payment_type,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        history.Amount,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: history.Select_transaction_type == 'Income' ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    Colors.black,
                    Colors.orange,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 65,
                    left: 320,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 80,
                        width: 80,
                        child:Image(image: AssetImage('images/group1.png'),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VICOBA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Village Communication Bank',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Bank Employee Position',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                         child:Container(
                           margin: const EdgeInsets.only(right: 0.5,),
                           child: Text(
                              'Employee name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                         ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // Positioned(
        //   top: 140,
        //   left: 37,
        //   child: Container(
        //     height: 170,
        //     width: 320,
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black12,
        //           offset: Offset(0, 6),
        //           blurRadius: 12,
        //           spreadRadius: 6,
        //         ),
        //       ],
        //       gradient: LinearGradient(
        //         colors:[
        //           Colors.orange,
        //           Colors.black,
        //         ],
        //       ),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Column(
        //       children: [
        //         SizedBox(height: 10),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 15),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'Total Balance',
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 16,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //               Icon(
        //                 Icons.more_horiz,
        //                 color: Colors.white,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 7),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 15),
        //           child: Row(
        //             children: [
        //               Text(
        //                 '\Tsh ${total()}',
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 25,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 25),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 15),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 13,
        //                     backgroundColor: Colors.black12,
        //                     child: Icon(
        //                       Icons.arrow_downward,
        //                       color: Colors.black,
        //                       size: 19,
        //                     ),
        //                   ),
        //                   SizedBox(width: 7),
        //                   Text(
        //                     'Income',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: Colors.black,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 13,
        //                     backgroundColor: Colors.black12,
        //                     child: Icon(
        //                       Icons.arrow_upward,
        //                       color: Colors.white,
        //                       size: 19,
        //                     ),
        //                   ),
        //                   SizedBox(width: 7),
        //                   Text(
        //                     'Expenses',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 6),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 30),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 '\Tsh ${income()}',
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.w600,
        //                   fontSize: 17,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //               Text(
        //                 '\Tsh ${expenses()}',
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.w600,
        //                   fontSize: 17,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
