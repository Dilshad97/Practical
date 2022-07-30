import 'package:flutter/material.dart';
import 'package:practical3d/bloc/add_new_record_bloc.dart';
import 'package:practical3d/widget/app_button.dart';
import 'package:practical3d/widget/input_field.dart';

class AddNewRecord extends StatefulWidget {
  AddNewRecord(
      {Key? key,
      this.name,
      this.englishMarks,
      this.mathsMarks,
      this.scienceMarks,
      this.isUpdate,
      this.index})
      : super(key: key);
  final String? name;
  bool? isUpdate = false;
  final String? mathsMarks;
  final String? scienceMarks;
  final String? englishMarks;
  final int? index;

  @override
  State<AddNewRecord> createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  String? name;
  String? mathsMarks;
  String? scienceMarks;
  String? englishMarks;
  final addNewBloc = AddNewRecordsBloc.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    name = widget.name;
    englishMarks = widget.englishMarks;
    scienceMarks = widget.scienceMarks;
    mathsMarks = widget.mathsMarks;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Name"),
                AppInputField(
                  initialValue: widget.name,
                  onChanged: (value) {
                    name = value;
                  },
                  hintName: "Name",
                ),
                const Text("Maths Marks"),
                AppInputField(
                  inputType: TextInputType.number,
                  initialValue: widget.mathsMarks,
                  onChanged: (value) {
                    mathsMarks = value;
                  },
                  hintName: "Maths Marks",
                ),
                const Text("Science Marks"),
                AppInputField(
                  inputType: TextInputType.number,
                  initialValue: widget.scienceMarks,
                  onChanged: (value) {
                    scienceMarks = value;
                  },
                  hintName: "Science Marks",
                ),
                const Text("English Marks"),
                AppInputField(
                  inputType: TextInputType.number,
                  initialValue: widget.englishMarks,
                  onChanged: (value) {
                    englishMarks = value;
                  },
                  hintName: "English Marks",
                ),
                widget.isUpdate == false
                    ? Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          height: 32,
                          width: 88,
                          buttonCircular: 4,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              double? maths = double.tryParse(mathsMarks ?? "");
                              double? eng = double.tryParse(englishMarks ?? "");
                              double? science =
                                  double.tryParse(scienceMarks ?? "");
                              var percent = maths! + eng! + science!;
                              double percentage = percent / 300 * 100;
                              addNewBloc.addRecords(
                                  englishMarks: englishMarks,
                                  name: name,
                                  mathsMarks: mathsMarks,
                                  scienceMarks: scienceMarks,
                                  percentage: percentage.toString());

                              Navigator.pop(context);
                            }
                          },
                          text: "Add",
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          height: 32,
                          width: 88,
                          buttonCircular: 4,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              double? maths = double.tryParse(mathsMarks ?? "");
                              double? eng = double.tryParse(englishMarks ?? "");
                              double? science =
                              double.tryParse(scienceMarks ?? "");
                              var percent = maths! + eng! + science!;
                              double percentage = percent / 300 * 100;
                              addNewBloc.editRecord(
                                  englishMarks: englishMarks,
                                  name: name,
                                  mathsMarks: mathsMarks,
                                  scienceMarks: scienceMarks,
                                  index:widget.index,
                                  percentage: percentage.toString());

                              Navigator.pop(context);
                            }
                          },
                          text: "Update",
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
