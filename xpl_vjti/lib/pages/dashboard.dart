import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  const dashBoard({super.key});

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        //actions: <Widget>[
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_sharp, color: Colors.black,)),
        title: Text(
          'VJTI',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 50,
            letterSpacing: 7,
            color: Color.fromARGB(255, 124, 5, 5),
          ),),
        
        centerTitle: true,

      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            Container(
              decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      
                     ),
                     height: 200,
                     width: 371,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                        Align(
                        alignment: Alignment.center,
                         child: Text(
                                   'Welcome\n<name>',
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                
                                       ),
                       ),
                     

                  Image.asset(
                    'assets/VJTIlogoforappbar.jpeg',
                    height: 200,
                    )
                  
                ],
              ),
            ),
            SizedBox(height: 30),




            // Stack(
            //   children: <Widget>[
            //     //SizedBox(height: 20),
            //     Padding(
            //       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            //       child: Center(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: ExactAssetImage('assets/VJTI.png'),
            //               fit: BoxFit.fill,
            //             ),
            //             borderRadius: BorderRadius.all(Radius.circular(50)),
            //             color: Colors.transparent,
            //             border: Border.all(width: 5),

            //           ),

            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: Colors.white.withOpacity(0.38),
            //               borderRadius: BorderRadius.all(Radius.circular(40)),
            //             ),
            //             child: Padding(
            //               padding: EdgeInsets.fromLTRB(250, 0, 0, 0),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   //color: Colors.transparent,
            //                   shape: BoxShape.circle,
            //                   image: DecorationImage(
            //                     image: ExactAssetImage('assets/profilePic.jpg'),
            //                     fit: BoxFit.cover,
            //                   ),
            //                   border: Border.all(
            //                     width: 0,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           height: 150,
            //           width: 384,
            //         ),
            //       ),
            //     ),
            //     Align(
            //       alignment: Alignment(-0.7,0.9),
            //       child: SizedBox(
            //         height: 200,
            //         width: 300,
            //         child: Align(
            //           alignment: Alignment(-1.1,-0.3),
            //           child: Text(
            //              '  Welcome!!',
            //             maxLines: 2,
            //             overflow: TextOverflow.fade,
            //             style: TextStyle(
            //               fontSize: 30,
            //               fontFamily: 'Poppins',
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),


              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SENIORS' ADVICE
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // 
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/advice.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Seniors\' Advice',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 70),
                  // EXTRA CURRICULARS
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // 
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/extracurriculars.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Extra Curriculars',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  
                  
                ],
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NOTES & PYQS
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // 
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/notespyqs.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Notes & PYQs',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 70),
                  // ABOUT VJTI
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushNamed(context, '/aboutVJTI');
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/about.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'About VJTI',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GALLERY
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // 
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/gallery.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 70),
                  // HOW TO GET VJTI
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        // 
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/howtoget.png',
                                height: 100,
                                width: 100,
                                ),
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'How to get VJTI',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
