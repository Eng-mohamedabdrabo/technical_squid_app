// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Technical Squid`
  String get splashTitle {
    return Intl.message(
      'Technical Squid',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Premium Car Care`
  String get onboardingTitle1 {
    return Intl.message(
      'Premium Car Care',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Keep your vehicle in top condition with our expert maintenance services.`
  String get onboardingSubTitle1 {
    return Intl.message(
      'Keep your vehicle in top condition with our expert maintenance services.',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Smart Tracking`
  String get onboardingTitle2 {
    return Intl.message(
      'Smart Tracking',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Track your car's health and maintenance history in real-time.`
  String get onboardingSubTitle2 {
    return Intl.message(
      'Track your car\'s health and maintenance history in real-time.',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Expert Support`
  String get onboardingTitle3 {
    return Intl.message(
      'Expert Support',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `24/7 access to professional mechanics and support staff.`
  String get onboardingSubTitle3 {
    return Intl.message(
      '24/7 access to professional mechanics and support staff.',
      name: 'onboardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Search for a service...`
  String get searchPlaceholder {
    return Intl.message(
      'Search for a service...',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Subscription Request`
  String get subscriptionRequest {
    return Intl.message(
      'Subscription Request',
      name: 'subscriptionRequest',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get ourServices {
    return Intl.message(
      'Our Services',
      name: 'ourServices',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message('Home', name: 'homeTitle', desc: '', args: []);
  }

  /// `Add Service`
  String get addService {
    return Intl.message('Add Service', name: 'addService', desc: '', args: []);
  }

  /// `Model Year`
  String get modelYear {
    return Intl.message('Model Year', name: 'modelYear', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue`
  String get loginToContinue {
    return Intl.message(
      'Login to continue',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Login`
  String get loginAction {
    return Intl.message('Login', name: 'loginAction', desc: '', args: []);
  }

  /// `Sign Up`
  String get signupAction {
    return Intl.message('Sign Up', name: 'signupAction', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Email`
  String get continueWithEmail {
    return Intl.message(
      'Continue with Email',
      name: 'continueWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Phone`
  String get continueWithPhone {
    return Intl.message(
      'Continue with Phone',
      name: 'continueWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to`
  String get enterCodeSentTo {
    return Intl.message(
      'Enter the code sent to',
      name: 'enterCodeSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Saudi Arabia`
  String get saudiArabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message('Back to Home', name: 'backToHome', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUsTitle {
    return Intl.message('About Us', name: 'aboutUsTitle', desc: '', args: []);
  }

  /// `Providing professional car maintenance services with the highest standards of quality and professionalism. Established in 2020.`
  String get aboutUsDescription {
    return Intl.message(
      'Providing professional car maintenance services with the highest standards of quality and professionalism. Established in 2020.',
      name: 'aboutUsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Our Story`
  String get ourStoryTitle {
    return Intl.message('Our Story', name: 'ourStoryTitle', desc: '', args: []);
  }

  /// `A journey towards excellence in car maintenance`
  String get ourStorySubtitle {
    return Intl.message(
      'A journey towards excellence in car maintenance',
      name: 'ourStorySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Our journey began in 2020 with a clear vision: to provide car maintenance services that combine high quality with reasonable prices.`
  String get ourStoryParagraph1 {
    return Intl.message(
      'Our journey began in 2020 with a clear vision: to provide car maintenance services that combine high quality with reasonable prices.',
      name: 'ourStoryParagraph1',
      desc: '',
      args: [],
    );
  }

  /// `Over the years, we have invested in the latest technologies and equipment, and built a team of qualified technicians and experts in the field of car maintenance.`
  String get ourStoryParagraph2 {
    return Intl.message(
      'Over the years, we have invested in the latest technologies and equipment, and built a team of qualified technicians and experts in the field of car maintenance.',
      name: 'ourStoryParagraph2',
      desc: '',
      args: [],
    );
  }

  /// `Today, we are proud to serve hundreds of satisfied customers, and we continue our commitment to providing the best services while maintaining transparency and honesty.`
  String get ourStoryParagraph3 {
    return Intl.message(
      'Today, we are proud to serve hundreds of satisfied customers, and we continue our commitment to providing the best services while maintaining transparency and honesty.',
      name: 'ourStoryParagraph3',
      desc: '',
      args: [],
    );
  }

  /// `500+ Happy Customers`
  String get statHappyCustomers {
    return Intl.message(
      '500+ Happy Customers',
      name: 'statHappyCustomers',
      desc: '',
      args: [],
    );
  }

  /// `50+ Services Available`
  String get statServicesAvailable {
    return Intl.message(
      '50+ Services Available',
      name: 'statServicesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `15+ Expert Technicians`
  String get statExpertTechnicians {
    return Intl.message(
      '15+ Expert Technicians',
      name: 'statExpertTechnicians',
      desc: '',
      args: [],
    );
  }

  /// `4+ Years Experience`
  String get statYearsExperience {
    return Intl.message(
      '4+ Years Experience',
      name: 'statYearsExperience',
      desc: '',
      args: [],
    );
  }

  /// `Why Us?`
  String get whyUsTitle {
    return Intl.message('Why Us?', name: 'whyUsTitle', desc: '', args: []);
  }

  /// `What distinguishes us from others`
  String get whyUsSubtitle {
    return Intl.message(
      'What distinguishes us from others',
      name: 'whyUsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Warranty on Services`
  String get featureWarrantyTitle {
    return Intl.message(
      'Warranty on Services',
      name: 'featureWarrantyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We offer a comprehensive warranty on all our services to ensure your peace of mind.`
  String get featureWarrantyDesc {
    return Intl.message(
      'We offer a comprehensive warranty on all our services to ensure your peace of mind.',
      name: 'featureWarrantyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Speed in Execution`
  String get featureSpeedTitle {
    return Intl.message(
      'Speed in Execution',
      name: 'featureSpeedTitle',
      desc: '',
      args: [],
    );
  }

  /// `We adhere to delivery dates and work efficiently to save your time.`
  String get featureSpeedDesc {
    return Intl.message(
      'We adhere to delivery dates and work efficiently to save your time.',
      name: 'featureSpeedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Specialized Team`
  String get featureTeamTitle {
    return Intl.message(
      'Specialized Team',
      name: 'featureTeamTitle',
      desc: '',
      args: [],
    );
  }

  /// `Certified technicians trained on the latest car technologies.`
  String get featureTeamDesc {
    return Intl.message(
      'Certified technicians trained on the latest car technologies.',
      name: 'featureTeamDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ready to service your car?`
  String get ctaTitle {
    return Intl.message(
      'Ready to service your car?',
      name: 'ctaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact us today and get the best maintenance services.`
  String get ctaDesc {
    return Intl.message(
      'Contact us today and get the best maintenance services.',
      name: 'ctaDesc',
      desc: '',
      args: [],
    );
  }

  /// `Browse Services`
  String get browseServices {
    return Intl.message(
      'Browse Services',
      name: 'browseServices',
      desc: '',
      args: [],
    );
  }

  /// `Company Subscription Request`
  String get companySubscriptionTitle {
    return Intl.message(
      'Company Subscription Request',
      name: 'companySubscriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Person Name`
  String get responsiblePerson {
    return Intl.message(
      'Responsible Person Name',
      name: 'responsiblePerson',
      desc: '',
      args: [],
    );
  }

  /// `Company Size`
  String get companySize {
    return Intl.message(
      'Company Size',
      name: 'companySize',
      desc: '',
      args: [],
    );
  }

  /// `Additional Message`
  String get additionalMessage {
    return Intl.message(
      'Additional Message',
      name: 'additionalMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get submitRequest {
    return Intl.message(
      'Submit Request',
      name: 'submitRequest',
      desc: '',
      args: [],
    );
  }

  /// `Small (1-10)`
  String get small {
    return Intl.message('Small (1-10)', name: 'small', desc: '', args: []);
  }

  /// `Medium (11-50)`
  String get medium {
    return Intl.message('Medium (11-50)', name: 'medium', desc: '', args: []);
  }

  /// `Large (50+)`
  String get large {
    return Intl.message('Large (50+)', name: 'large', desc: '', args: []);
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Receiving Images`
  String get vehicleReceivingImages {
    return Intl.message(
      'Vehicle Receiving Images',
      name: 'vehicleReceivingImages',
      desc: '',
      args: [],
    );
  }

  /// `Repair Process Images`
  String get repairProcessImages {
    return Intl.message(
      'Repair Process Images',
      name: 'repairProcessImages',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Pickup Images`
  String get vehiclePickupImages {
    return Intl.message(
      'Vehicle Pickup Images',
      name: 'vehiclePickupImages',
      desc: '',
      args: [],
    );
  }

  /// `After Delivery Images`
  String get afterDeliveryImages {
    return Intl.message(
      'After Delivery Images',
      name: 'afterDeliveryImages',
      desc: '',
      args: [],
    );
  }

  /// `This is a detailed description of the service. It includes what will be done, the estimated time, and any other relevant details.`
  String get mockDescription {
    return Intl.message(
      'This is a detailed description of the service. It includes what will be done, the estimated time, and any other relevant details.',
      name: 'mockDescription',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get serviceDetails {
    return Intl.message(
      'Service Details',
      name: 'serviceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `SAR`
  String get sar {
    return Intl.message('SAR', name: 'sar', desc: '', args: []);
  }

  /// `Spare Parts`
  String get spareParts {
    return Intl.message('Spare Parts', name: 'spareParts', desc: '', args: []);
  }

  /// `These are the spare parts you might need to complete this service. You can skip this step.`
  String get sparePartsDesc {
    return Intl.message(
      'These are the spare parts you might need to complete this service. You can skip this step.',
      name: 'sparePartsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Problem Description`
  String get problemDescription {
    return Intl.message(
      'Problem Description',
      name: 'problemDescription',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem here...`
  String get problemDescriptionHint {
    return Intl.message(
      'Describe the problem here...',
      name: 'problemDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Battery`
  String get battery {
    return Intl.message('Battery', name: 'battery', desc: '', args: []);
  }

  /// `Oil Filter`
  String get oilFilter {
    return Intl.message('Oil Filter', name: 'oilFilter', desc: '', args: []);
  }

  /// `Brake Pads`
  String get brakePads {
    return Intl.message('Brake Pads', name: 'brakePads', desc: '', args: []);
  }

  /// `Select Car Brand`
  String get selectCarBrand {
    return Intl.message(
      'Select Car Brand',
      name: 'selectCarBrand',
      desc: '',
      args: [],
    );
  }

  /// `Select Car Model`
  String get selectCarModel {
    return Intl.message(
      'Select Car Model',
      name: 'selectCarModel',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Compatibility`
  String get compatibility {
    return Intl.message(
      'Compatibility',
      name: 'compatibility',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Continue Shopping`
  String get continueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `VAT Included`
  String get vatIncluded {
    return Intl.message(
      'VAT Included',
      name: 'vatIncluded',
      desc: '',
      args: [],
    );
  }

  /// `Change Car`
  String get changeCar {
    return Intl.message('Change Car', name: 'changeCar', desc: '', args: []);
  }

  /// `Compatible`
  String get compatible {
    return Intl.message('Compatible', name: 'compatible', desc: '', args: []);
  }

  /// `Not Compatible`
  String get notCompatible {
    return Intl.message(
      'Not Compatible',
      name: 'notCompatible',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get visa {
    return Intl.message('Visa', name: 'visa', desc: '', args: []);
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message('Coming Soon', name: 'comingSoon', desc: '', args: []);
  }

  /// `Order Confirmed!`
  String get orderConfirmed {
    return Intl.message(
      'Order Confirmed!',
      name: 'orderConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get serviceName {
    return Intl.message(
      'Service Name',
      name: 'serviceName',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get step1 {
    return Intl.message('Items', name: 'step1', desc: '', args: []);
  }

  /// `Check`
  String get step2 {
    return Intl.message('Check', name: 'step2', desc: '', args: []);
  }

  /// `Review`
  String get step3 {
    return Intl.message('Review', name: 'step3', desc: '', args: []);
  }

  /// `Pay`
  String get step4 {
    return Intl.message('Pay', name: 'step4', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Additions`
  String get additions {
    return Intl.message('Additions', name: 'additions', desc: '', args: []);
  }

  /// `Add Car`
  String get addCar {
    return Intl.message('Add Car', name: 'addCar', desc: '', args: []);
  }

  /// `Car Type`
  String get carType {
    return Intl.message('Car Type', name: 'carType', desc: '', args: []);
  }

  /// `Car Model`
  String get carModel {
    return Intl.message('Car Model', name: 'carModel', desc: '', args: []);
  }

  /// `Car Color`
  String get carColor {
    return Intl.message('Car Color', name: 'carColor', desc: '', args: []);
  }

  /// `Plate Number`
  String get plateNumber {
    return Intl.message(
      'Plate Number',
      name: 'plateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Car Image`
  String get carImage {
    return Intl.message('Car Image', name: 'carImage', desc: '', args: []);
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Select Car Type`
  String get selectCarType {
    return Intl.message(
      'Select Car Type',
      name: 'selectCarType',
      desc: '',
      args: [],
    );
  }

  /// `Enter Car Color`
  String get enterCarColor {
    return Intl.message(
      'Enter Car Color',
      name: 'enterCarColor',
      desc: '',
      args: [],
    );
  }

  /// `Enter Plate Number (e.g. ABC 1234)`
  String get enterPlateNumber {
    return Intl.message(
      'Enter Plate Number (e.g. ABC 1234)',
      name: 'enterPlateNumber',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get packagesTitle {
    return Intl.message(
      'Subscriptions',
      name: 'packagesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our Premium Packages`
  String get premiumPackages {
    return Intl.message(
      'Our Premium Packages',
      name: 'premiumPackages',
      desc: '',
      args: [],
    );
  }

  /// `Choose the package that suits your needs\nand enjoy exclusive discounts and services`
  String get choosePackage {
    return Intl.message(
      'Choose the package that suits your needs\nand enjoy exclusive discounts and services',
      name: 'choosePackage',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Now`
  String get subscribe {
    return Intl.message('Subscribe Now', name: 'subscribe', desc: '', args: []);
  }

  /// `Current Package`
  String get currentPackage {
    return Intl.message(
      'Current Package',
      name: 'currentPackage',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message('Monthly', name: 'monthly', desc: '', args: []);
  }

  /// `Yearly`
  String get yearly {
    return Intl.message('Yearly', name: 'yearly', desc: '', args: []);
  }

  /// `Features`
  String get features {
    return Intl.message('Features', name: 'features', desc: '', args: []);
  }

  /// `View Packages`
  String get viewPackages {
    return Intl.message(
      'View Packages',
      name: 'viewPackages',
      desc: '',
      args: [],
    );
  }

  /// `Package Features`
  String get packageFeatures {
    return Intl.message(
      'Package Features',
      name: 'packageFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Back to`
  String get backTo {
    return Intl.message('Back to', name: 'backTo', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'zh'),
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
