// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Wedding Diary';

  @override
  String get welcome => 'Welcome to Wedding Diary';

  @override
  String get welcomeSubtitle => 'Your Complete Indian Wedding Operating System';

  @override
  String get getStarted => 'Get Started';

  @override
  String get createWedding => 'Create Your Wedding';

  @override
  String get brideName => 'Bride Name';

  @override
  String get groomName => 'Groom Name';

  @override
  String get weddingDate => 'Wedding Date';

  @override
  String get location => 'Location';

  @override
  String get weddingType => 'Wedding Type';

  @override
  String get budget => 'Budget';

  @override
  String get numberOfGuests => 'Number of Guests';

  @override
  String get religion => 'Religion';

  @override
  String get tradition => 'Tradition';

  @override
  String get currency => 'Currency';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get done => 'Done';

  @override
  String get skip => 'Skip';

  @override
  String get home => 'Home';

  @override
  String get planner => 'Planner';

  @override
  String get guests => 'Guests';

  @override
  String get profile => 'Profile';

  @override
  String daysLeft(int count) {
    return '$count Days Left';
  }

  @override
  String pendingTasks(int count) {
    return '$count Pending';
  }

  @override
  String get todaysTasks => 'Today\'s Tasks';

  @override
  String get upcomingCeremony => 'Upcoming Ceremony';

  @override
  String get latestExpense => 'Latest Expense';

  @override
  String get quickAdd => 'Quick Add';

  @override
  String get ceremonies => 'Ceremonies';

  @override
  String get brideSide => 'Side 1';

  @override
  String get groomSide => 'Side 2';

  @override
  String get brideSideWomen => 'Women · Side 1';

  @override
  String get brideSideMen => 'Men · Side 1';

  @override
  String get groomSideWomen => 'Women · Side 2';

  @override
  String get groomSideMen => 'Men · Side 2';

  @override
  String get guestSideFriends => 'Friends';

  @override
  String get guestSideOffice => 'Office';

  @override
  String get guestSideVip => 'VIP';

  @override
  String get guestSide => 'Guest Side';

  @override
  String get foodPreference => 'Food Preference';

  @override
  String get jainFood => 'Jain';

  @override
  String get allGuests => 'All';

  @override
  String get men => 'Men';

  @override
  String get women => 'Women';

  @override
  String get addCeremony => 'Add Ceremony';

  @override
  String get settings => 'Settings';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get backup => 'Backup & Restore';

  @override
  String get payments => 'Payments';

  @override
  String get remaining => 'Remaining';

  @override
  String get estimated => 'Estimated';

  @override
  String get actual => 'Actual';

  @override
  String get paid => 'Paid';

  @override
  String get addExpense => 'Add Expense';

  @override
  String get addGuest => 'Add Guest';

  @override
  String get invitationSent => 'Invitation Sent';

  @override
  String get rsvp => 'RSVP';

  @override
  String get coming => 'Coming';

  @override
  String get notComing => 'Not Coming';

  @override
  String get veg => 'Veg';

  @override
  String get nonVeg => 'Non Veg';

  @override
  String get timeline => 'Timeline';

  @override
  String get checklist => 'Checklist';

  @override
  String get notes => 'Notes';

  @override
  String get venue => 'Venue';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get reorder => 'Reorder';

  @override
  String get customCeremony => 'Custom Ceremony';

  @override
  String get poweredByTechackode => 'A product by Techackode';

  @override
  String get aboutApp => 'About';

  @override
  String aboutAppDescription(
    String productName,
    String version,
    String brandLine,
  ) {
    return '$productName v$version\n$brandLine\n100% offline — no backend, data stays on your device';
  }
}
