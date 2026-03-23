/// Manual localization class for English, Uzbek, and Russian.
/// No code generation required — strings are defined inline.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Provides localized strings for the TBS Bank app.
class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations) ??
      AppLocalizations(const Locale('en'));

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String _t(String en, String uz, String ru) {
    switch (locale.languageCode) {
      case 'uz':
        return uz;
      case 'ru':
        return ru;
      default:
        return en;
    }
  }

  // ── Navigation ──────────────────────────────────────────
  String get home => _t('Home', 'Bosh sahifa', 'Главная');
  String get payments => _t('Payments', "To'lovlar", 'Платежи');
  String get history => _t('History', 'Tarix', 'История');
  String get profile => _t('Profile', 'Profil', 'Профиль');

  // ── App General ─────────────────────────────────────────
  String get appName => _t('TBS Bank', 'TBS Bank', 'ТБС Банк');
  String get comingSoon => _t('Coming soon!', 'Tez kunda!', 'Скоро!');
  String get loggedOut =>
      _t('Logged out successfully', 'Chiqildi', 'Успешно вышли');

  // ── Home ────────────────────────────────────────────────
  String get yourBalance => _t('Your balance', 'Balansingiz', 'Ваш баланс');
  String get hisobKitob => _t('Hisob-Kitob', 'Hisob-Kitob', 'Учёт');
  String get spendingManager => _t(
      'Personal spending manager', 'Shaxsiy xarajatlar', 'Менеджер расходов');
  String get specialOffers =>
      _t('Special offers', 'Maxsus takliflar', 'Специальные предложения');
  String get getNow => _t('Get Now', 'Olish', 'Получить');
  String get activate => _t('Activate', 'Faollashtirish', 'Активировать');
  String get transfers => _t('Transfers', "O'tkazmalar", 'Переводы');
  String get qrPay => _t('QR Pay', 'QR To\'lov', 'QR Оплата');

  // ── Profile ─────────────────────────────────────────────
  String get identityVerified =>
      _t('Identity Verified', 'Shaxs Tasdiqlangan', 'Личность Подтверждена');
  String get tbsFriends => _t('TBS Friends', "TBS Do'stlar", 'Друзья ТБС');
  String get orderCerts =>
      _t('Order certificates', 'Sertifikat buyurtma', 'Заказать справку');
  String get agreements => _t('Agreements', 'Shartnomalar', 'Договоры');
  String get personalData =>
      _t('Personal data', "Shaxsiy ma'lumotlar", 'Личные данные');

  // ── Settings ────────────────────────────────────────────
  String get appSettings =>
      _t('App Settings', 'Ilova sozlamalari', 'Настройки');
  String get notifications =>
      _t('Notifications', 'Bildirishnomalar', 'Уведомления');
  String get security => _t('Security', 'Xavfsizlik', 'Безопасность');
  String get language => _t('Language', 'Til', 'Язык');
  String get appearance => _t('Appearance', "Ko'rinish", 'Внешний вид');
  String get themeLight => _t('Light', "Yorug'", 'Светлая');
  String get themeDark => _t('Dark', "Qorong'u", 'Тёмная');
  String get themeSystem => _t('System', 'Tizim', 'Системная');

  // Language names shown in native script
  String get langEnglish => 'English';
  String get langUzbek => "O'zbekcha";
  String get langRussian => 'Русский';

  // Current language short label for trailing text
  String get currentLangLabel {
    switch (locale.languageCode) {
      case 'uz':
        return "O'zbek";
      case 'ru':
        return 'Русский';
      default:
        return 'English';
    }
  }

  // Current theme short label
  String themeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return themeLight;
      case ThemeMode.dark:
        return themeDark;
      case ThemeMode.system:
        return themeSystem;
    }
  }

  // ── Logout ──────────────────────────────────────────────
  String get logout => _t('Logout', 'Chiqish', 'Выйти');
  String get cancel => _t('Cancel', 'Bekor qilish', 'Отмена');
  String get logoutTitle => _t('Logout', 'Chiqish', 'Выход');
  String get logoutBody => _t('Are you sure you want to log out?',
      'Haqiqatan ham chiqmoqchimisiz?', 'Вы уверены, что хотите выйти?');

  // ── Products ────────────────────────────────────────────
  String get products => _t('Products', 'Mahsulotlar', 'Продукты');
  String get featured => _t('FEATURED', 'SARALANGAN', 'АКТУАЛЬНОЕ');
  String get platinumVisaTitle =>
      _t('The Platinum\nVisa', 'The Platinum\nVisa', 'The Platinum\nVisa');
  String get platinumVisaDesc => _t(
      'Unlimited rewards and premium travel insurance with zero annual fee for the first year.',
      'Cheksiz mukofotlar va birinchi yil uchun yillik to\'lovsiz premium sayohat sug\'urtasi.',
      'Безлимитные бонусы и премиальная туристическая страховка без годовой платы за первый год.');
  String get highYieldSavings =>
      _t('High-Yield Savings', 'Yuqori foizli omonatlar', 'Высокодоходные вклады');
  String get highYieldSavingsDesc =>
      _t('Grow at 4.5% APY with no minimum balance.',
          'Minimal balanssiz 4.5% APY bilan o\'sing.',
          'Рост 4.5% APY без минимального баланса.');
  String get personalLoansProduct =>
      _t('Personal Loans', 'Shaxsiy kreditlar', 'Потребительские кредиты');
  String get personalLoansProductDesc =>
      _t('Instant approval up to \$50,000.', '50 000 dollargacha tezkor tasdiqlash.',
          'Мгновенное одобрение до \$50 000.');

  String get digitalAssets =>
      _t('Digital Assets', 'Raqamli Aktivlar', 'Цифровые активы');
  String get exploreMarkets =>
      _t('Explore Markets', "Bozorlarni ko'rish", 'Изучить рынки');
  String get insuranceMore =>
      _t('Insurance & More', "Sug'urta va Boshqalar", 'Страхование и прочее');

  // ── Services ────────────────────────────────────────────
  String get eliteCreditCards =>
      _t('Elite Credit Cards', 'Elita kredit kartalari', 'Элитные кредитные карты');
  String get eliteCardsDesc => _t(
      'Experience unparalleled luxury. VIP airport lounges, travel and 24/7 concierge services.',
      'Betakror hashamatni his qiling. VIP aeroport zallari, sayohat va 24/7 konsyerj xizmatlari.',
      'Испытайте непревзойденную роскошь. VIP-залы ожидания, путешествия и круглосуточный консьерж.');
  String get exploreCards =>
      _t('Explore Cards', 'Kartalarni ko\'rish', 'Изучить карты');
  String get compareTiers =>
      _t('Compare Tiers', 'Darajalarni solishtirish', 'Сравнить уровни');
  String get growthDeposits =>
      _t('Growth Deposits', 'O\'sish omonatlari', 'Вклады роста');
  String get highYieldLabel =>
      _t('HIGH YIELD', 'YUQORI FOIZLI', 'ВЫСОКИЙ ДОХОД');
  String get openAccount =>
      _t('Open Account', 'Hisob ochish', 'Открыть счет');
  String get personalHomeLoans =>
      _t('Personal & Home Loans', 'Shaxsiy va uy kreditlari', 'Кредиты на жилье и личные нужды');
  String get loansDesc => _t(
      'Personalized solutions with approval as fast as 24 hours. No hidden fees, ever.',
      '24 soatgacha tezlikda tasdiqlanadigan shaxsiylashtirilgan yechimlar. Yashirin to\'lovlar yo\'q.',
      'Персонализированные решения с одобрением за 24 часа. Без скрытых комиссий.');
  String get applyForLoan =>
      _t('Apply for Loan', 'Kreditga ariza berish', 'Подать заявку');
  String get mortgageCalc =>
      _t('Mortgage Calculator', 'Ipoteka kalkulyatori', 'Ипотечный калькулятор');
  String get wealthManagement =>
      _t('Wealth Management', 'Boylikni boshqarish', 'Управление капиталом');
  String get wealthManagementDesc => _t(
      'Grow your portfolio managed by industry experts.',
      'Soha mutaxassislari tomonidan boshqariladigan portfelingizni oshiring.',
      'Увеличивайте свой портфель под управлением экспертов.');
  String get consultAdvisor =>
      _t('Consult an Advisor →', 'Maslahatchi bilan bog\'lanish →', 'Консультация эксперта →');
  String get digitalVault =>
      _t('Digital Vault', 'Raqamli seyf', 'Цифровой сейф');
  String get digitalVaultDesc => _t(
      'Bank-grade encrypted document storage.',
      'Bank darajasidagi shifrlangan hujjatlarni saqlash.',
      'Банковское хранилище для документов.');
  String get manageDocuments =>
      _t('Manage Documents →', 'Hujjatlarni boshqarish →', 'Управление документами →');

  // ── History ─────────────────────────────────────────────
  String get searchHint => _t('Search transactions...',
      'Tranzaksiyalarni qidiring...', 'Поиск транзакций...');
  String get last30Days =>
      _t('Last 30 Days', 'Oxirgi 30 kun', 'Последние 30 дней');
  String get allAccounts =>
      _t('All Accounts', 'Barcha hisoblar', 'Все счета');
  String get spending => _t('Spending', 'Xarajatlar', 'Расходы');
  String get allTypes => _t('All Types', 'Barcha turlar', 'Все типы');
  String get incomes => _t('Incomes', 'Daromadlar', 'Доходы');

  // ── Footer ──────────────────────────────────────────────
  String get footerCopyright => _t('TBS BANK INTERNATIONAL © 2024',
      'TBS BANK INTERNATIONAL © 2024', 'ТБС БАНК ИНТЕРНЭШНЛ © 2024');
  String get versionText =>
      _t('Version 4.12.0 (Build 821)', 'Versiya 4.12.0 (Build 821)',
          'Версия 4.12.0 (Build 821)');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'uz', 'ru'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture(AppLocalizations(locale));

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
