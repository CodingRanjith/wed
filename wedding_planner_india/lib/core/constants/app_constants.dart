enum WeddingType {
  tamilHindu('Tamil Hindu Wedding'),
  tamilChristian('Tamil Christian Wedding'),
  tamilMuslim('Tamil Muslim Wedding'),
  telugu('Telugu Wedding'),
  kannada('Kannada Wedding'),
  keralaHindu('Kerala Hindu Wedding'),
  northIndian('North Indian Wedding'),
  interCaste('Inter-caste Wedding'),
  loveMarriage('Love Marriage'),
  courtMarriage('Court Marriage'),
  destination('Destination Wedding'),
  custom('Custom Wedding');

  const WeddingType(this.label);
  final String label;
}

enum CeremonySide { bride, groom, both }

enum GuestSide {
  brideWomen,
  brideMen,
  groomWomen,
  groomMen,
  friends,
  office,
  vip,
}

enum RsvpStatus { pending, coming, notComing }

enum FoodPreference { veg, nonVeg, jain }

enum BudgetCategory {
  venue('Venue'),
  decoration('Decoration'),
  food('Food'),
  photography('Photography'),
  jewelry('Jewelry'),
  dress('Dress'),
  rent('Rent'),
  makeup('Makeup'),
  travel('Travel'),
  invitation('Invitation'),
  gift('Gift'),
  pooja('Pooja'),
  flowers('Flowers'),
  music('Music'),
  accommodation('Accommodation'),
  rentalCar('Rental Car'),
  miscellaneous('Miscellaneous');

  const BudgetCategory(this.label);
  final String label;
}

enum TimelineStage {
  days365('365 Days Before', 365),
  days300('300 Days Before', 300),
  days180('180 Days Before', 180),
  days120('120 Days Before', 120),
  days90('90 Days Before', 90),
  days60('60 Days Before', 60),
  days30('30 Days Before', 30),
  days15('15 Days Before', 15),
  days7('7 Days Before', 7),
  weddingDay('Wedding Day', 0),
  afterMarriage('After Marriage', -1);

  const TimelineStage(this.label, this.daysBefore);
  final String label;
  final int daysBefore;
}

class AppConstants {
  AppConstants._();

  static const String hiveWeddingBox = 'wedding_box';
  static const String hiveSettingsBox = 'settings_box';
  static const String onboardingCompleteKey = 'onboarding_complete';
  static const String darkModeKey = 'dark_mode';
  static const String localeKey = 'locale';
  static const String reminderEnabledKey = 'reminder_enabled';
  static const String lastBackupAtKey = 'last_backup_at';
  static const String lastReminderAtKey = 'last_reminder_at';

  static const int backupFormatVersion = 1;
  static const int reminderIntervalDays = 30;
  static const String backupFileName = 'wedding_diary_backup.json';

  static const List<String> supportedCurrencies = ['INR', 'USD', 'EUR', 'GBP', 'AED'];
  static const List<String> supportedLocales = ['en', 'ta', 'hi', 'te', 'kn', 'ml'];

  static const List<String> religions = [
    'Hindu',
    'Christian',
    'Muslim',
    'Sikh',
    'Jain',
    'Buddhist',
    'Other',
  ];

  static const List<String> traditions = [
    'Tamil',
    'Telugu',
    'Kannada',
    'Malayalam',
    'North Indian',
    'Bengali',
    'Marathi',
    'Gujarati',
    'Punjabi',
    'Custom',
  ];
}
