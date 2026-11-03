
import 'package:flutter/material.dart';



void sliderLinkStatus(BuildContext context, String status) {
  // final promoProvider = Provider.of<PromoProvider>(context, listen: false);
  String url = status;
  String? id;

  // Check if the URL contains product details and extract the ID if it does
  RegExp detailsRegExp = RegExp(r'details\/(\d+)');
  Match? detailsMatch = detailsRegExp.firstMatch(url);
  if (detailsMatch != null) {
    id = detailsMatch.group(1); // Extracted ID for details
  } else {
    // Check for brand or collection IDs
    RegExp brandIdRegExp = RegExp(r'brandIds=(\d+)');
    RegExp collectionIdRegExp = RegExp(r'CollectionId=(\d+)');
    Match? brandMatch = brandIdRegExp.firstMatch(url);
    Match? collectionMatch = collectionIdRegExp.firstMatch(url);

    if (brandMatch != null) {
      id = brandMatch.group(1); // Extracted ID for brand
    } else if (collectionMatch != null) {
      id = collectionMatch.group(1); // Extracted ID for collection
    }
  }

  // Navigation logic based on URL patterns
  if (url.contains("/details") && id != null) {
    // productId = id;
    // Navigator.of(context).push(createRoute(ProductDetail()));

  } else if (url.contains("products?brandIds") || url.contains("products?categoryIds")) {
    // Handle brand or category ID
    if (id != null) {
      // promoProvider.navigateBrend(id);
    }
    // Navigator.of(context).push(createRoute(ProductItem()));

  } else if (url.contains("products?CollectionId")) {
    // Handle collection ID
    if (id != null) {
      // promoProvider.navigateCollection(id);
    }
    // Navigator.of(context).push(createRoute(ProductItem()));

  } else if (url.contains("categoryIds")) {
    // General category page
    // Navigator.of(context).push(createRoute(Basket()));

  } else if (url.startsWith("https://")) {
    // External links (open in web view)
    // webViewLink = status;
    // Navigator.of(context).push(createRoute(MyWebView()));

  } else {
    debugPrint("error");
  }
}
