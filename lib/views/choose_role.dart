import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  
  // final textEditController = TextEditingController();
  String _chooseRole = "";
  final String _role = "";

  @override
  void dispose() {
    // textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // main
    return MaterialApp(
      title: 'Choose Role Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF005555),
          title: const Text('Choose Role Page'), // judul di header app
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset("images/logo_lendid.png", height: 150,),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(10),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text( 
                'Pilih Peran',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              ),
            
            const Text( 
              'Silakan pilih peran Anda dalam aplikasi.',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 102, 102, 102)
              ),
            ),  

            const Padding(
              padding: EdgeInsets.all(10),
              
              ),

            InkWell(
              onTap: (){
                setState(() {
                _chooseRole = "UMKM";
                });},
              child: Ink(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Color(0xFF069A8E),),
                height: 120,
                width: 180,
                // color: Color(0xFF069A8E),
                padding: const EdgeInsets.all(10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_people, size: 80, color: Colors.white,),
                    Text('UMKM', style: TextStyle(color: Colors.white)),
                  ],
              ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(5),
              
              ),

            InkWell(
              onTap: (){
                setState(() {
                _chooseRole = "Investor";
                });},
              child: Ink(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Color(0xFF069A8E),),
                height: 120,
                width: 180,
                // color: Color(0xFF069A8E),
                padding: const EdgeInsets.all(10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.money_sharp, size: 80, color: Colors.white,),
                    Text('Investor', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Padding(
            //     padding: EdgeInsets.all(20),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         setState(() {
            //           _role = _chooseRole;
            //         });
            //       },
            //       child: const Text('SIGN UP'),
            //     ),
            //   ),
           
            Text(
               'Halo role kamu $_chooseRole',
                style: const TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 120, 214, 13)
                ),
            ),
            
            
          ]
        ),
      )
      )
    );
  }
}