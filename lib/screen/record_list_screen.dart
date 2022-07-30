import 'package:flutter/material.dart';
import 'package:practical3d/bloc/add_new_record_bloc.dart';
import 'package:practical3d/screen/add_new_record.dart';
import 'package:practical3d/widget/app_button.dart';

class RecordListScreen extends StatefulWidget {
  const RecordListScreen({Key? key}) : super(key: key);

  @override
  State<RecordListScreen> createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  final addnewBloc = AddNewRecordsBloc.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          height: 40,
          width: MediaQuery.of(context).size.width,
          text: "Add New Record",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewRecord(
                    isUpdate: false,
                  ),
                ));
          },
        ),
      ),
      appBar: AppBar(
        title: const Text("Records Screen"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: addnewBloc.newrecords.stream,
          builder: (context, snapshot) {
            print("Snapshot data");
            print(snapshot.data);

            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return snapshot.data?[index]['name']!=null?Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name :  ${snapshot.data?[index]['name']}"),
                        Text("Maths Marks : ${snapshot.data?[index]['maths']}"),
                        Text(
                            "English Marks  :${snapshot.data?[index]['english']} "),
                        Text(
                            "Science Marks  : ${snapshot.data?[index]['science']}"),
                        Text(
                            "Percentage  : ${snapshot.data?[index]['percentage']}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              height: 32,
                              width: 88,
                              buttonCircular: 4,
                              text: "Edit",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNewRecord(
                                        index: index,
                                        scienceMarks: snapshot.data?[index]
                                            ['science'],
                                        name: snapshot.data?[index]['name'],
                                        englishMarks: snapshot.data?[index]
                                            ['english'],
                                        mathsMarks: snapshot.data?[index]
                                            ['maths'],
                                      ),
                                    ));
                              },
                            ),
                            AppButton(
                              height: 32,
                              width: 88,
                              buttonCircular: 4,
                              text: "Delete",
                              onPressed: () {
                                setState(() {});
                                addnewBloc.deleteRecords(index);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ):Center();
              },
            );
          }),
    );
  }
}
