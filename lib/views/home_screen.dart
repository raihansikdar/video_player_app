import 'package:flutter/material.dart';
import 'package:video_player_app/utility/custom_size_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Videos',
          style: TextStyle(
            color: Color(0xFF1A202C),
            fontSize: 20.rSp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.rSp),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              borderOnForeground: true,
              elevation: 1,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white, // Set the border color to black
                  width: 1,
                ),
                borderRadius: BorderRadius.zero, // Optional: Set border radius to zero or adjust as needed
              ),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 16/9,
                    child: Image.asset('assets/images/video_image.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.rSp),
                    child: Row(
                      children: [
                        Container(
                          width: 40.rw,
                          height: 40.rh,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),

                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        SizedBox(width: 10.rw,),
                        Expanded(
                          child: Text(
                            'আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান',
                            maxLines: 4,
                             overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF1A202C),
                              fontSize: 15.rSp,
                              fontFamily: 'Hind Siliguri',
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.rw,),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 76.rSp,top: 10.rSp,bottom: 16.rSp,right: 16.rSp),
                    child: Row(
                      children: [
                        Text(
                          '53,245 views  .   ',
                          style: TextStyle(
                            color: Color(0xFF718096),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                            letterSpacing: -0.26,
                          ),
                        ),
                        Text(
                          'Feb 21, 2021',
                          style: TextStyle(
                            color: Color(0xFF718096),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                            letterSpacing: -0.26,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}
