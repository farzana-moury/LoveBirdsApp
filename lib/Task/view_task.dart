import 'package:flutter/material.dart';
import 'package:lovebirds_app/helper/constants.dart';

import 'edit_task.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewTask();
  }
}

class _ViewTask extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
        backgroundColor: Constants.lightPrimary,
        titleTextStyle: Constants.appBarStyle,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Card(
              shadowColor: Colors.grey,
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero)),
                      margin: EdgeInsets.zero,
                      color: Constants.lightSecondary,
                      child: ListTile(
                        title: const Text("Walter\'s Task",
                            textAlign: TextAlign.center,
                            style: Constants.cardHeaderStyle),
                        trailing: IconButton(
                          onPressed: () {
                            // Jump to edit screen
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditTask(),
                            ));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      )),

                  //Task Name
                  Constants.sectionPadding,
                  const Text("Task", style: Constants.taskHeading),
                  Constants.formPadding,
                  const Text("Buy a Wedding Dress",
                      style: Constants.cardContentStyle),
                  Constants.taskPadding,

                  //Due Date of Task
                  const Text("Due Date", style: Constants.taskHeading),
                  Constants.formPadding,
                  const Text("January 13th, 2022",
                      style: Constants.cardContentStyle),
                  Constants.taskPadding,

                  //Description of Task
                  const Text("Description", style: Constants.taskHeading),
                  Constants.formPadding,
                  Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: const Text(
                      "Go to Sam's Wedding Dresses at the Hotel Plaza",
                      style: Constants.cardContentStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Constants.taskPadding,

                  //Cost
                  const Text("Cost", style: Constants.taskHeading),
                  Constants.formPadding,
                  const Text("\$500.00", style: Constants.cardContentStyle),
                  Constants.taskPadding,

                  ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        titlePadding: EdgeInsets.zero,
                        title: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero)),
                            margin: EdgeInsets.zero,
                            color: Constants.lightSecondary,
                            child: ListTile(
                              title: Text('Deletion Confirmation',
                                  textAlign: TextAlign.center,
                                  style: Constants.cardHeaderStyle),
                            )),
                        contentPadding: EdgeInsets.only(
                            top: 20.0, bottom: 0.0, left: 25.0, right: 25.0),
                        content: Text(
                            'Are you sure you want to delete this task?',
                            style: Constants.dialogContentStyle),
                        actionsAlignment: MainAxisAlignment.center,
                        // actionsPadding: ,
                        buttonPadding: EdgeInsets.symmetric(horizontal: 25.0),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel',
                                  style: Constants.buttonRedStyle),
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constants.buttonRed),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 25.0, horizontal: 40.0)),
                              )),
                          ElevatedButton(
                            onPressed: () => {
                              // TODO: Delete guest functionality
                              Navigator.pop(context),
                              Navigator.pop(context)
                            },
                            child: const Text('Delete',
                                style: Constants.buttonRedStyle),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Constants.buttonGreen),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 35.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child:
                        const Text('Delete', style: Constants.buttonRedStyle),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Constants.buttonRed),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 161.0)),
                    ),
                  ),

                  Constants.formPadding,

                  ElevatedButton(
                    onPressed: () => {
                      // TODO: Provide
                      Navigator.pop(context),
                    },
                    child:
                        const Text('Complete', style: Constants.buttonRedStyle),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.buttonGreen),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 150.0)),
                    ),
                  ),

                  Constants.taskPadding,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}