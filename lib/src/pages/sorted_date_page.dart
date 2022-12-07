import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lift_gear_view.dart';

class SortedDatePage extends StatefulWidget {
  const SortedDatePage({Key? key}) : super(key: key);

  @override
  State<SortedDatePage> createState() => _SortedDatePageState();
}

final liftingFormkey = GlobalKey<FormState>();
var pickdate = "";
var pickdate2 = "";
var pickdate3 = "";
var pickdate4 = "";

final proofload = TextEditingController();
final dtlex = TextEditingController();
var dtnex = TextEditingController();
final lstplt = TextEditingController();
final nxtplt = TextEditingController();

Widget proofloadField() {
  return TextFormField(
    style: TextStyle(fontSize: 11),
    controller: proofload,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      disabledBorder: InputBorder.none,
      focusColor: Colors.white,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      filled: true,
      fillColor: Colors.white,
      label: Text(
        "Proof Load Test",
        style: GoogleFonts.inter(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5)),
    ),
    validator: (value) {
      if (value == null) {
        return "required";
      } else if (value.length <= 3) {
        return "4 character required ";
      }
      null;
    },
  );
}

Widget dtlexField() {
  return TextFormField(
    style: TextStyle(fontSize: 11),
    controller: dtlex,
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      disabledBorder: InputBorder.none,
      focusColor: Colors.white,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      filled: true,
      fillColor: Colors.white,
      label: Text(
        "Date of Last Examination",
        style: GoogleFonts.inter(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5)),
    ),
    validator: (value) {
      if (value == null) {
        return "required";
      } else if (value.length <= 3) {
        return "4 character required ";
      }
      null;
    },
  );
}

class _SortedDatePageState extends State<SortedDatePage> {
  List<String> InspectionFreq = [
    'Inspection Frequency',
    '1 month',
    '2 months',
    '3 months',
    '4 months',
    '5 months',
    '6 months',
    '7 months',
    '8 months',
    '9 months',
    '10 months',
    '11 months',
    '12 months',
  ];
  String? checklist5 = 'Inspection Frequency';

  List<String> ProofLoadFreq = [
    'Proof Load Test Frequency',
    '12 months',
    '48 months',
    'Not Applicable',
  ];
  String? checklist6 = 'Proof Load Test Frequency';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: 313,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0XFFECE9E6),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: liftingFormkey,
                      child: Column(
                        children: [
                          SizedBox(
                            // child: Text('below Inspection Freequency'),
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: DropdownButtonFormField<String>(
                              style: TextStyle(fontSize: 11),
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              value: 'Inspection Frequency',
                              items: InspectionFreq.map((item) =>
                                  DropdownMenuItem<String>(
                                      value: item, child: Text(item))).toList(),
                              onChanged: (item) =>
                                  setState(() => checklist5 = item),
                            ),
                          ),
                          SizedBox(
                            // child: Text('below Proof load test Freequency'),
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: DropdownButtonFormField<String>(
                              style: TextStyle(fontSize: 11),
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              value: 'Proof Load Test Frequency',
                              items: ProofLoadFreq.map((item) =>
                                  DropdownMenuItem<String>(
                                      value: item, child: Text(item))).toList(),
                              onChanged: (item) =>
                                  setState(() => checklist6 = item),
                            ),
                          ),
                          SizedBox(
                            // child: Text('below '),
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              style: TextStyle(fontSize: 11),
                              controller: dtlex,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                suffixIcon:
                                    Icon(Icons.today, color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                disabledBorder: InputBorder.none,
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Date of Last Examination",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                DateTime? pickdate2 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (pickdate2 != null) {
                                  setState(() {
                                    dtlex.text = DateFormat('dd-MM-yyyy')
                                        .format(pickdate2);
                                  });
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "required";
                                } else if (value.length <= 3) {
                                  return "Please Enter the Correct Date ";
                                }
                                null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              style: TextStyle(fontSize: 11),
                              controller: dtnex,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                suffixIcon:
                                    Icon(Icons.today, color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                disabledBorder: InputBorder.none,
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Date of Next Examination",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                switch (checklist5) {
                                  case '1 month':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 1,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 1,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 1,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '2 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 2,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 2,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 2,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '3 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 3,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 3,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 3,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '4 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 4,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 4,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 4,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '5 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 5,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 5,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 5,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '6 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 6,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 6,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 6,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '7 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 7,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 7,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 7,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '8 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 8,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 8,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 8,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '9 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 9,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 9,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 9,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '10 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 10,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 10,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 10,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '11 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 11,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 11,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 11,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                  case '12 months':
                                    DateTime? pickdate3 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 12,
                                            DateTime.now().day),
                                        firstDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 12,
                                            DateTime.now().day),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month + 12,
                                            DateTime.now().day));
                                    if (pickdate3 != null) {
                                      setState(() {
                                        dtnex.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate3);
                                      });
                                    }
                                    break;
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "required";
                                } else if (value.length <= 3) {
                                  return "Please Enter the Correct Date ";
                                }
                                null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              style: TextStyle(fontSize: 11),
                              controller: lstplt,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                suffixIcon:
                                    Icon(Icons.today, color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                disabledBorder: InputBorder.none,
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Date of Last Proof Load Test",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                DateTime? pickdate4 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (pickdate4 != null) {
                                  setState(() {
                                    lstplt.text = DateFormat('dd-MM-yyyy')
                                        .format(pickdate4);
                                  });
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "required";
                                } else if (value.length <= 3) {
                                  return "Please Enter the Correct Date ";
                                }
                                null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                              style: TextStyle(fontSize: 11),
                              controller: nxtplt,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                suffixIcon:
                                    Icon(Icons.today, color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                disabledBorder: InputBorder.none,
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Date of Next Proof Load Test",
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onTap: () async {
                                DateTime date =
                                    DateFormat('dd-MM-yyyy').parse(lstplt.text);
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                switch (checklist6) {
                                  case '12 months':
                                    DateTime? pickdate5 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(date.year,
                                            date.month + 12, date.day),
                                        firstDate: DateTime(date.year,
                                            date.month + 12, date.day),
                                        lastDate: DateTime(date.year,
                                            date.month + 12, date.day));
                                    if (pickdate5 != null) {
                                      setState(() {
                                        nxtplt.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate5);
                                      });
                                    }
                                    break;
                                  case '48 months':
                                    DateTime? pickdate5 = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(date.year,
                                            date.month + 48, date.day),
                                        firstDate: DateTime(date.year,
                                            date.month + 48, date.day),
                                        lastDate: DateTime(date.year,
                                            date.month + 48, date.day));
                                    if (pickdate5 != null) {
                                      setState(() {
                                        nxtplt.text = DateFormat('dd-MM-yyyy')
                                            .format(pickdate5);
                                      });
                                    }
                                    break;
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "required";
                                } else if (value.length <= 3) {
                                  return "Please Enter the Correct Date ";
                                }
                                null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSave(BuildContext context) async {
    final sharedPrefsProofLoad = await SharedPreferences.getInstance();
    final sharedPrefsDtLEx = await SharedPreferences.getInstance();
    final sharedPrefsDtNEx = await SharedPreferences.getInstance();
    final sharedPrefsLstPLT = await SharedPreferences.getInstance();
    final sharedPrefsNxtPLT = await SharedPreferences.getInstance();
    final sharedPrefsInsTyp = await SharedPreferences.getInstance();
    final sharedPrefsPrfLodFrq = await SharedPreferences.getInstance();

    await sharedPrefsProofLoad.setString('Proof_Load', proofload.text);
    await sharedPrefsDtLEx.setString('DtLEx', dtlex.text);
    await sharedPrefsDtNEx.setString('DtNEx', dtnex.text);
    await sharedPrefsLstPLT.setString('LstPLT', lstplt.text);
    await sharedPrefsNxtPLT.setString('NxtPLT', nxtplt.text);
    await sharedPrefsPrfLodFrq.setString('PrfLod_Frq', checklist6.toString());

    getSavedata(context);
  }

  Future<void> getSavedata(BuildContext context) async {
    final sharedPrefsDtLEx = await SharedPreferences.getInstance();
    final sharedPrefsDtNEx = await SharedPreferences.getInstance();
    final sharedPrefsLstPLT = await SharedPreferences.getInstance();
    final sharedPrefsNxtPLT = await SharedPreferences.getInstance();
    final sharedPrefsInspFreq = await SharedPreferences.getInstance();
    final sharedPrefsPrfLodFrq = await SharedPreferences.getInstance();

    final Dtlex = await sharedPrefsDtLEx.getString('DtLEx');
    final Dtnex = await sharedPrefsDtNEx.getString('DtNEx');
    final LstPLT = await sharedPrefsLstPLT.getString('LstPLT');
    final NxtPLT = await sharedPrefsNxtPLT.getString('NxtPLT');
    final InspFreq = await sharedPrefsInspFreq.getString('Insp_Freq');
    final PrfLodFrq = await sharedPrefsPrfLodFrq.getString('PrfLod_Frq');

    if (Dtlex != null ||
        Dtnex != null ||
        LstPLT != null ||
        NxtPLT != null ||
        InspFreq != null ||
        PrfLodFrq != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LiftGearView()));
    }
  }
}
