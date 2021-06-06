import 'package:flutter/material.dart';

import 'decoration_box.dart';

double translimit = 1250;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainCard(),
    );
  }
}

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mC,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NMButton(
                    down: false,
                    icon: Icons.arrow_back,
                  ),
                  NMButton(
                    down: false,
                    icon: Icons.search,
                  ),
                ],
              ),
              Text(
                'Main Card',
                style: TextStyle(
                    color: fCD, fontSize: 30, fontWeight: FontWeight.w700),
              ),
              CreditCard(),
              NMCard(
                active: false,
                icon: Icons.wifi,
                label: 'NFD Payment',
              ),
              NMCard(
                active: true,
                icon: Icons.attach_money,
                label: 'Deposit',
              ),
              NMCard(
                active: false,
                icon: Icons.lock_outline,
                label: 'Fast blocking',
              ),
              Transaction(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NMButton(
                    down: false,
                    icon: Icons.home,
                  ),
                  NMButton(
                    down: true,
                    icon: Icons.credit_card,
                  ),
                  NMButton(down: false, icon: Icons.trending_up),
                  NMButton(
                    down: false,
                    icon: Icons.notifications_none,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  const NMButton({this.down, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: down ? nMboxInvert : nMbox,
      child: Icon(
        icon,
        color: down ? fCD : fCL,
      ),
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;
  const NMCard({this.active, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      decoration: nMbox,
      child: Row(
        children: [
          Icon(
            icon,
            color: fCL,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            label,
            style: TextStyle(
                color: fCD, fontWeight: FontWeight.w700, fontSize: 16.0),
          ),
          Spacer(),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 40,
            child: Container(
              margin: active
                  ? EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          )
        ],
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VISA'),
              Icon(
                Icons.more_horiz,
                color: fCD,
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '* * * * ',
                style: TextStyle(
                    color: fCD, fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text('* * * * ',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * * ',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('8014 ',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Holder',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('Noman Akram',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expires',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('09 / 21',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Transaction extends StatefulWidget {
  const Transaction({Key key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction Limit',
              style: TextStyle(
                  color: fCD, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text('Rs :' + translimit.toStringAsFixed(0)),
          ],
        ),
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.green.shade300,
                inactiveTrackColor: fCL.withOpacity(0.25),
                trackHeight: 5.0,
                thumbColor: mCL,
                overlayColor: mCL.withOpacity(0.75)),
            child: Slider(
              value: translimit,
              min: 1,
              max: 3000,
              onChanged: (limitInput) {
                setState(() {
                  translimit = limitInput;
                });
              },
            ))
      ],
    );
  }
}
