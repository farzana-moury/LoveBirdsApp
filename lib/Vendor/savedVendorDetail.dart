import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovebirds_app/helper/savedVendorInfo.dart';

import '../helper/constants.dart';

class SavedVendorDetailScreen extends StatefulWidget {
  // In the constructor, require a vendor info.
  const SavedVendorDetailScreen({Key? key, required this.savedVendorInfo})
      : super(key: key);

  // Declare a field that holds the vendor info.
  final SavedVendorInfo savedVendorInfo;

  @override
  State createState() {
    return _SavedVendorDetailScreenState();
  }
}

class _SavedVendorDetailScreenState extends State<SavedVendorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.lightPrimary,
          centerTitle: true,
          title: Text('Saved Vendors', style: Constants.appBarStyle),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            color: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5.0,
            child: Column(
              children: [
                // Image of the vendor (can be cached)
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      imageUrl:
                      '${widget.savedVendorInfo.image}',
                    ),
                  ),
                  height: 250.0,
                  width: double.infinity, // Stretch width as much as possible
                ),
                ListTile(
                  // Vendor name, rating, saved or not saved
                  title: Text(widget.savedVendorInfo.name,
                      textAlign: TextAlign.left,
                      style: Constants.bigListTitleStyle),
                  subtitle: Text('Rating: ${widget.savedVendorInfo.rating}',
                      textAlign: TextAlign.left,
                      style: Constants.bigListSubtitleStyle),
                  trailing: Icon(Icons.favorite,
                    color: Constants.lightPrimary,
                    size: 40.0,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                ),
                ListTile(
                  // Vendor location
                  leading: Icon(
                    Icons.pin_drop_rounded,
                    color: Colors.black,
                  ),
                  title: Text(widget.savedVendorInfo.location,
                      textAlign: TextAlign.left,
                      style: Constants.bigListSubtitleStyle),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  minLeadingWidth: 0.0,
                ),
                ListTile(
                  // Vendor description
                  leading: Icon(
                    Icons.storefront_rounded,
                    color: Colors.black,
                  ),
                  title: Text(widget.savedVendorInfo.description,
                      textAlign: TextAlign.left,
                      style: Constants.bigListSubtitleStyle),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  minLeadingWidth: 0.0,
                ),
                ListTile(
                  // Vendor website
                  leading: Icon(
                    Icons.link_rounded,
                    color: Colors.black,
                  ),
                  title: Text(widget.savedVendorInfo.website,
                      textAlign: TextAlign.left,
                      style: Constants.bigListSubtitleStyle),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  minLeadingWidth: 0.0,
                ),
                ListTile(
                  // Vendor phone num
                  leading: Icon(
                    Icons.phone_rounded,
                    color: Colors.black,
                  ),
                  title: Text(widget.savedVendorInfo.phoneNum,
                      textAlign: TextAlign.left,
                      style: Constants.bigListSubtitleStyle),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  minLeadingWidth: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                      onPressed: () {
                          // Remove a saved vendor
                          showDialog<String>(
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
                                  top: 20.0,
                                  bottom: 0.0,
                                  left: 25.0,
                                  right: 25.0),
                              content: Text(
                                  'Are you sure you want to remove the vendor ' +
                                      widget.savedVendorInfo.name +
                                      '?',
                                  style: Constants.dialogContentStyle),
                              actionsAlignment: MainAxisAlignment.center,
                              buttonPadding:
                              EdgeInsets.symmetric(horizontal: 25.0),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel',
                                        style: Constants.buttonRedStyle),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                      ),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Constants.buttonRed),
                                      padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              vertical: 25.0,
                                              horizontal: 40.0)),
                                    )),
                                ElevatedButton(
                                  onPressed: () => {
                                    // TODO: Delete saved vendor functionality
                                    Navigator.pop(context),
                                    Navigator.pop(context)
                                  },
                                  child: const Text('Confirm',
                                      style: Constants.buttonRedStyle),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constants.buttonGreen),
                                    padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.symmetric(
                                            vertical: 25.0,
                                            horizontal: 35.0)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      child: Text('Remove from Saved',
                          style: Constants.buttonRedStyle),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.buttonRed),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 50.0)),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
