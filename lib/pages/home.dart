import 'package:flutter/material.dart'; //erre a libre szükség van

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState(); //state object létrehozása
}

class _HomeState extends State<Home> { //ez a state object

  Map data = {};

  @override
  Widget build(BuildContext context) {

    try{
      data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e){
      data = data;
    }
    print(data);

    final  String? bgImage = (data?['isDayTime'] ?? false) ? 'day.png' : 'night.png';
    final Color? bgColor =  (data?['isDayTime'] ?? false) ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea( //olyan területen jeleníti meg a widgetet, ahol jól látható
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location'); //az egyik route nevét használjuk, amelyre váltunk gombnyomásra
                      setState((){
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'isDaytime' : result['isDaytime'],
                          'flag' : result['flag']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
