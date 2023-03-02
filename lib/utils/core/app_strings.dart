class AppStrings {
  AppStrings._();
  // Auth Validator
  static const String required = 'required';
  static const String invalidEmail = 'invalidEmail';
  static const String weakPassword = 'weakPassword';
  static const String invalidPhoneNum = 'invalidPhoneNum';
  static const String invalidCode = 'invalidCode';
  static const String passDontMatch = 'passDontMatch';

  // Auth Exception
  static const String serverError = 'serverError';
  static const String invalidEmailPass = 'invalidEmailPass';
  static const String wrongPassword = 'wrongPass';
  static const String emailAlreadyInUse = 'emailAlreadyInUse';
  static const String accLocked = 'accLocked';
  static const String accNotVer = 'accNotVer';
  static const String noUserFound = 'noUserFound';

  // Auth General
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPass = 'confirmPass';
  static const String name = 'name';
  static const String bio = 'bio';

  //Signup
  static const String signup = 'signup';
  static const String signupTitle = 'signupTitle';
  static const String tom = 'tom';

  //Login Screen
  static const String login = 'login';
  static const String loginTitle = 'loginTitle';
  static const String loginRemember = 'loginRemember';
  static const String loginNotMember = 'loginNotMember';

  //Forgot Password Screen
  static const String forgPass = 'forPass';
  static const String resetPass = 'resetPass';
  static const String forgPassEmailSent = 'forPassEmailSent';
  static const String forgPassDes = 'forPassDes';

  // User Account
  static const String userAcc = 'userAcc';
  static const String editAcc = 'editAcc';
  static const String updateEmail = 'updateEmail';
  static const String changePass = 'changePass';
  static const String logout = 'logout';
  static const String newEmail = 'newEmail';
  static const String emailUpdated = 'emailUpdated';
  static const String userUpdated = 'userUpdated';
  static const String errUserUpdated = 'errUserUpdated';
  static const String current = 'current';
  static const String currentPass = 'currentPass';
  static const String neww = 'neww';
  static const String newPass = 'newPass';
  static const String passUpdated = 'passUpdated';

  //Navigation Bar
  static const String home = 'home';
  static const String search = 'search';
  static const String showCase = 'showCase';
  static const String category = 'category';
  static const String profile = 'profile';

  // Profile
  static const String contribute = 'contribute';
  static const String rateUs = 'rateUs';
  static const String privacyPolicy = 'privacyPolicy';
  static const String subscribe = 'subscribe';
  static const String language = 'language';
  static const String languageDes = 'languageDes';
  static const String darkMode = 'darkMode';
  static const String sync = 'sync';
  static const String syncDes = 'syncDes';

  // form scaffold
  static const String save = 'save';
  static const String submit = 'submit';

  // Dialog buttons
  static const String ok = 'oK';
  static const String cancel = 'cancel';

  // Errors
  static const String errUrl = 'urlError';
  static const String errAgreePolicy = 'errAgreePolicy';

  static const localizedValues = <String, Map<String, String>>{
    'en': {
      required: 'required',
      invalidEmail: 'Invalid Email',
      weakPassword: 'Weak Password',
      invalidPhoneNum: 'Invalid Phone Number',
      invalidCode: 'Invalid Code',
      serverError: 'Server Error! or No internet connection!',
      invalidEmailPass: 'Invalid email or password!',
      emailAlreadyInUse: 'Email already in use!',
      wrongPassword: 'Wrong password!',
      accLocked: 'Account is locked!',
      accNotVer: 'Account not verified!',
      noUserFound: 'No User Found!',
      passDontMatch: "Passwords don't match",
      email: "Email",
      password: "Password",
      confirmPass: "confirm Password",
      name: "Name",
      bio: "Bio",
      signup: 'Sign Up',
      signupTitle: 'Create an account',
      tom: 'Terms of Use',
      login: 'Login',
      loginTitle: 'Login to Your Account',
      loginRemember: 'Remeber Me',
      loginNotMember: 'Not a member yet?',
      forgPass: 'Forgot Password?',
      resetPass: 'Reset your Password',
      forgPassDes:
          'Enter your email address and we will send you instructions to reset your password.',
      forgPassEmailSent: 'Check your email to reset password.',
      userAcc: 'User Account',
      editAcc: 'Edit Account',
      updateEmail: 'Update Email',
      changePass: 'Change Password',
      logout: 'Logout',
      newEmail: 'New email',
      emailUpdated: 'Email updated!',
      userUpdated: 'User updated!',
      errUserUpdated: 'Error! failed to updated user.',
      current: 'Current',
      currentPass: 'Current Password',
      neww: 'New',
      newPass: 'New Password',
      passUpdated: 'Password Updated!',
      home: 'Home',
      search: 'Search',
      showCase: 'Show case',
      category: 'Category',
      profile: 'Profile',
      contribute: 'Contribute to the community',
      rateUs: 'Rate Us!',
      privacyPolicy: 'Privacy Policy',
      subscribe: 'Subscribe',
      language: 'Language',
      languageDes: 'Change app locale',
      darkMode: 'Dark Mode',
      sync: 'Sync',
      syncDes: 'Sync mode with your device',
      save: 'Save',
      submit: 'Submit',
      ok: 'OK',
      cancel: 'Cancel',
      errUrl: 'Unable to open the url',
      errAgreePolicy: 'Please, agree to the privacy policy.'
    },
    'de': {
      signup: 'Registrieren',
      tom: 'Nutzungsbedingungen',
      login: 'Anmeldung',
      forgPass: 'Passwort vergessen',
      home: 'Heim',
      showCase: 'Galerie',
      profile: 'Menü',
      rateUs: 'Bewerten Sie uns!',
      privacyPolicy: 'Datenschutz-Bestimmungen',
      subscribe: 'Abonnieren',
      language: 'Sprache',
      languageDes: 'Ändern Sie die App-Sprache.',
      darkMode: 'Dunkler Modus',
      sync: 'Synchronisieren',
      syncDes: 'Synchronisierungsmodus mit Ihrem Gerät.',
      save: 'Speichern',
      submit: 'Einreichen',
      ok: 'OK',
      cancel: 'Abbrechen',
    },
    'fr': {
      home: 'Accueil',
      showCase: 'Galerie',
      profile: 'Menu',
      rateUs: 'Notez-nous !',
      privacyPolicy: 'Politique de confidentialité',
      subscribe: 'S\'abonner',
      language: 'Langue',
      languageDes: 'Modifier la langue de l\'application.',
      darkMode: 'Mode sombre',
      sync: 'Synchronisation',
      syncDes: 'Mode de synchronisation avec votre appareil.',
    },
    'es': {
      home: 'Inicio',
      showCase: 'Galería',
      profile: 'Menú',
      rateUs: 'Califícanos',
      privacyPolicy: 'Política de privacidad',
      subscribe: 'Suscribirse',
      language: 'Idioma',
      languageDes: 'Cambiar el idioma de la aplicación.',
      darkMode: 'Modo oscuro',
      sync: 'Sincronización',
      syncDes: 'Modo de sincronización con tu dispositivo.',
    },
    'it': {
      home: 'Home',
      showCase: 'Galleria',
      profile: 'Menu',
      rateUs: 'Valutaci',
      privacyPolicy: 'Politica sulla privacy',
      subscribe: 'Iscriviti',
      language: 'Lingua',
      languageDes: 'Cambia la lingua dell\'app.',
      darkMode: 'Modalità scura',
      sync: 'Sincronizzazione',
      syncDes: 'Modalità di sincronizzazione con il tuo dispositivo.',
    },
    'ar': {
      home: 'الرئيسية',
      showCase: 'معرض الصور',
      profile: 'القائمة',
      rateUs: 'قيّمنا',
      privacyPolicy: 'سياسة الخصوصية',
      subscribe: 'اشترك',
      language: 'اللغة',
      languageDes: 'تغيير لغة التطبيق.',
      darkMode: 'الوضع الداكن',
      sync: 'المزامنة',
      syncDes: 'المزامنة مع جهازك.',
    },
  };
}
