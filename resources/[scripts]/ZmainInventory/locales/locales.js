const TranslationSelected = 'fr';
const Translations = {}

// Translations in French
Translations['fr'] = {
    'inventory': 'Inventaire',

    'use': 'UTILISER',
    'give': 'DONNER',
    'rename': 'RENOMMER',
    'delete': 'SUPPRIMER',

    'accept': 'VALIDER',
    'watch': 'REGARDER',
    'show': 'MONTRER',

    'idcard_name': 'Nom',
    'idcard_dob': 'Naissance',
    'idcard_sex': 'Genre',
    'idcard_height': 'Taille',
    'idcard_signature': 'SIGNATURE',

    'help_interfaces': 'Interface lente: cochez la case \'NUI in-process GPU\' dans les paramètres du launcher FiveM Souris bloquée: changez la méthode d\'entrée dans les paramètres du jeu, catégorie clavier/souris',
};

// Translations in English
Translations['en'] = {
    'inventory': 'Inventory',

    'use': 'USE',
    'give': 'GIVE',
    'rename': 'RENAME',
    'delete': 'DELETE',

    'accept': 'VALIDATE',
    'watch': 'WATCH',
    'show': 'SHOW',

    'idcard_name': 'Name',
    'idcard_dob': 'Date of Birth',
    'idcard_sex': 'Gender',
    'idcard_height': 'Height',
    'idcard_signature': 'SIGNATURE',

    'help_interfaces': 'Slow interface: Check the \'NUI in-process GPU\' option in the Fivem launcher settings Blocked mouse: Change the input method in the game settings, keyboard/mouse category',
};

// Translations in Spanish
Translations['es'] = {
    'inventory': 'Inventario',

    'use': 'USAR',
    'give': 'DAR',
    'rename': 'RENOMBRAR',
    'delete': 'ELIMINAR',

    'accept': 'VALIDAR',
    'watch': 'VER',
    'show': 'MOSTRAR',

    'idcard_name': 'Nombre',
    'idcard_dob': 'Fecha de Nacimiento',
    'idcard_sex': 'Género',
    'idcard_height': 'Altura',
    'idcard_signature': 'Firma',

    'help_interfaces': 'Interfaz lenta: Marcar la opción "NUI in-process GPU" en la configuración del launcher de Fivem Ratón bloqueado: Cambiar el método de entrada en la configuración del juego, categoría teclado/ratón',
};


function _U(a) {
    if (Translations[TranslationSelected] && Translations[TranslationSelected][a]) {
        return Translations[TranslationSelected][a];
    }
    else return 'Translation not found..';
}

