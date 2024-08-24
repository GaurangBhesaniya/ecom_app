
import 'package:flutter/material.dart';
import 'app_colors.dart';






String removeCurrencySymbolAndDecimals(String inputString) {
  String modifiedString = inputString.replaceAll("₹", "");
  if (modifiedString.endsWith(".00")) {
    modifiedString = modifiedString.substring(0, modifiedString.length - 3);
  }

  return modifiedString;
}

String truncateString(String inputString, int maxLength) {
  if (inputString.length > maxLength) {
    return "${inputString.substring(0, maxLength)}...";
  } else {
    return inputString;
  }
}



final List<int> successResCode = [for (var i in range(200, 300)) i];

Iterable<int> range(int low, int high) sync* {
  for (int i = low; i <= high; ++i) {
    yield i;
  }
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

String capitalizeFirstLetter(String text) {
  if (text.characters.isNotEmpty) {
    return text.characters.first.toUpperCase() + text.characters.skip(1).toString();
  } else {
    return "";
  }
}


String extractTwoWordsAfterFirstComma(String inputString) {
  List<String> parts = inputString.split(',');

  // Check if there are at least two parts (including words after the first comma)
  if (parts.length >= 2) {
    // Extract the two words after the first comma
    String result = parts[1].trim();
    if (result.contains(' ')) {
      // If there are more than one word, take the first two words
      List<String> words = result.split(' ');
      result = '${words[0].trim()} ${words[1].trim()}';
    }
    return result;
  } else {
    // Handle the case where there are not enough parts
    return "Not enough words after the first comma";
  }
}

class AppDialog{
  static Future<void> showInfoDialog(BuildContext context, String msg) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.appBackGroundColor,
            contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
            title: const Center(
              child: Icon(Icons.warning_rounded, color: AppColors.primary, size: 50,),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    msg,
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                )),
                            child: const Text(
                              "Okay",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

void push(BuildContext context, Widget destination) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => destination,));
}


String extractName(String email) {
  // Split email address into local part and domain part
  List<String> emailParts = email.split('@');

  // Extract name from local part
  String localPart = emailParts[0];

  // Extract name based on various formats
  List<String> nameParts = [];
  RegExp regExp = RegExp(r"[a-zA-Z]+");

  for (Match match in regExp.allMatches(localPart)) {
    nameParts.add(match.group(0) ?? "");
  }

  // Capitalize the first letter of each name part
  List<String> capitalizedNames = nameParts.map((name) {
    return name[0].toUpperCase() + name.substring(1);
  }).toList();

  // Concatenate the capitalized name parts with a space
  String name = capitalizedNames.join(' ');

  return name;
}

SliverGridDelegate commonSliverGridDelegate(BuildContext context) => SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: kDefaultChildAspectRatio(context),
    crossAxisSpacing: 20,
    mainAxisSpacing: 20
);

SliverGridDelegate storePageSliverGridDelegate(BuildContext context) => SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: kDefaultChildAspectRatio(context),
    crossAxisSpacing:15,
    mainAxisSpacing: 0
);

double kDefaultChildAspectRatio(BuildContext context) => MediaQuery.of(context).size.width * 0.0018;

double kDefaultPaddingX(BuildContext context) => MediaQuery.of(context).size.width * 0.04;


String removeCountryCode(String phoneNumber) {
  if (phoneNumber.startsWith('+91')) {
    return phoneNumber.substring(3);
  }
  return phoneNumber;
}

String formatDayWithSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return "${day}th";
  }
  switch (day % 10) {
    case 1:
      return "${day}st";
    case 2:
      return "${day}nd";
    case 3:
      return "${day}rd";
    default:
      return "${day}th";
  }
}






