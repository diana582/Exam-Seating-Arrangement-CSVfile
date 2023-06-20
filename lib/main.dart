import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp(title: '2D Array Example'));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> list1 = [];
  List<String> list2 = [];
  List<String> batches = ["assets/civil_student_details.csv","assets/eee_student_details.csv","assets/pro_student_details.csv","assets/student_details.csv"];
  var c;

  
  

  Future<void> loadDataFromCSV() async {
    
    final csvData1 = await rootBundle.loadString('assets/pro_student_details.csv');
    final csvData2 = await rootBundle.loadString('assets/student_details.csv');
    

    List<List<dynamic>> rows1 = const CsvToListConverter().convert(csvData1);
    List<List<dynamic>> rows2 = const CsvToListConverter().convert(csvData2);

    for (var row in rows1) {
      if (row.length > 1) {
        list1.add(row[1].toString());
      }
    }

    for (var row in rows2) {
      if (row.length > 1) {
        list2.add(row[1].toString());
      }
    }

    setState(() {}); // Update the UI with the loaded data
  }

  @override
  void initState() {
    super.initState();
    
      loadDataFromCSV();
    
  }

  @override
  Widget build(BuildContext context) {
    if (list1.isEmpty || list2.isEmpty) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Loading Data...'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  List<String> classes = [
    'M401',
    'M402',
    'M403'];
    var index=0;
    var count = 0;
    var count1 = 0;
    List<Widget> items = [];
    List<Widget> items1 = [];
    List<Widget> items2 = [];
    
    while (count < list1.length && count1 < list2.length) {
     
     
     // if(count >= list1.length || count1 >= list2.length )
    //  {
//
    //  }
      //  items.clear();
      //  items1.clear();
      //  items2.clear();
      items.add(Text(classes[index],
     // style: TextStyle(fontWeight: ),
     ),
      );
      index++;
       items.add(SizedBox(height: 100,));
      items.add(SizedBox(height: 100,));
      for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 3; col++) {
          if (col % 2 == 0) {
            int list1Index = count;

            if (list1Index < list1.length) {
              items.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list1[list1Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count++;
            }
          } else {
            int list2Index = count1;
            if (list2Index < list2.length) {
              items.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list2[list2Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count1++;
            }
          }
        }
      }
    
    
    items1.add(SizedBox(height: 100,));
    items1.add(SizedBox(height: 100,));
    items1.add(SizedBox(height: 100,));

      for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 3; col++) {
          if (col % 2 == 0) {
            int list2Index = count1;
            if (list2Index < list2.length) {
              items1.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list2[list2Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count1++;
            }
          } else {
            int list1Index = count;
            if (list1Index < list1.length) {
              items1.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list1[list1Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count++;
            }
          }
        }
      }

    items2.add(SizedBox(height: 100,));
    items2.add(SizedBox(height: 100,));
    items2.add(SizedBox(height: 100,));

      for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 3; col++) {
          if (col % 2 == 0) {
            int list1Index = count;

            if (list1Index < list1.length) {
              items2.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list1[list1Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count++;
            }
          } else {
            int list2Index = count1;
            if (list2Index < list2.length) {
              items2.add(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${list2[list2Index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
              count1++;
            }
          }
        }
      }

    
    }
    
    // print(items);
    // print(items1);
    // print(items2);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('2D Array Example'),
        ),
        body: SingleChildScrollView(
          
          
          child: SizedBox(
            height: 800,
            width: 1500,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          children: items,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          children: items1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          children: items2,
                        ),
                      ),
                    ],
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
