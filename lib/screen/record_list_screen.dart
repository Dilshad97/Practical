import 'package:flutter/material.dart';
import 'package:practical3d/bloc/add_new_record_bloc.dart';
import 'package:practical3d/screen/add_new_record.dart';
import 'package:practical3d/state/record_list_state.dart';
import 'package:practical3d/widget/app_button.dart';

class RecordListScreen extends StatefulWidget {
  const RecordListScreen({Key? key}) : super(key: key);

  @override
  State<RecordListScreen> createState() => _RecordListScreenState();
}

class _RecordListScreenState extends State<RecordListScreen> {
  final addnewBloc = AddNewRecordsBloc();

  @override
  void initState() {
    super.initState();
    addnewBloc.getStudentsList();
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
      body: StreamBuilder<RecordListState>(
        stream: addnewBloc.studentState,
        builder: (context, snapshot) {
          RecordListState? state = snapshot.data;
          if (state?.isLoading() ?? false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ${state?.data![index].name}"),
                      Text("Maths Marks : ${state?.data![index].maths}"),
                      Text("English Marks  : ${state?.data![index].english}"),
                      Text("Science Marks  : ${state?.data![index].science}"),
                      Text(
                          "Percentage  : ${state?.data![index].percentage ?? ''}"),
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
                                      englishMarks: state?.data![index].english,
                                      isUpdate: true,
                                      updateId: state?.data![index].updateId,
                                      mathsMarks: state?.data![index].maths,
                                      name: state?.data![index].name,
                                      scienceMarks: state?.data![index].science,
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
                              addnewBloc.deleteRecord(
                                  deleteId: state?.data![index].updateId);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
