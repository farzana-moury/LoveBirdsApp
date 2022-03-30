import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'helper/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key); // Home page key identifier

  // Get task information
  final List<String> dueDates = <String>[
    "January 13th, 2022",
    "February 5th, 2022",
    "February 9th, 2022",
    "February 12th, 2022"
  ];
  final List<String> taskNames = <String>[
    "Buy a wedding dress",
    "Buy a tuxedo",
    "Buy flowers",
    "Buy drinks"
  ];
  final List<String> taskPrices = <String>["\$500.00", "\$500.00", "\$150.00", "\$200.00"];

  /// Creates a state
  ///
  /// Return the Home page State
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  /// This Widget builds out the Home page
  ///
  /// Given the build [context], return the Home page Widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 950,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image of the vendor (can be cached)
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(), // Need this to preserve container shape
                child: FittedBox(
                  // clipBehavior: Clip.antiAlias,
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    imageUrl:
                    'https://pbs.twimg.com/media/CXzwtfFWMAAdtLa?format=jpg&name=4096x4096',
                  ),
                ),
                height: 150.0,
                width: double.infinity, // Stretch width as much as possible
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, left: 20, right: 20, bottom: 0),
                child: const Text(
                  "Overview",
                  style: Constants.title,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: const [
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero)),
                              margin: EdgeInsets.zero,
                              color: Constants.lightSecondary,
                              child: ListTile(
                                title: Text("Budget",
                                    textAlign: TextAlign.center,
                                    style: Constants.cardHeaderStyle),
                              )),

                          //Task Name
                          Constants.sectionPadding,
                          Text("\$10,000.00", style: Constants.taskNumber),
                          Constants.formPadding2,
                          Text("remaining", style: Constants.cardContentStyle2),
                          Constants.sectionPadding,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: const [
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero)),
                              margin: EdgeInsets.zero,
                              color: Constants.lightSecondary,
                              child: ListTile(
                                title: Text("Guests",
                                    textAlign: TextAlign.center,
                                    style: Constants.cardHeaderStyle),
                              )),

                          //Task Name
                          Constants.sectionPadding,
                          Text("250", style: Constants.taskNumber),
                          Constants.formPadding2,
                          Text("confirmed", style: Constants.cardContentStyle2),
                          Constants.sectionPadding,
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 0),
                child: const Text(
                  "Next on your to-do list",
                  style: Constants.title,
                ),
              ),
              // The list of tasks (contained in a listview builder)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  itemCount: widget.taskNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    //an individual list item is a card
                    return GestureDetector( //This helps to make the card clickable
                      // onTap: () { // Open up the Guest Info route
                      //   Navigator.of(context).push(
                      //       MaterialPageRoute(builder: (context) => const ViewTask()));
                      // },

                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 7.0,
                            horizontal: 10.0), // Hack for shrinking card padding
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: 5.0,

                        //this card contains a row of the labels and widgets that make up a task item
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 12)),

                            Expanded(
                              //column containing task name and due date
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 12)),
                                  Text(widget.taskNames[index],
                                      textAlign: TextAlign.left,
                                      style: Constants.listTitleStyle),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 2)),
                                  Text(widget.dueDates[index],
                                      textAlign: TextAlign.left,
                                      style: Constants.listSubtitleStyle),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 12)),
                                ],
                              ),
                            ),

                            //row containing task price and arrow indicator
                            Row(
                              children: [
                                Text(widget.taskPrices[index],
                                    textAlign: TextAlign.right,
                                    style: Constants.taskPrice),
                                const Icon(Icons.chevron_right_rounded),
                                const Padding(
                                    padding: EdgeInsets.only(right: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
