// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }


  /// `Phone number`
  // ignore: non_constant_identifier_names
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }
  /// `Tickets`
  // ignore: non_constant_identifier_names
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }
    /// `Login to your`
  String get login_to_your {
    return Intl.message(
      'Login to your',
      name: 'login_to_your',
      desc: '',
      args: [],
    );
  }

    /// `Collection`
  String get collection {
    return Intl.message(
      'Collection',
      name: 'collection',
      desc: '',
      args: [],
    );
  }
    /// `Enter phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

      /// `Enter phassword`
  String get enter_phassword {
    return Intl.message(
      'Enter phassword',
      name: 'enter_phassword',
      desc: '',
      args: [],
    );
  }
      /// `Don't have an account?`
  String get dont_have_acount {
    return Intl.message(
      'Dont have an account',
      name: 'dont_have_acount',
      desc: '',
      args: [],
    );
  }

        /// `Sign up now`
  String get sign_up_now {
    return Intl.message(
      'Sign up now',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }
        /// `Read More`
  String get read_more {
    return Intl.message(
      'Read More',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }
    /// `Read Less`
    String get read_less {
    return Intl.message(
      'Read Less',
      name: 'read_less',
      desc: '',
      args: [],
    );
  }

     /// `Sign in now`
  String get sign_in_now {
    return Intl.message(
      'Sign in now',
      name: 'sign_in_now',
      desc: '',
      args: [],
    );
  }

        /// `Already have an account?`
  String get alredy_heavy {
    return Intl.message(
      'Already have an account?',
      name: 'alredy_heavy',
      desc: '',
      args: [],
    );
  }
  /// `Tables`
  String get table_page {
    return Intl.message(
      'Tables',
      name: 'table_page',
      desc: '',
      args: [],
    );
  }

    /// `Verification code`
  String get verification_code {
    return Intl.message(
      'Verification code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }
    /// `Resend in`
  String get resend_code_in {
    return Intl.message(
      'Resend in',
      name: 'resend_code_in',
      desc: '',
      args: [],
    );
  }
    /// `Basket is empty`
  String get basket_empty {
    return Intl.message(
      'Basket is empty',
      name: 'basket_empty',
      desc: '',
      args: [],
    );
  }
    /// `No transactions`
  String get no_transactions {
    return Intl.message(
      'No transactions',
      name: 'no_transactions',
      desc: '',
      args: [],
    );
  }
      /// `Sign in to your account`
  String get sign_in_your_account {
    return Intl.message(
      'Basket is empty',
      name: 'sign_in_your_account',
      desc: '',
      args: [],
    );
  }
      /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }
      /// `Card Owner`
  String get card_owner {
    return Intl.message(
      'Card Owner',
      name: 'card_owner',
      desc: '',
      args: [],
    );
  }
        /// `Card Balance`
  String get card_balance {
    return Intl.message(
      'Card Balance',
      name: 'card_balance',
      desc: '',
      args: [],
    );
  }
  
      /// `Sign in or register`
  String get sign_in_or_register {
    return Intl.message(
      'Sign in or register',
      name: 'sign_in_or_register',
      desc: '',
      args: [],
    );
  }
          /// `to_continue_shopping`
  String get to_continue_shopping {
    return Intl.message(
      'to_continue_shopping',
      name: 'to_continue_shopping',
      desc: '',
      args: [],
    );
  }

            /// `Favorites are empty`
  String get favorite_empty {
    return Intl.message(
      'Favorites are empty',
      name: 'favorite_empty',
      desc: '',
      args: [],
    );
  }
              /// `Changes in basket`
  String get changes_in_basket {
    return Intl.message(
      'Favorites are empty',
      name: 'changes_in_basket',
      desc: '',
      args: [],
    );
  }
        /// `Some products in you basket is out of stock`
  String get some_products {
    return Intl.message(
      'Some products in you basket is out of stock',
      name: 'some_products',
      desc: '',
      args: [],
    );
  } 
          /// `Account removal`
  String get account_removal {
    return Intl.message(
      'Account removal',
      name: 'account_removal',
      desc: '',
      args: [],
    );
  } 
            /// `Are you sure you want to remove your account?`
  String get are_you_remove_you_want {
    return Intl.message(
      'Are you sure you want to remove your account?',
      name: 'are_you_remove_you_want',
      desc: '',
      args: [],
    );
  } 
          /// `No orders found`
  String get order_empty {
    return Intl.message(
      'No orders found',
      name: 'order_empty',
      desc: '',
      args: [],
    );
  }
            /// `No addresses`
  String get address_empty {
    return Intl.message(
      'No addresses',
      name: 'address_empty',
      desc: '',
      args: [],
    );
  }
          /// `See products`
  String get see_products {
    return Intl.message(
      'See products',
      name: 'see_products',
      desc: '',
      args: [],
    );
  } 
      /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

        /// `Proceed to checkout`
  String get proces_checkout {
    return Intl.message(
      'Proceed to checkout',
      name: 'proces_checkout',
      desc: '',
      args: [],
    );
  }
          /// `Pack`
  String get pack {
    return Intl.message(
      'Pack',
      name: 'pack',
      desc: '',
      args: [],
    );
  }
            /// `Piece`
  String get piece {
    return Intl.message(
      'Piece',
      name: 'piece',
      desc: '',
      args: [],
    );
  }
              /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }
              /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }
                /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
                /// `Show more`
  String get shoe_more {
    return Intl.message(
      'Show more',
      name: 'shoe_more',
      desc: '',
      args: [],
    );
  }

       /// `Show less`
  String get shoe_less {
    return Intl.message(
      'Show less',
      name: 'shoe_less',
      desc: '',
      args: [],
    );
  }
        /// `Popular products`
  String get popular {
    return Intl.message(
      'Popular products',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

        /// `Product information`
  String get prod_info {
    return Intl.message(
      'Product information',
      name: 'prod_info',
      desc: '',
      args: [],
    );
  }
          /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }
            /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }
           /// `Manufacture`
  String get manufactures {
    return Intl.message(
      'Manufacture',
      name: 'manufactures',
      desc: '',
      args: [],
    );
  }
             /// `Active ingredient`
  String get ingredient {
    return Intl.message(
      'Active ingredient',
      name: 'ingredient',
      desc: '',
      args: [],
    );
  }
            /// `Availability`
  String get aviablity {
    return Intl.message(
      'Availability',
      name: 'aviablity',
      desc: '',
      args: [],
    );
  }
                /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }
                /// `My profile`
  String get my_profile {
    return Intl.message(
      'My profile',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }
            /// `Order history`
  String get order_history {
    return Intl.message(
      'Order history',
      name: 'order_history',
      desc: '',
      args: [],
    );
  }
          /// `My addressses`
  String get my_addresses {
    return Intl.message(
      'My addressses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }
           /// `Our pharmacies`
  String get my_our {
    return Intl.message(
      'Our pharmacies',
      name: 'my_our',
      desc: '',
      args: [],
    );
  }
          /// `Choose sorting option`
  String get choose_sorting_city {
    return Intl.message(
      'Choose sorting option',
      name: 'choose_sorting_city',
      desc: '',
      args: [],
    );
  }
          /// `Password recovery`
  String get password_recovery {
    return Intl.message(
      'Password recovery',
      name: 'password_recovery',
      desc: '',
      args: [],
    );
  }
          /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }
       /// `Bonus card`
  String get bonus_card {
    return Intl.message(
      'Bonus card',
      name: 'bonus_card',
      desc: '',
      args: [],
    );
  }
         /// `Transactions`
  String get transaction {
    return Intl.message(
      'Transactions',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }
           /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }
             /// `Choose delivery address`
  String get choose_delivery_address {
    return Intl.message(
      'Choose delivery address',
      name: 'choose_delivery_address',
      desc: '',
      args: [],
    );
  }
             /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }
            /// `Add to basket`
  String get add_to_basket {
    return Intl.message(
      'Add to basket',
      name: 'add_to_basket',
      desc: '',
      args: [],
    );
  }
          /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }
              /// `Push Notifications`
  String get push_notif {
    return Intl.message(
      'Push Notifications',
      name: 'push_notif',
      desc: '',
      args: [],
    );
  }
    /// `Color Mode`
  String get color_mode {
    return Intl.message(
      'Color Mode',
      name: 'color_mode',
      desc: '',
      args: [],
    );
  }
      /// `Biometric`
  String get biometric {
    return Intl.message(
      'Biometric',
      name: 'biometric',
      desc: '',
      args: [],
    );
  }
            /// `Terms and Conditions`
  String get terms {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

              /// `Terms_info`
  String get terms_info {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_info',
      desc: '',
      args: [],
    );
  }
               /// `Natali inf_pin`
  String get natali_inf_pin {
    return Intl.message(
      'Natali inf_pin',
      name: 'natali_inf_pin',
      desc: '',
      args: [],
    );
  }
               /// `Your bonus card was changed successfully`
  String get your_bonus_card_successfuly {
    return Intl.message(
      'Your bonus card was changed successfully',
      name: 'your_bonus_card_successfuly',
      desc: '',
      args: [],
    );
  }

          /// `your_bonus_card_blocked`
  String get your_bonus_card_blocked {
    return Intl.message(
      'your_bonus_card_blocked',
      name: 'your_bonus_card_blocked',
      desc: '',
      args: [],
    );
  }
            /// `your_bonus_card_unblocked`
  String get your_bonus_card_unblocked {
    return Intl.message(
      'your_bonus_card_unblocked',
      name: 'your_bonus_card_unblocked',
      desc: '',
      args: [],
    );
  }
                 /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

                   /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

            /// `Payment information`
  String get payment_information {
    return Intl.message(
      'Payment information',
      name: 'payment_information',
      desc: '',
      args: [],
    );
  }
                   /// `'Payment failed or was cancelled.'`
  String get payment_failed {
    return Intl.message(
      'Payment failed or was cancelled.',
      name: 'payment_failed',
      desc: '',
      args: [],
    );
  }
                     /// `Paid with bonus`
  String get paid_with_bonus {
    return Intl.message(
      'Paid with bonus',
      name: 'paid_with_bonus',
      desc: '',
      args: [],
    );
  }
    
                         /// `Paid with card`
  String get paid_with_card {
    return Intl.message(
      'Paid with card',
      name: 'paid_with_card',
      desc: '',
      args: [],
    );
  }
              /// `Total paid`
  String get total_paid {
    return Intl.message(
      'Total paid',
      name: 'total_paid',
      desc: '',
      args: [],
    );
  }
          /// `No connected to Network`
  String get no_connected {
    return Intl.message(
      "No connected to Network",
      name: 'no_connected',
      desc: '',
      args: [],
    );
  }
            /// `Refresh`
  String get refresh {
    return Intl.message(
      "Refresh",
      name: 'refresh',
      desc: '',
      args: [],
    );
  }
             /// `Account`
  String get account {
    return Intl.message(
      "Account",
      name: 'account',
      desc: '',
      args: [],
    );
  }
  
         /// `Remove account`
  String get remove_account {
    return Intl.message(
      "Remove account",
      name: 'remove_account',
      desc: '',
      args: [],
    );
  }
  
  
            /// `You are connected to Mobile Network`
  String get connected_mobile {
    return Intl.message(
      "You are connected to Mobile Network",
      name: 'connected_mobile',
      desc: '',
      args: [],
    );
  }
            /// `You are connected to Mobile Network`
  String get connected_wifi {
    return Intl.message(
      "You are connected to Wifi Network",
      name: 'connected_wifi',
      desc: '',
      args: [],
    );
  }





                /// `Return`
  String get bonus_return {
    return Intl.message(
      'Return',
      name: 'bonus_return',
      desc: '',
      args: [],
    );
  }
                  /// `"Amount was sent bank to your bonus"`
  String get amount_was_sent {
    return Intl.message(
      'Amount was sent bank to your bonus',
      name: 'amount_was_sent',
      desc: '',
      args: [],
    );
  }
                    /// `Show changes`
  String get show_changes {
    return Intl.message(
      'Show changes',
      name: 'show_changes',
      desc: '',
      args: [],
    );
  }
                      /// `Hide changes`
  String get hide_changes {
    return Intl.message(
      'Hide changes',
      name: 'hide_changes',
      desc: '',
      args: [],
    );
  }
                        /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }
    
    
    
    
                 /// `The system encountered a problem`
  String get system_error {
    return Intl.message(
      'The system encountered a problem',
      name: 'system_error',
      desc: '',
      args: [],
    );
  }
    /// `Replace your bonus card`
  String get replace_your_card {
    return Intl.message(
      'Replace your bonus card',
      name: 'replace_your_card',
      desc: '',
      args: [],
    );
  }
      /// `At_the_end`
  String get at_the_end {
    return Intl.message(
      'At_the_end',
      name: 'at_the_end',
      desc: '',
      args: [],
    );
  }
        /// `At_the_end_2`
  String get at_the_end_2 {
    return Intl.message(
      'At_the_end_2',
      name: 'at_the_end_2',
      desc: '',
      args: [],
    );
  }
      /// `WHAT IS «NATALI PHARM BONUS» CARD?`
  String get what_is_natali {
    return Intl.message(
      'WHAT IS «NATALI PHARM BONUS» CARD?',
      name: 'what_is_natali',
      desc: '',
      args: [],
    );
  }
        /// `Forgot my PIN code`
  String get forgot_pin_code {
    return Intl.message(
      'Forgot my PIN code',
      name: 'forgot_pin_code',
      desc: '',
      args: [],
    );
  }
          /// `Block bonus card`
  String get block_bonus_card {
    return Intl.message(
      'Block bonus card',
      name: 'block_bonus_card',
      desc: '',
      args: [],
    );
  }

          /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }
            /// `Replace`
  String get replace {
    return Intl.message(
      'Replace',
      name: 'replace',
      desc: '',
      args: [],
    );
  }
              /// `Block your bonus card`
  String get block_your_card {
    return Intl.message(
      'Block your bonus card',
      name: 'block_your_card',
      desc: '',
      args: [],
    );
  }
                /// `Enter your PIN code to block your bonus card`
  String get enter_your_pin_code_to_block {
    return Intl.message(
      'Enter your PIN code to block your bonus card',
      name: 'enter_your_pin_code_to_block',
      desc: '',
      args: [],
    );
  }
                  /// `Enter your PIN code to  your bonus card`
  String get enter_your_pin_code_to_unblock {
    return Intl.message(
      'Enter your PIN code to unblock your bonus card',
      name: 'enter_your_pin_code_to_unblock',
      desc: '',
      args: [],
    );
  }
                  /// `About bonus card`
  String get about_card {
    return Intl.message(
      'About bonus card',
      name: 'about_card',
      desc: '',
      args: [],
    );
  }
            /// `PIN recovery`
  String get pin_recovery {
    return Intl.message(
      'PIN recovery',
      name: 'pin_recovery',
      desc: '',
      args: [],
    );
  }
              /// `Replace card`
  String get replace_card {
    return Intl.message(
      'Replace card',
      name: 'replace_card',
      desc: '',
      args: [],
    );
  }
                /// `Block card`
  String get block_card {
    return Intl.message(
      'Block card',
      name: 'block_card',
      desc: '',
      args: [],
    );
  }
                  /// `Unblock card`
  String get unblock_card {
    return Intl.message(
      'Unblock card',
      name: 'unblock_card',
      desc: '',
      args: [],
    );
  }
        /// `Enter your PIN code to replace your bonus card`
  String get enter_your_pin_code_to {
    return Intl.message(
      'Enter your PIN code to replace your bonus card',
      name: 'enter_your_pin_code_to',
      desc: '',
      args: [],
    );
  }
    /// `Write your new bonus card number`
  String get write_your {
    return Intl.message(
      'Write your new bonus card number',
      name: 'write_your',
      desc: '',
      args: [],
    );
  }
        /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }
            /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

              /// `Deleted products`
  String get deleted_product {
    return Intl.message(
      'Deleted products',
      name: 'deleted_product',
      desc: '',
      args: [],
    );
  }
              /// `Collected bonuses`
  String get collected_bonuses {
    return Intl.message(
      'Collected bonuses',
      name: 'collected_bonuses',
      desc: '',
      args: [],
    );
  }
                /// `My home`
  String get my_home {
    return Intl.message(
      'My home',
      name: 'my_home',
      desc: '',
      args: [],
    );
  }
                  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }
                   /// `Upcoming events`
    String get upcoming_events {
    return Intl.message(
      'Upcoming events',
      name: 'upcoming_events',
      desc: '',
      args: [],
    );
  }

                   /// `Empty tickets`
    String get empty_ticket {
    return Intl.message(
      'Empty tickets',
      name: 'empty_ticket',
      desc: '',
      args: [],
    );
  }
                        /// `Selected`
    String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }
             
                     /// `Past events`
    String get past_events {
    return Intl.message(
      'Past events',
      name: 'past_events',
      desc: '',
      args: [],
    );
  }


                    /// `Similar events`
  String get simelar_event {
    return Intl.message(
      'Similar events',
      name: 'simelar_event',
      desc: '',
      args: [],
    );
  }
          // `Address`
  String get add {
    return Intl.message(
      'Address',
      name: 'add',
      desc: '',
      args: [],
    );
  } 
     
                  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }
              /// `Choose address`
  String get choose_address {
    return Intl.message(
      'Choose address',
      name: 'choose_address',
      desc: '',
      args: [],
    );
  }
              /// `Change address`
  String get change_address {
    return Intl.message(
      'Change address',
      name: 'change_address',
      desc: '',
      args: [],
    );
  }
              /// `Do you want to delete the address?`
  String get are_you_remove_order {
    return Intl.message(
      'Do you want to delete the address?',
      name: 'are_you_remove_order',
      desc: '',
      args: [],
    );
  }
                /// `Out of stock`
  String get out_of_stock {
    return Intl.message(
      'Out of stock',
      name: 'out_of_stock',
      desc: '',
      args: [],
    );
  }
                    /// `Add new address`
  String get add_new_address {
    return Intl.message(
      'Add new address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }
            /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }
              /// `Scheduled date`
  String get scheduled_date {
    return Intl.message(
      'Scheduled date',
      name: 'scheduled_date',
      desc: '',
      args: [],
    );
  }
              /// ` A soon as posible`
  String get asoon {
    return Intl.message(
      ' A soon as posible',
      name: 'asoon',
      desc: '',
      args: [],
    );
  }
                /// `Add address`
  String get add_address {
    return Intl.message(
      'Add address',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }
                /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }
                  /// `Current password`
  String get current_password {
    return Intl.message(
      'Current password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }
                  /// `Save changes`
  String get save_changes {
    return Intl.message(
      'Save changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }
                    /// `Search results`
  String get search_results {
    return Intl.message(
      'Search results',
      name: 'search_results',
      desc: '',
      args: [],
    );
  }
            /// `There is no match for "para". Please try another search`
  String get empty_search {
    return Intl.message(
      'There is no match for',
      name: 'empty_search',
      desc: '',
      args: [],
    );
  }
  
            /// `Thank you`
  String get thank_you {
    return Intl.message(
      'Thank you',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }
    
            /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }


              /// `There is no match for "para". Please try another search`
  String get empty_search_1 {
    return Intl.message(
      'Please try another search',
      name: 'empty_search_1',
      desc: '',
      args: [],
    );
  }
              /// `pcs`
  String get pcs {
    return Intl.message(
      'pcs',
      name: 'pcs',
      desc: '',
      args: [],
    );
  }
              /// `Save address`
  String get save_address {
    return Intl.message(
      'Save address',
      name: 'save_address',
      desc: '',
      args: [],
    );
  }
                /// `Product available coun`
  String get empty_stockQuantity {
    return Intl.message(
      'Product available coun',
      name: 'empty_stockQuantity',
      desc: '',
      args: [],
    );
  }
                /// `Recipient information`
  String get recipient_info {
    return Intl.message(
      'Recipient information',
      name: 'recipient_info',
      desc: '',
      args: [],
    );
  }
  
                  /// `Write address`
  String get write_address {
    return Intl.message(
      'Write address',
      name: 'write_address',
      desc: '',
      args: [],
    );
  }
          /// `Building`
  String get building {
    return Intl.message(
      'Building',
      name: 'building',
      desc: '',
      args: [],
    );
  }
            /// `Appartment`
  String get appartment {
    return Intl.message(
      'Appartment',
      name: 'appartment',
      desc: '',
      args: [],
    );
  }

              /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }
                /// `Comment to driver`
  String get comment_to_driver {
    return Intl.message(
      'Comment to driver',
      name: 'comment_to_driver',
      desc: '',
      args: [],
    );
  }
          /// `Payment information`
  String get paymont_info {
    return Intl.message(
      'Payment information',
      name: 'paymont_info',
      desc: '',
      args: [],
    );
  }
            /// `Use bonus points`
  String get used_bonuses {
    return Intl.message(
      'Use bonus points',
      name: 'used_bonuses',
      desc: '',
      args: [],
    );
  }
          /// `Used amount`
  String get used_amount {
    return Intl.message(
      'Used amount',
      name: 'used_amount',
      desc: '',
      args: [],
    );
  }
            /// Write amount`
  String get write_amount {
    return Intl.message(
      'Write amount',
      name: 'write_amount',
      desc: '',
      args: [],
    );
  }
                  /// `Delivery date`
  String get delivery_date {
    return Intl.message(
      'Delivery date',
      name: 'delivery_date',
      desc: '',
      args: [],
    );
  }
              /// `Write comment`
  String get write_comment {
    return Intl.message(
      'Write comment',
      name: 'write_comment',
      desc: '',
      args: [],
    );
  }
                /// `Delivery address`
  String get delivery_address {
    return Intl.message(
      'Delivery address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }
  
        /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }
                  /// `Address`
  String get addres {
    return Intl.message(
      'Address',
      name: 'addres',
      desc: '',
      args: [],
    );
  }
            /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }
           /// `By Ticket`
  String get by_ticket {
    return Intl.message(
      'By Ticket',
      name: 'by_ticket',
      desc: '',
      args: [],
    );
  }
              /// `Cast`
  String get cast {
    return Intl.message(
      'Cast',
      name: 'cast',
      desc: '',
      args: [],
    );
  }
                /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }
  
              /// `Entrence`
  String get entrence  {
    return Intl.message(
      'Entrence',
      name: 'entrence',
      desc: '',
      args: [],
    );
  }
                /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

                  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  
          /// `View all `
  String get view_all {
    return Intl.message(
      'View all ',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }
              /// `Repeat order`
  String get repeat_order {
    return Intl.message(
      'Repeat order',
      name: 'repeat_order',
      desc: '',
      args: [],
    );
  }
            /// `Show result`
  String get show_result {
    return Intl.message(
      'Show result',
      name: 'show_result',
      desc: '',
      args: [],
    );
  }
              /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }
          /// `Favorites`
  String get favorite {
    return Intl.message(
      'Favorites',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }
      /// `Basket`
  String get basket {
    return Intl.message(
      'Basket',
      name: 'basket',
      desc: '',
      args: [],
    );
  }
    /// `Provide us some personal information`
  String get personal_information {
    return Intl.message(
      'Provide us some personal information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

      /// `Provide us some personal information`
  String get personal_information_registr {
    return Intl.message(
      'Provide us some personal information',
      name: 'personal_information_registr',
      desc: '',
      args: [],
    );
  }

      /// `Provide us some personal information`
  String get  personal_info {
    return Intl.message(
      'Personal information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }
    /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }
    /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }
    /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }
    /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }
      /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }
      /// `Choose gender`
  String get choose_gender {
    return Intl.message(
      'Choose gender',
      name: 'choose_gender',
      desc: '',
      args: [],
    );
  }
       /// `Choose date`
  String get choose_date {
    return Intl.message(
      'Choose date',
      name: 'choose_date',
      desc: '',
      args: [],
    );
  }
         /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }
           /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }
        /// `Enter name`
  String get enter_name {
    return Intl.message(
      'Enter name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }
        /// `Enter last name`
  String get enter_last_name {
    return Intl.message(
      'Enter last name',
      name: 'enter_last_name',
      desc: '',
      args: [],
    );
  }
       /// `Enter password`
  String get enter_password {
    return Intl.message(
      'Enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  
    /// `We have sent you code to`
  String get sent_you_code {
    return Intl.message(
      'We have sent you code to',
      name: 'sent_you_code',
      desc: '',
      args: [],
    );
  }
       /// `Please re-enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please re-enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

         /// `Passwords do not match`
  String get password_do_match {
    return Intl.message(
      'Passwords do not match',
      name: 'password_do_match',
      desc: '',
      args: [],
    );
  }
      /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }
  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Empty table`
  String get empty_table {
    return Intl.message(
      'Empty table',
      name: 'empty_table',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to empty table?`
  String get empty_table_question {
    return Intl.message(
      'Are you sure you want to empty table?',
      name: 'empty_table_question',
      desc: '',
      args: [],
    );
  }

  /// `Emptying the table removes all customers who scanned QR and have active sessions`
  String get empty_table_question_text {
    return Intl.message(
      'Emptying the table removes all customers who scanned QR and have active sessions',
      name: 'empty_table_question_text',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Start order`
  String get start_order {
    return Intl.message(
      'Start order',
      name: 'start_order',
      desc: '',
      args: [],
    );
  }

  /// `Write guest count`
  String get write_guest_count {
    return Intl.message(
      'Write guest count',
      name: 'write_guest_count',
      desc: '',
      args: [],
    );
  }

  /// `Guest count`
  String get guest_count {
    return Intl.message(
      'Guest count',
      name: 'guest_count',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Search menu item...`
  String get search_menu_iteam {
    return Intl.message(
      'Search menu item...',
      name: 'search_menu_iteam',
      desc: '',
      args: [],
    );
  }

    /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }
  
    /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }
      /// `Finished`
  String get finished  {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }
            /// `Filter by`
  String get filter_by  {
    return Intl.message(
      'Filter by',
      name: 'filter_by',
      desc: '',
      args: [],
    );
  }

          /// `Choose sorting option`
  String get choose_sorting  {
    return Intl.message(
      'Choose sorting option',
      name: 'choose_sorting',
      desc: '',
      args: [],
    );
  }
        /// `Alphabetical A-Z`
  String get alphabetical  {
    return Intl.message(
      'Alphabetical A-Z',
      name: 'alphabetical',
      desc: '',
      args: [],
    );
  }
          /// `Alphabetical Z-A`
  String get alphabetical_1  {
    return Intl.message(
      'Alphabetical Z-A',
      name: 'alphabetical_1',
      desc: '',
      args: [],
    );
  }
        /// `Price low first`
  String get price_low  {
    return Intl.message(
      'Price low first',
      name: 'price_low',
      desc: '',
      args: [],
    );
  }
          /// `Price high first`
  String get price_high  {
    return Intl.message(
      'Price high first',
      name: 'price_high',
      desc: '',
      args: [],
    );
  }
      /// `Delivering`
  String get delivering {
    return Intl.message(
      'Delivering',
      name: 'delivering',
      desc: '',
      args: [],
    );
  }
      /// `Collecting`
  String get collecting {
    return Intl.message(
      'Collecting',
      name: 'collecting',
      desc: '',
      args: [],
    );
  }

    /// `Scheduled`
  String get scheduled {
    return Intl.message(
      'Scheduled',
      name: 'scheduled',
      desc: '',
      args: [],
    );
  }


  /// `No search result`
  String get no_search_result {
    return Intl.message(
      'No search result',
      name: 'no_search_result',
      desc: '',
      args: [],
    );
  }

  /// `Extra note`
  String get extra_mod {
    return Intl.message(
      'Extra note',
      name: 'extra_mod',
      desc: '',
      args: [],
    );
  }

  /// `Write message`
  String get write_messige {
    return Intl.message(
      'Write message',
      name: 'write_messige',
      desc: '',
      args: [],
    );
  }

  /// `Add to order`
  String get add_to_order {
    return Intl.message(
      'Add to order',
      name: 'add_to_order',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approve {
    return Intl.message(
      'Approved',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Preview order`
  String get privew_order {
    return Intl.message(
      'Preview order',
      name: 'privew_order',
      desc: '',
      args: [],
    );
  }

  /// `Note to order`
  String get not_to_order {
    return Intl.message(
      'Note to order',
      name: 'not_to_order',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Tip`
  String get tip {
    return Intl.message(
      'Tip',
      name: 'tip',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Table`
  String get table {
    return Intl.message(
      'Table',
      name: 'table',
      desc: '',
      args: [],
    );
  }

  /// `Reserved`
  String get reserved {
    return Intl.message(
      'Reserved',
      name: 'reserved',
      desc: '',
      args: [],
    );
  }

  /// `Remove reservation`
  String get remove_reserved {
    return Intl.message(
      'Remove reservation',
      name: 'remove_reserved',
      desc: '',
      args: [],
    );
  }

  /// `Remove product from order`
  String get remove_product_from_order {
    return Intl.message(
      'Remove product from order',
      name: 'remove_product_from_order',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get cancel_order {
    return Intl.message(
      'Cancel order',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Mark as paid`
  String get mark_as_paid {
    return Intl.message(
      'Mark as paid',
      name: 'mark_as_paid',
      desc: '',
      args: [],
    );
  }

  /// `Free table`
  String get free_table {
    return Intl.message(
      'Free table',
      name: 'free_table',
      desc: '',
      args: [],
    );
  }

  /// `Not available`
  String get not_available {
    return Intl.message(
      'Not available',
      name: 'not_available',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get choose_language {
    return Intl.message(
      'Choose language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }
  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

    /// `We have found bonus card`
  String get found_bonus {
    return Intl.message(
      'We have found bonus card',
      name: 'found_bonus',
      desc: '',
      args: [],
    );
  }
  
    /// ` Sign in now`
  String get sin_x {
    return Intl.message(
      ' Sign in now',
      name: 'sin_x',
      desc: '',
      args: [],
    );
  }
    
    /// ` Card number`
  String get card_number {
    return Intl.message(
      'Card number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }
      /// `Enter number`
  String get enter_number {
    return Intl.message(
      'Enter number',
      name: 'enter_number',
      desc: '',
      args: [],
    );
  }
        /// `Enter PIN code`
  String get enter_pin_code {
    return Intl.message(
      'Enter PIN code',
      name: 'enter_pin_code',
      desc: '',
      args: [],
    );
  }
      /// `registered with your phone number. Write your bonus card number and PIN code to proceed`
  String get found_bonus_reg {
    return Intl.message(
      'registered with your phone number. Write your bonus card number and PIN code to proceed',
      name: 'found_bonus_reg',
      desc: '',
      args: [],
    );
  }
  /// `Enter your mobile phone number`
  String get enter_your_mbile_phone {
    return Intl.message(
      'Enter your mobile phone number',
      name: 'Enter_your_mobile',
      desc: '',
      args: [],
    );
  }


    /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }
  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }
  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }
  /// `I have already read and confirm Terms and Conditions`
  String get i_have_alread {
    return Intl.message(
      'I have already read and confirm Terms and Conditions',
      name: 'i_have_alread',
      desc: '',
      args: [],
    );
  }


  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }
  /// `Remove all`
  String get remove_all {
    return Intl.message(
      'Remove all',
      name: 'remove_all',
      desc: '',
      args: [],
    );
  }

  /// `Choose extras`
  String get choose_extras {
    return Intl.message(
      'Choose extras',
      name: 'choose_extras',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `choise`
  String get choise {
    return Intl.message(
      'choise',
      name: 'choise',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get max {
    return Intl.message(
      'Max',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `Blank field is not allowed`
  String get blank {
    return Intl.message(
      'Blank field is not allowed',
      name: 'blank',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect data`
  String get login_error {
    return Intl.message(
      'Incorrect data',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove order?`
  String get are_you_remove {
    return Intl.message(
      'Are you sure you want to remove order?',
      name: 'are_you_remove',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to \n cancel this order?`
  String get are_you_order {
    return Intl.message(
      'Are you sure you want to \n cancel this order?',
      name: 'are_you_order',
      desc: '',
      args: [],
    );
  }

  /// `Bill request-POS`
  String get billrequest_terminal {
    return Intl.message(
      'Bill request-POS',
      name: 'billrequest_terminal',
      desc: '',
      args: [],
    );
  }

  /// `Bill request - Cash`
  String get bill_request_cash {
    return Intl.message(
      'Bill request - Cash',
      name: 'bill_request_cash',
      desc: '',
      args: [],
    );
  }

  /// `Waiter required`
  String get waiter_required {
    return Intl.message(
      'Waiter required',
      name: 'waiter_required',
      desc: '',
      args: [],
    );
  }

  /// `New suborder`
  String get new_suborder {
    return Intl.message(
      'New suborder',
      name: 'new_suborder',
      desc: '',
      args: [],
    );
  }

    /// `News`
  String get news{
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `everyday`
  String get everyday {
    return Intl.message(
      'everyday',
      name: 'everyday',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ic {
    return Intl.message(
      '',
      name: 'ic',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message(
      'Mon',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tue {
    return Intl.message(
      'Tue',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wed {
    return Intl.message(
      'Wed',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `Thur`
  String get thur {
    return Intl.message(
      'Thur',
      name: 'thur',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message(
      'Fri',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message(
      'Sat',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sun {
    return Intl.message(
      'Sun',
      name: 'sun',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hy'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
