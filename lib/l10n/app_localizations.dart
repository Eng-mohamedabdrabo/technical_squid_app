import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Squid'**
  String get splashTitle;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Premium Car Care'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubTitle1.
  ///
  /// In en, this message translates to:
  /// **'Keep your vehicle in top condition with our expert maintenance services.'**
  String get onboardingSubTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Smart Tracking'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubTitle2.
  ///
  /// In en, this message translates to:
  /// **'Track your car\'s health and maintenance history in real-time.'**
  String get onboardingSubTitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Expert Support'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubTitle3.
  ///
  /// In en, this message translates to:
  /// **'24/7 access to professional mechanics and support staff.'**
  String get onboardingSubTitle3;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for a service...'**
  String get searchPlaceholder;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @subscriptionRequest.
  ///
  /// In en, this message translates to:
  /// **'Subscription Request'**
  String get subscriptionRequest;

  /// No description provided for @ourServices.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get ourServices;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @addService.
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get addService;

  /// No description provided for @modelYear.
  ///
  /// In en, this message translates to:
  /// **'Model Year'**
  String get modelYear;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get loginToContinue;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginAction;

  /// No description provided for @signupAction.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupAction;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continueWithEmail;

  /// No description provided for @continueWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone'**
  String get continueWithPhone;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @enterCodeSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to'**
  String get enterCodeSentTo;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @saudiArabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get saudiArabia;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @aboutUsTitle.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUsTitle;

  /// No description provided for @aboutUsDescription.
  ///
  /// In en, this message translates to:
  /// **'Providing professional car maintenance services with the highest standards of quality and professionalism. Established in 2020.'**
  String get aboutUsDescription;

  /// No description provided for @ourStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Story'**
  String get ourStoryTitle;

  /// No description provided for @ourStorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'A journey towards excellence in car maintenance'**
  String get ourStorySubtitle;

  /// No description provided for @ourStoryParagraph1.
  ///
  /// In en, this message translates to:
  /// **'Our journey began in 2020 with a clear vision: to provide car maintenance services that combine high quality with reasonable prices.'**
  String get ourStoryParagraph1;

  /// No description provided for @ourStoryParagraph2.
  ///
  /// In en, this message translates to:
  /// **'Over the years, we have invested in the latest technologies and equipment, and built a team of qualified technicians and experts in the field of car maintenance.'**
  String get ourStoryParagraph2;

  /// No description provided for @ourStoryParagraph3.
  ///
  /// In en, this message translates to:
  /// **'Today, we are proud to serve hundreds of satisfied customers, and we continue our commitment to providing the best services while maintaining transparency and honesty.'**
  String get ourStoryParagraph3;

  /// No description provided for @statHappyCustomers.
  ///
  /// In en, this message translates to:
  /// **'500+ Happy Customers'**
  String get statHappyCustomers;

  /// No description provided for @statServicesAvailable.
  ///
  /// In en, this message translates to:
  /// **'50+ Services Available'**
  String get statServicesAvailable;

  /// No description provided for @statExpertTechnicians.
  ///
  /// In en, this message translates to:
  /// **'15+ Expert Technicians'**
  String get statExpertTechnicians;

  /// No description provided for @statYearsExperience.
  ///
  /// In en, this message translates to:
  /// **'4+ Years Experience'**
  String get statYearsExperience;

  /// No description provided for @whyUsTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Us?'**
  String get whyUsTitle;

  /// No description provided for @whyUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What distinguishes us from others'**
  String get whyUsSubtitle;

  /// No description provided for @featureWarrantyTitle.
  ///
  /// In en, this message translates to:
  /// **'Warranty on Services'**
  String get featureWarrantyTitle;

  /// No description provided for @featureWarrantyDesc.
  ///
  /// In en, this message translates to:
  /// **'We offer a comprehensive warranty on all our services to ensure your peace of mind.'**
  String get featureWarrantyDesc;

  /// No description provided for @featureSpeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Speed in Execution'**
  String get featureSpeedTitle;

  /// No description provided for @featureSpeedDesc.
  ///
  /// In en, this message translates to:
  /// **'We adhere to delivery dates and work efficiently to save your time.'**
  String get featureSpeedDesc;

  /// No description provided for @featureTeamTitle.
  ///
  /// In en, this message translates to:
  /// **'Specialized Team'**
  String get featureTeamTitle;

  /// No description provided for @featureTeamDesc.
  ///
  /// In en, this message translates to:
  /// **'Certified technicians trained on the latest car technologies.'**
  String get featureTeamDesc;

  /// No description provided for @ctaTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to service your car?'**
  String get ctaTitle;

  /// No description provided for @ctaDesc.
  ///
  /// In en, this message translates to:
  /// **'Contact us today and get the best maintenance services.'**
  String get ctaDesc;

  /// No description provided for @browseServices.
  ///
  /// In en, this message translates to:
  /// **'Browse Services'**
  String get browseServices;

  /// No description provided for @companySubscriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Company Subscription Request'**
  String get companySubscriptionTitle;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @responsiblePerson.
  ///
  /// In en, this message translates to:
  /// **'Responsible Person Name'**
  String get responsiblePerson;

  /// No description provided for @companySize.
  ///
  /// In en, this message translates to:
  /// **'Company Size'**
  String get companySize;

  /// No description provided for @additionalMessage.
  ///
  /// In en, this message translates to:
  /// **'Additional Message'**
  String get additionalMessage;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get submitRequest;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small (1-10)'**
  String get small;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium (11-50)'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large (50+)'**
  String get large;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @vehicleReceivingImages.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Receiving Images'**
  String get vehicleReceivingImages;

  /// No description provided for @repairProcessImages.
  ///
  /// In en, this message translates to:
  /// **'Repair Process Images'**
  String get repairProcessImages;

  /// No description provided for @vehiclePickupImages.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Pickup Images'**
  String get vehiclePickupImages;

  /// No description provided for @afterDeliveryImages.
  ///
  /// In en, this message translates to:
  /// **'After Delivery Images'**
  String get afterDeliveryImages;

  /// No description provided for @mockDescription.
  ///
  /// In en, this message translates to:
  /// **'This is a detailed description of the service. It includes what will be done, the estimated time, and any other relevant details.'**
  String get mockDescription;

  /// No description provided for @serviceDetails.
  ///
  /// In en, this message translates to:
  /// **'Service Details'**
  String get serviceDetails;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @sar.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get sar;

  /// No description provided for @spareParts.
  ///
  /// In en, this message translates to:
  /// **'Spare Parts'**
  String get spareParts;

  /// No description provided for @sparePartsDesc.
  ///
  /// In en, this message translates to:
  /// **'These are the spare parts you might need to complete this service. You can skip this step.'**
  String get sparePartsDesc;

  /// No description provided for @problemDescription.
  ///
  /// In en, this message translates to:
  /// **'Problem Description'**
  String get problemDescription;

  /// No description provided for @problemDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the problem here...'**
  String get problemDescriptionHint;

  /// No description provided for @battery.
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get battery;

  /// No description provided for @oilFilter.
  ///
  /// In en, this message translates to:
  /// **'Oil Filter'**
  String get oilFilter;

  /// No description provided for @brakePads.
  ///
  /// In en, this message translates to:
  /// **'Brake Pads'**
  String get brakePads;

  /// No description provided for @selectCarBrand.
  ///
  /// In en, this message translates to:
  /// **'Select Car Brand'**
  String get selectCarBrand;

  /// No description provided for @selectCarModel.
  ///
  /// In en, this message translates to:
  /// **'Select Car Model'**
  String get selectCarModel;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @compatibility.
  ///
  /// In en, this message translates to:
  /// **'Compatibility'**
  String get compatibility;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShopping;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @vatIncluded.
  ///
  /// In en, this message translates to:
  /// **'VAT Included'**
  String get vatIncluded;

  /// No description provided for @changeCar.
  ///
  /// In en, this message translates to:
  /// **'Change Car'**
  String get changeCar;

  /// No description provided for @compatible.
  ///
  /// In en, this message translates to:
  /// **'Compatible'**
  String get compatible;

  /// No description provided for @notCompatible.
  ///
  /// In en, this message translates to:
  /// **'Not Compatible'**
  String get notCompatible;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get visa;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @orderConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed!'**
  String get orderConfirmed;

  /// No description provided for @serviceName.
  ///
  /// In en, this message translates to:
  /// **'Service Name'**
  String get serviceName;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get step3;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get step4;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @additions.
  ///
  /// In en, this message translates to:
  /// **'Additions'**
  String get additions;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
