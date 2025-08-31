import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Eco Watch',
      'coastalPeople': 'Community People',
      'ngosGovernment': 'NGOs & Government',
      'researchersStudents': 'Researchers/Students',
      'login': 'Login',
      'signup': 'Sign Up',
      'fullName': 'Full Name',
      'email': 'Email',
      'setPassword': 'Set Password',
      'confirmPassword': 'Confirm Password',
      'password': 'Password',
      'enterOtp': 'Enter OTP',
      'forgotPassword': 'Forgot Password?',
      'or': 'OR',
      'loginWithPassword': 'Login with Password',
      'loginWithOtp': 'Login with OTP',
      'dontHaveAccount': 'Don\'t have an account? Sign Up',
      'alreadyHaveAccount': 'Already have an account? Login',
      'nameRequired': 'Name is required',
      'emailRequired': 'Email is required',
      'validEmailRequired': 'Please enter a valid email',
      'passwordRequired': 'Password is required',
      'passwordLength': 'Password must be at least 6 characters',
      'confirmPasswordRequired': 'Please confirm your password',
      'passwordsDontMatch': 'Passwords don\'t match',
      'otpRequired': 'OTP is required',
      'validOtpRequired': 'OTP must be 6 digits',
      'citizenDashboard': 'Citizen Dashboard',
      'raiseComplaint': 'Raise a Complaint',
      'home': 'Home',
      'history': 'History',
      'profile': 'Profile',
      'welcome': 'Welcome!',
      'dashboardSummary': 'Help protect mangroves by reporting issues and tracking your impact.',
      'yourBadge': 'Your Badge Progress',
      'totalComplaints': 'Total Complaints',
      'verifiedComplaints': 'Verified',
      'pendingComplaints': 'Pending',
      'treesPlanted': 'Trees Planted',
      'chooseImageSource': 'Choose Image Source',
      'camera': 'Camera',
      'gallery': 'Gallery',
      'issueType': 'Issue Type',
      'description': 'Short Description',
      'locationTagging': 'Your location will be automatically tagged with the photo',
      'cancel': 'Cancel',
      'submit': 'Submit',
      'issueTypeRequired': 'Please select an issue type',
      'descriptionRequired': 'Please provide a description',
      'complaintSubmitted': 'Complaint submitted successfully!',
      'illegalCutting': 'Illegal Cutting',
      'dumping': 'Dumping',
      'pollution': 'Pollution',
      'other': 'Other',
      'complaintHistory': 'Complaint History',
      'status': 'Status',
      'pending': 'Pending',
      'verified': 'Verified',
      'resolved': 'Resolved',
      'viewDetails': 'View Details',
      'logout': 'Logout',
      'location': 'Location',
      'contact': 'Contact',
      'currentBadge': 'Current Badge',
      'bronze': 'Bronze',
      'silver': 'Silver',
      'gold': 'Gold',
      'uploadTreeProof': 'Upload Tree Planting Proof',
      'selectLanguage': 'Select Language',
      'readAloud': 'Read Aloud',
      'listenToContent': 'Listen to content',
      'english': 'English',
      'hindi': 'Hindi',
      'spanish': 'Spanish',
      'french': 'French',
      'officialLogin': 'Official Login',
      'officialSignup': 'Official Signup',
      'officialId': 'Official ID',
      'officialIdNote': 'Your official ID will be provided by the administration',
      'officialIdRequired': 'Official ID is required',
      'createOfficialAccount': 'Create Official Account',
      'alreadyHaveOfficialAccount': 'Already have an official account?',
      'ngoDashboard': 'NGOs & Government Dashboard',
      'complaints': 'Complaints',
      'map': 'Map',
      'analytics': 'Analytics',
      'filter': 'Filter',
      // 'status': 'Status', // ← DUPLICATE REMOVED
      'severity': 'Severity',
      // 'location': 'Location', // ← DUPLICATE REMOVED
      'type': 'Type',
      'date': 'Date',
      'applyFilters': 'Apply Filters',
      'clearAll': 'Clear All',
      'updateStatus': 'Update Status',
      'addNotes': 'Add Notes',
      'markAsVerified': 'Mark as Verified',
      'markAsResolved': 'Mark as Resolved',
      'hotspotMap': 'Hotspot Map',
      'redZones': 'Red Zones',
      'complaintTrends': 'Complaint Trends',
      'exportData': 'Export Data',
      'creditsEarned': 'Credits Earned',
      'badges': 'Badges',
      'funding': 'Funding',
      // Add these to your ARB files
      "signupSuccess": "Account created successfully. Please verify your email.",
      "verifyEmail": "Login Successfully",
      "userNotFound": "No account found with this email.",
      "wrongPassword": "Incorrect password.",
      "invalidEmail": "Invalid email address.",
      "resetEmailSent": "Password reset email sent."
    },
    'hi': {
      'appTitle': 'ईको वॉच',
      'coastalPeople': 'तटीय समुदाय',
      'ngosGovernment': 'गैर सरकारी संगठन और सरकार',
      'researchersStudents': 'शोधकर्ता/छात्र',
      'login': 'लॉग इन',
      'signup': 'साइन अप',
      'fullName': 'पूरा नाम',
      'email': 'ईमेल',
      'setPassword': 'पासवर्ड सेट करें',
      'confirmPassword': 'पासवर्ड की पुष्टि करें',
      'password': 'पासवर्ड',
      'enterOtp': 'OTP दर्ज करें',
      'forgotPassword': 'पासवर्ड भूल गए?',
      'or': 'या',
      'loginWithPassword': 'पासवर्ड से लॉग इन करें',
      'loginWithOtp': 'OTP से लॉग इन करें',
      'dontHaveAccount': 'खाता नहीं है? साइन अप करें',
      'alreadyHaveAccount': 'पहले से ही एक खाता मौजूद है? लॉग इन करें',
      'nameRequired': 'नाम आवश्यक है',
      'emailRequired': 'ईमेल आवश्यक है',
      'validEmailRequired': 'कृपया एक वैध ईमेल दर्ज करें',
      'passwordRequired': 'पासवर्ड आवश्यक है',
      'passwordLength': 'पासवर्ड कम से कम 6 वर्णों का होना चाहिए',
      'confirmPasswordRequired': 'कृपया अपने पासवर्ड की पुष्टि करें',
      'passwordsDontMatch': 'पासवर्ड मेल नहीं खा रहे हैं',
      'otpRequired': 'OTP आवश्यक है',
      'validOtpRequired': 'OTP 6 अंकों का होना चाहिए',
      'citizenDashboard': 'नागरिक डैशबोर्ड',
      'raiseComplaint': 'शिकायत दर्ज करें',
      'home': 'होम',
      'history': 'इतिहास',
      'profile': 'प्रोफाइल',
      'welcome': 'स्वागत है!',
      'dashboardSummary': 'मुद्दों की रिपोर्ट करके और अपने प्रभाव को ट्रैक करके मैंग्रोव की रक्षा में मदद करें।',
      'yourBadge': 'आपकी बैज प्रगति',
      'totalComplaints': 'कुल शिकायतें',
      'verifiedComplaints': 'सत्यापित',
      'pendingComplaints': 'लंबित',
      'treesPlanted': 'लगाए गए पेड़',
      'chooseImageSource': 'छवि स्रोत चुनें',
      'camera': 'कैमरा',
      'gallery': 'गैलरी',
      'issueType': 'मुद्दे का प्रकार',
      'description': 'संक्षिप्त विवरण',
      'locationTagging': 'आपका स्थान फोटो के साथ स्वचालित रूप से टैग किया जाएगा',
      'cancel': 'रद्द करें',
      'submit': 'जमा करें',
      'issueTypeRequired': 'कृपया एक मुद्दे का प्रकार चुनें',
      'descriptionRequired': 'कृपया एक विवरण प्रदान करें',
      'complaintSubmitted': 'शिकायत सफलतापूर्वक दर्ज की गई!',
      'illegalCutting': 'अवैध कटाई',
      'dumping': 'डंपिंग',
      'pollution': 'प्रदूषण',
      'other': 'अन्य',
      'complaintHistory': 'शिकायत इतिहास',
      'status': 'स्थिति',
      'pending': 'लंबित',
      'verified': 'सत्यापित',
      'resolved': 'हल',
      'viewDetails': 'विवरण देखें',
      'logout': 'लॉगआउट',
      'location': 'स्थान',
      'contact': 'संपर्क',
      'currentBadge': 'वर्तमान बैज',
      'bronze': 'कांस्य',
      'silver': 'रजत',
      'gold': 'स्वर्ण',
      'uploadTreeProof': 'पेड़ लगाने का प्रमाण अपलオड करें',
      'selectLanguage': 'भाषा चुनें',
      'readAloud': 'जोर से पढ़ें',
      'listenToContent': 'सामग्री सुनें',
      'english': 'अंग्रेजी',
      'hindi': 'हिंदी',
      'spanish': 'स्पेनिश',
      'french': 'फ्रेंच',
      'officialLogin': 'आधिकारिक लॉगिन',
      'officialSignup': 'आधिकारिक साइनअप',
      'officialId': 'आधिकारिक आईडी',
      'officialIdNote': 'आपकी आधिकारिक आईडी प्रशासन द्वारा प्रदान की जाएगी',
      'officialIdRequired': 'आधिकारिक आईडी आवश्यक है',
      'createOfficialAccount': 'आधिकारिक खाता बनाएं',
      'alreadyHaveOfficialAccount': 'पहले से ही आधिकारिक खाता है?',
      'ngoDashboard': 'एनजीओ और सरकार डैशबोर्ड',
      'complaints': 'शिकायतें',
      'map': 'मानचित्र',
      'analytics': 'विश्लेषण',
      'filter': 'फ़िल्टर',
      // 'status': 'स्थिति', // ← DUPLICATE REMOVED
      'severity': 'गंभीरता',
      // 'location': 'स्थान', // ← DUPLICATE REMOVED
      'type': 'प्रकार',
      'date': 'तारीख',
      'applyFilters': 'फ़िल्टर लागू करें',
      'clearAll': 'सभी साफ करें',
      'updateStatus': 'स्थिति अपडेट करें',
      'addNotes': 'नोट्स जोड़ें',
      'markAsVerified': 'सत्यापित के रूप में चिह्नित करें',
      'markAsResolved': 'हल के रूप में चिह्नित करें',
      'hotspotMap': 'हॉटस्पॉट मानचित्र',
      'redZones': 'रेड जोन',
      'complaintTrends': 'शिकायत रुझान',
      'exportData': 'डेटा निर्यात करें',
      'creditsEarned': 'अर्जित क्रेडिट',
      'badges': 'बैज',
      'funding': 'वित्तपोषण',
    },
    'es': {
      'appTitle': 'Eco Watch',
      'coastalPeople': 'Gente Costera',
      'ngosGovernment': 'ONGs y Gobierno',
      'researchersStudents': 'Investigadores/Estudiantes',
      'login': 'Iniciar Sesión',
      'signup': 'Registrarse',
      'fullName': 'Nombre Completo',
      'email': 'Correo Electrónico',
      'setPassword': 'Establecer Contraseña',
      'confirmPassword': 'Confirmar Contraseña',
      'password': 'Contraseña',
      'enterOtp': 'Ingresar OTP',
      'forgotPassword': '¿Olvidaste tu contraseña?',
      'or': 'O',
      'loginWithPassword': 'Iniciar sesión con contraseña',
      'loginWithOtp': 'Iniciar sesión con OTP',
      'dontHaveAccount': '¿No tienes una cuenta? Regístrate',
      'alreadyHaveAccount': '¿Ya tienes una cuenta? Inicia sesión',
      'nameRequired': 'Se requiere nombre',
      'emailRequired': 'Se requiere correo electrónico',
      'validEmailRequired': 'Por favor ingrese un correo electrónico válido',
      'passwordRequired': 'Se requiere contraseña',
      'passwordLength': 'La contraseña debe tener al menos 6 caracteres',
      'confirmPasswordRequired': 'Por favor confirme su contraseña',
      'passwordsDontMatch': 'Las contraseñas no coinciden',
      'otpRequired': 'Se requiere OTP',
      'validOtpRequired': 'OTP debe tener 6 dígitos',
      'citizenDashboard': 'Panel de Ciudadano',
      'raiseComplaint': 'Presentar una Queja',
      'home': 'Inicio',
      'history': 'Historial',
      'profile': 'Perfil',
      'welcome': '¡Bienvenido!',
      'dashboardSummary': 'Ayude a proteger los manglares reportando problemas y rastreando su impacto.',
      'yourBadge': 'Tu Progreso de Insignia',
      'totalComplaints': 'Quejas Totales',
      'verifiedComplaints': 'Verificado',
      'pendingComplaints': 'Pendiente',
      'treesPlanted': 'Árboles Plantados',
      'chooseImageSource': 'Elegir Fuente de Imagen',
      'camera': 'Cámara',
      'gallery': 'Galería',
      'issueType': 'Tipo de Problema',
      'description': 'Descripción Corta',
      'locationTagging': 'Su ubicación se etiquetará automáticamente con la foto',
      'cancel': 'Cancelar',
      'submit': 'Enviar',
      'issueTypeRequired': 'Por favor seleccione un tipo de problema',
      'descriptionRequired': 'Por favor proporcione una descripción',
      'complaintSubmitted': '¡Queja enviada con éxito!',
      'illegalCutting': 'Tala Ilegal',
      'dumping': 'Vertido',
      'pollution': 'Contaminación',
      'other': 'Otro',
      'complaintHistory': 'Historial de Quejas',
      'status': 'Estado',
      'pending': 'Pendiente',
      'verified': 'Verificado',
      'resolved': 'Resuelto',
      'viewDetails': 'Ver Detalles',
      'logout': 'Cerrar Sesión',
      'location': 'Ubicación',
      'contact': 'Contacto',
      'currentBadge': 'Insignia Actual',
      'bronze': 'Bronce',
      'silver': 'Plata',
      'gold': 'Oro',
      'uploadTreeProof': 'Subir Prueba de Siembra de Árboles',
      'selectLanguage': 'Seleccionar Idioma',
      'readAloud': 'Leer en Voz Alta',
      'listenToContent': 'Escuchar contenido',
      'english': 'Inglés',
      'hindi': 'Hindi',
      'spanish': 'Español',
      'french': 'Francés',
      'officialLogin': 'Inicio de Sesión Oficial',
      'officialSignup': 'Registro Oficial',
      'officialId': 'ID Oficial',
      'officialIdNote': 'Su ID oficial será proporcionado por la administración',
      'officialIdRequired': 'Se requiere ID oficial',
      'createOfficialAccount': 'Crear Cuenta Oficial',
      'alreadyHaveOfficialAccount': '¿Ya tiene una cuenta oficial?',
      'ngoDashboard': 'Panel de ONG y Gobierno',
      'complaints': 'Quejas',
      'map': 'Mapa',
      'analytics': 'Analítica',
      'filter': 'Filtrar',
      // 'status': 'Estado', // ← DUPLICATE REMOVED
      'severity': 'Gravedad',
      // 'location': 'Ubicación', // ← DUPLICATE REMOVED
      'type': 'Tipo',
      'date': 'Fecha',
      'applyFilters': 'Aplicar Filtros',
      'clearAll': 'Limpiar Todo',
      'updateStatus': 'Actualizar Estado',
      'addNotes': 'Agregar Notas',
      'markAsVerified': 'Marcar como Verificado',
      'markAsResolved': 'Marcar como Resuelto',
      'hotspotMap': 'Mapa de Puntos Calientes',
      'redZones': 'Zonas Rojas',
      'complaintTrends': 'Tendencias de Quejas',
      'exportData': 'Exportar Datos',
      'creditsEarned': 'Créditos Ganados',
      'badges': 'Insignias',
      'funding': 'Financiación',
    },
    'fr': {
      'appTitle': 'Eco Watch',
      'coastalPeople': 'Population Côtière',
      'ngosGovernment': 'ONGs et Gouvernement',
      'researchersStudents': 'Chercheurs/Étudiants',
      'login': 'Connexion',
      'signup': 'Inscription',
      'fullName': 'Nom Complet',
      'email': 'E-mail',
      'setPassword': 'Définir le Mot de Passe',
      'confirmPassword': 'Confirmer le Mot de Passe',
      'password': 'Mot de Passe',
      'enterOtp': 'Entrer OTP',
      'forgotPassword': 'Mot de passe oublié?',
      'or': 'OU',
      'loginWithPassword': 'Se connecter avec le mot de passe',
      'loginWithOtp': 'Se connecter avec OTP',
      'dontHaveAccount': 'Vous n\'avez pas de compte? Inscrivez-vous',
      'alreadyHaveAccount': 'Vous avez déjà un compte? Connectez-vous',
      'nameRequired': 'Le nom est requis',
      'emailRequired': 'L\'e-mail est requis',
      'validEmailRequired': 'Veuillez entrer un e-mail valide',
      'passwordRequired': 'Le mot de passe est requis',
      'passwordLength': 'Le mot de passe doit contenir au moins 6 caractères',
      'confirmPasswordRequired': 'Veuillez confirmer votre mot de passe',
      'passwordsDontMatch': 'Les mots de passe ne correspondent pas',
      'otpRequired': 'OTP requis',
      'validOtpRequired': 'OTP doit comporter 6 chiffres',
      'citizenDashboard': 'Tableau de Bord Citoyen',
      'raiseComplaint': 'Déposer une Plainte',
      'home': 'Accueil',
      'history': 'Historique',
      'profile': 'Profil',
      'welcome': 'Bienvenue!',
      'dashboardSummary': 'Aidez à protéger les mangroves en signalant les problèmes et en suivant votre impact.',
      'yourBadge': 'Votre Progrès de Badge',
      'totalComplaints': 'Plaintes Totales',
      'verifiedComplaints': 'Vérifié',
      'pendingComplaints': 'En Attente',
      'treesPlanted': 'Arbres Plantés',
      'chooseImageSource': 'Choisir la Source de l\'Image',
      'camera': 'Caméra',
      'gallery': 'Galerie',
      'issueType': 'Type de Problème',
      'description': 'Description Courte',
      'locationTagging': 'Votre position sera automatiquement taguée avec la photo',
      'cancel': 'Annuler',
      'submit': 'Soumettre',
      'issueTypeRequired': 'Veuillez sélectionner un type de problème',
      'descriptionRequired': 'Veuillez fournir une description',
      'complaintSubmitted': 'Plainte soumise avec succès!',
      'illegalCutting': 'Coupe Illégale',
      'dumping': 'Déversement',
      'pollution': 'Pollution',
      'other': 'Autre',
      'complaintHistory': 'Historique des Plaintes',
      'status': 'Statut',
      'pending': 'En Attente',
      'verified': 'Vérifié',
      'resolved': 'Résolu',
      'viewDetails': 'Voir les Détails',
      'logout': 'Déconnexion',
      'location': 'Localisation',
      'contact': 'Contact',
      'currentBadge': 'Badge Actuel',
      'bronze': 'Bronce',
      'silver': 'Argent',
      'gold': 'Or',
      'uploadTreeProof': 'Télécharger une Preuve de Plantation d\'Arbre',
      'selectLanguage': 'Sélectionner la Langue',
      'readAloud': 'Lire à Haute Voix',
      'listenToContent': 'Écouter le contenu',
      'english': 'Anglais',
      'hindi': 'Hindi',
      'spanish': 'Español',
      'french': 'Français',
      'officialLogin': 'Connexion Officielle',
      'officialSignup': 'Inscription Officielle',
      'officialId': 'ID Officiel',
      'officialIdNote': 'Votre ID officiel sera fourni par l\'administration',
      'officialIdRequired': 'ID officiel requis',
      'createOfficialAccount': 'Créer un Compte Officiel',
      'alreadyHaveOfficialAccount': 'Vous avez déjà un compte officiel?',
      'ngoDashboard': 'Tableau de Bord ONG et Gouvernement',
      'complaints': 'Plaintes',
      'map': 'Carte',
      'analytics': 'Analytique',
      'filter': 'Filtre',
      // 'status': 'Statut', // ← DUPLICATE REMOVED
      'severity': 'Gravité',
      // 'location': 'Emplacement', // ← DUPLICATE REMOVED
      'type': 'Type',
      'date': 'Date',
      'applyFilters': 'Appliquer les Filtres',
      'clearAll': 'Tout Effacer',
      'updateStatus': 'Mettre à Jour le Statut',
      'addNotes': 'Ajouter des Notes',
      'markAsVerified': 'Marquer comme Vérifié',
      'markAsResolved': 'Marquer comme Résolu',
      'hotspotMap': 'Carte des Points Chauds',
      'redZones': 'Zones Rouges',
      'complaintTrends': 'Tendances des Plaintes',
      'exportData': 'Exporter les Données',
      'creditsEarned': 'Crédits Gagnés',
      'badges': 'Badges',
      'funding': 'Financement',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? key;
  }

  // Helper methods for each translation
  String get appTitle => translate('appTitle');
  String get coastalPeople => translate('coastalPeople');
  String get ngosGovernment => translate('ngosGovernment');
  String get researchersStudents => translate('researchersStudents');
  String get login => translate('login');
  String get signup => translate('signup');
  String get fullName => translate('fullName');
  String get email => translate('email');
  String get setPassword => translate('setPassword');
  String get confirmPassword => translate('confirmPassword');
  String get password => translate('password');
  String get enterOtp => translate('enterOtp');
  String get forgotPassword => translate('forgotPassword');
  String get or => translate('or');
  String get loginWithPassword => translate('loginWithPassword');
  String get loginWithOtp => translate('loginWithOtp');
  String get dontHaveAccount => translate('dontHaveAccount');
  String get alreadyHaveAccount => translate('alreadyHaveAccount');
  String get nameRequired => translate('nameRequired');
  String get emailRequired => translate('emailRequired');
  String get validEmailRequired => translate('validEmailRequired');
  String get passwordRequired => translate('passwordRequired');
  String get passwordLength => translate('passwordLength');
  String get confirmPasswordRequired => translate('confirmPasswordRequired');
  String get passwordsDontMatch => translate('passwordsDontMatch');
  String get otpRequired => translate('otpRequired');
  String get validOtpRequired => translate('validOtpRequired');
  String get citizenDashboard => translate('citizenDashboard');
  String get raiseComplaint => translate('raiseComplaint');
  String get home => translate('home');
  String get history => translate('history');
  String get profile => translate('profile');
  String get welcome => translate('welcome');
  String get dashboardSummary => translate('dashboardSummary');
  String get yourBadge => translate('yourBadge');
  String get totalComplaints => translate('totalComplaints');
  String get verifiedComplaints => translate('verifiedComplaints');
  String get pendingComplaints => translate('pendingComplaints');
  String get treesPlanted => translate('treesPlanted');
  String get chooseImageSource => translate('chooseImageSource');
  String get camera => translate('camera');
  String get gallery => translate('gallery');
  String get issueType => translate('issueType');
  String get description => translate('description');
  String get locationTagging => translate('locationTagging');
  String get cancel => translate('cancel');
  String get submit => translate('submit');
  String get issueTypeRequired => translate('issueTypeRequired');
  String get descriptionRequired => translate('descriptionRequired');
  String get complaintSubmitted => translate('complaintSubmitted');
  String get illegalCutting => translate('illegalCutting');
  String get dumping => translate('dumping');
  String get pollution => translate('pollution');
  String get other => translate('other');
  String get complaintHistory => translate('complaintHistory');
  String get status => translate('status');
  String get pending => translate('pending');
  String get verified => translate('verified');
  String get resolved => translate('resolved');
  String get viewDetails => translate('viewDetails');
  String get logout => translate('logout');
  String get location => translate('location');
  String get contact => translate('contact');
  String get currentBadge => translate('currentBadge');
  String get bronze => translate('bronze');
  String get silver => translate('silver');
  String get gold => translate('gold');
  String get uploadTreeProof => translate('uploadTreeProof');
  String get selectLanguage => translate('selectLanguage');
  String get readAloud => translate('readAloud');
  String get listenToContent => translate('listenToContent');
  String get english => translate('english');
  String get hindi => translate('hindi');
  String get spanish => translate('spanish');
  String get french => translate('french');

  // NGO & Government Dashboard Getters
  String get officialLogin => translate('officialLogin');
  String get officialSignup => translate('officialSignup');
  String get officialId => translate('officialId');
  String get officialIdNote => translate('officialIdNote');
  String get officialIdRequired => translate('officialIdRequired');
  String get createOfficialAccount => translate('createOfficialAccount');
  String get alreadyHaveOfficialAccount => translate('alreadyHaveOfficialAccount');
  String get ngoDashboard => translate('ngoDashboard');
  String get complaints => translate('complaints');
  String get map => translate('map');
  String get analytics => translate('analytics');
  String get filter => translate('filter');
  String get complaintStatus => translate('status');
  String get severity => translate('severity');
  String get complaintLocation => translate('location');
  String get complaintType => translate('type');
  String get date => translate('date');
  String get applyFilters => translate('applyFilters');
  String get clearAll => translate('clearAll');
  String get updateStatus => translate('updateStatus');
  String get addNotes => translate('addNotes');
  String get markAsVerified => translate('markAsVerified');
  String get markAsResolved => translate('markAsResolved');
  String get hotspotMap => translate('hotspotMap');
  String get redZones => translate('redZones');
  String get complaintTrends => translate('complaintTrends');
  String get exportData => translate('exportData');
  String get creditsEarned => translate('creditsEarned');
  String get badges => translate('badges');
  String get funding => translate('funding');
  String get signupSuccess => translate('signupSuccess');
  String get verifyEmail => translate('verifyEmail');
  String get userNotFound => translate('userNotFound');
  String get wrongPassword => translate('wrongPassword');
  String get invalidEmail => translate('invalidEmail');
  String get resetEmailSent => translate('resetEmailSent');

  get type => null;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return false;
  }
}