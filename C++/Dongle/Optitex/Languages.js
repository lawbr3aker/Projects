.pragma library

let __lastId = 0;

function id() {
    return __lastId++
}

const
    CancelButtonText = id(),
    NextButtonText = id(),
    BackButtonText = id(),
    CancelDialogText = id(),
    CancelDialogNextButtonText = id(),
    CancelDialogCancelButtonText = id(),
    LanguagesComboBoxLabelText = id(),
    PasswordEntryLabelText = id(),
    Ready2InstallDialogText = id(),
    MessageErrorOkButtonText = id(),
    MessageErrorDialogText = id(),
    Ready2InstallDialogInstallButtonText = id(),
    InstallingDialogAdvancedButtonText = id(),
    InstallingDialogLessAdvancedButtonText = id(),
    Ready2RestartDialogFinishButtonText = id(),
    Ready2RestartDialogRestartNowText = id(),
    Ready2RestartDialogRestartLaterText = id(),
    SuccessInstallationDialogFinishButtonText = id(),
    SelectLangDialogTitle = id(),
    SelectLangDialogDesc = id(),
    WelcomeDialogTitle = id(),
    WelcomeDialogDesc = id(),
    EnterPasswordDialogTitle = id(),
    EnterPasswordDialogDesc = id(),
    Ready2InstallDialogTitle = id(),
    Ready2InstallDialogDesc = id(),
    InstallingDialogTitle = id(),
    InstallingDialogDesc = id(),
    Ready2RestartDialogTitle = id(),
    Ready2RestartDialogDesc = id(),
    Ready2RestartDialogLongDesc = id(),
    InstallingDriverDialogTitle = id(),
    InstallingDriverDialogDesc = id(),
    SuccessInstallationDialogTitle = id(),
    SuccessInstallationDialogDesc = id(),
    SuccessInstallationDialogLongDesc = id()


const
    English = "english",
    Spanish = "spanish",
    Turkey = "turkey"
const languages = new Map([
    [English, new Map([
            [CancelButtonText, "Cancel"],
            [NextButtonText, "Next"],
            [BackButtonText, "Back"],
            [CancelDialogText, "Are you sure you want to cancel setup?!"],
            [CancelDialogNextButtonText, "Yes"],
            [CancelDialogCancelButtonText, "No"],
            [LanguagesComboBoxLabelText, "Language:"],
            [Ready2InstallDialogText, "The setup is ready to install Optitex Dongle Keys."],
            [PasswordEntryLabelText, "Password:"],
            [MessageErrorOkButtonText, "OK!"],
            [MessageErrorDialogText, "Password isn't correct!"],
            [Ready2InstallDialogInstallButtonText, "Install"],
            [InstallingDialogAdvancedButtonText, "Advanced..."],
            [InstallingDialogLessAdvancedButtonText, "Less"],
            [Ready2RestartDialogFinishButtonText, "Finish"],
            [Ready2RestartDialogRestartNowText, "Restart now"],
            [Ready2RestartDialogRestartLaterText, "Maybe later"],
            [SuccessInstallationDialogFinishButtonText, "Good luck"],
            [SelectLangDialogTitle, "Select language"],
            [SelectLangDialogDesc, "Choose right language to continue setup"],
            [WelcomeDialogTitle, "Welcome to installation setup of 'Optitex Dongle Keys'"],
            [WelcomeDialogDesc, "This setup will install Optitex required drivers.\nMake sure you select language correctly to have easy progress!"],
            [EnterPasswordDialogTitle, "Enter password"],
            [EnterPasswordDialogDesc, "To continue setup you must enter password!"],
            [Ready2InstallDialogTitle, "Setup is ready to install requirements!"],
            [Ready2InstallDialogDesc, "Before install main drivers, setup must configure some required system setting to have perfect installation!"],
            [InstallingDialogTitle, "Installing"],
            [InstallingDialogDesc, "Setup is installing and configuring some setting!"],
            [Ready2RestartDialogTitle, "Ready 2 restart"],
            [Ready2RestartDialogDesc, "To install main drivers you may restart your windows!"],
            [Ready2RestartDialogLongDesc, "After your windows restart, you must login to your account and give some minute to windows to load completely!\nAfter windows load completely, Setup will resume progress.\n\n\
See you after restart:)"],
            [InstallingDriverDialogTitle, "Installing drivers"],
            [InstallingDriverDialogDesc, "Setup is installing main drivers."],
            [SuccessInstallationDialogTitle, "Setup completed successfully"],
            [SuccessInstallationDialogDesc, "Setup has finished it work:)"],
            [SuccessInstallationDialogLongDesc, "'Optitex Dongle Keys' successfully installed drivers.\n\n\
Please visit our telegram channel:\
'@OPTITEX_PATTERN_DESIGN'\n\
Contact: +989126867971"]
        ]
    )],
    [Spanish, new Map([
        [CancelButtonText, "Cancelar"],
        [NextButtonText, "Pr??ximo"],
        [BackButtonText, "atr??s"],
        [CancelDialogText, "??Est??s seguro de que deseas cancelar la configuraci??n?!"],
        [CancelDialogNextButtonText, "s??"],
        [CancelDialogCancelButtonText, "No"],
        [LanguagesComboBoxLabelText, "Idioma:"],
        [Ready2InstallDialogText, "La configuraci??n est?? lista para instalar Optitex Dongle Keys."],
        [PasswordEntryLabelText, "Contrase??a:"],
        [MessageErrorOkButtonText, "OK!"],
        [MessageErrorDialogText, "La contrase??a no es correcta!"],
        [Ready2InstallDialogInstallButtonText, "Instalar en pc"],
        [InstallingDialogAdvancedButtonText, "Avanzado..."],
        [InstallingDialogLessAdvancedButtonText, "Menos"],
        [Ready2RestartDialogFinishButtonText, "Terminar"],
        [Ready2RestartDialogRestartNowText, "Restart now"],
        [Ready2RestartDialogRestartLaterText, "Quizas mas tarde"],
        [SuccessInstallationDialogFinishButtonText, "Buena suerte"],
        [SelectLangDialogTitle, "Seleccione el idioma"],
        [SelectLangDialogDesc, "Elija el idioma correcto para continuar con la configuraci??n"],
        [WelcomeDialogTitle, "Bienvenido a la configuraci??n de instalaci??n de 'Optitex Dongle Keys'"],
        [WelcomeDialogDesc, "Esta configuraci??n instalar?? los controladores necesarios de Optitex.\nAseg??rese de seleccionar el idioma correctamente para tener un progreso f??cil!"],
        [EnterPasswordDialogTitle, "Introducir la contrase??a"],
        [EnterPasswordDialogDesc, "Para continuar con la configuraci??n, debe ingresar la contrase??a!"],
        [Ready2InstallDialogTitle, "La configuraci??n est?? lista para instalar los requisitos!"],
        [Ready2InstallDialogDesc, "Antes de instalar los controladores principales, la instalaci??n debe configurar algunos ajustes necesarios del sistema para tener una instalaci??n perfecta!"],
        [InstallingDialogTitle, "Instalando"],
        [InstallingDialogDesc, "El programa de instalaci??n est?? instalando y configurando algunos ajustes!"],
        [Ready2RestartDialogTitle, "Listo 2 reinicio"],
        [Ready2RestartDialogDesc, "Para instalar los controladores principales, puede reiniciar Windows!"],
        [Ready2RestartDialogLongDesc, "Despu??s de reiniciar Windows, debe iniciar sesi??n en su cuenta y dar un minuto a Windows para que se cargue por completo.!\nDespu??s de que Windows se cargue por completo, la instalaci??n reanudar?? el progreso..\n\n\
Nos vemos despu??s de reiniciar:)"],
        [InstallingDriverDialogTitle, "Instalaci??n de controladores"],
        [InstallingDriverDialogDesc, "El programa de instalaci??n est?? instalando los controladores principales."],
        [SuccessInstallationDialogTitle, "La configuraci??n se complet?? con ??xito"],
        [SuccessInstallationDialogDesc, "La instalaci??n ha terminado de funcionar:)"],
        [SuccessInstallationDialogLongDesc, "'Optitex Dongle Keys' controladores instalados correctamente.\n\n\
Visite nuestro canal de telegramas:'@OPTITEX_PATTERN_DESIGN'\n\
Contacto: +989126867971"]
    ])],
    [Turkey, new Map([
            [CancelButtonText, "iptal"],
            [NextButtonText, "Sonraki"],
            [BackButtonText, "Geri"],
            [CancelDialogText, "Kurulumu iptal etmek istedi??inizden emin misiniz?!"],
            [CancelDialogNextButtonText, "Evet"],
            [CancelDialogCancelButtonText, "Hay??r"],
            [LanguagesComboBoxLabelText, "Dil:"],
            [Ready2InstallDialogText, "Kurulum, Optitex Dongle Anahtarlar??n?? kurmaya haz??r."],
            [PasswordEntryLabelText, "Parola:"],
            [MessageErrorOkButtonText, "OK!"],
            [MessageErrorDialogText, "??ifre do??ru de??il!"],
            [Ready2InstallDialogInstallButtonText, "Y??klemek"],
            [InstallingDialogAdvancedButtonText, "ileri..."],
            [InstallingDialogLessAdvancedButtonText, "Az"],
            [Ready2RestartDialogFinishButtonText, "Biti??"],
            [Ready2RestartDialogRestartNowText, "Restart now"],
            [Ready2RestartDialogRestartLaterText, "Belki sonra"],
            [SuccessInstallationDialogFinishButtonText, "??yi ??anslar"],
            [SelectLangDialogTitle, "Dil Se??in"],
            [SelectLangDialogDesc, "Kuruluma devam etmek i??in do??ru dili se??in"],
            [WelcomeDialogTitle, "'Optitex Dongle Keys' kurulum kurulumuna ho?? geldiniz"],
            [WelcomeDialogDesc, "Bu kurulum, Optitex gerekli s??r??c??leri y??kleyecektir.\n??lerlemeyi kolayla??t??rmak i??in dili do??ru se??ti??inizden emin olun!"],
            [EnterPasswordDialogTitle, "Parolan?? Gir"],
            [EnterPasswordDialogDesc, "Kuruluma devam etmek i??in ??ifre girmelisiniz!"],
            [Ready2InstallDialogTitle, "Kurulum, gereksinimleri y??klemeye haz??r!"],
            [Ready2InstallDialogDesc, "Ana s??r??c??leri y??klemeden ??nce, kurulumun m??kemmel kuruluma sahip olmas?? i??in baz?? gerekli sistem ayarlar??n?? yap??land??rmas?? gerekir.!"],
            [InstallingDialogTitle, "Kurulum"],
            [InstallingDialogDesc, "Kurulum baz?? ayarlar?? kuruyor ve yap??land??r??yor!"],
            [Ready2RestartDialogTitle, "Yeniden ba??latmaya haz??r"],
            [Ready2RestartDialogDesc, "Ana s??r??c??leri y??klemek i??in pencerelerinizi yeniden ba??latabilirsiniz!"],
            [Ready2RestartDialogLongDesc, "Windows yeniden ba??lat??ld??ktan sonra, hesab??n??za giri?? yapmal?? ve pencerelerin tamamen y??klenmesi i??in birka?? dakika vermelisiniz!\nWindows tamamen y??klendikten sonra, Kurulum ilerlemeye devam edecek.\n\n\
Yeniden ba??latt??ktan sonra g??r??????r??z:)"],
            [InstallingDriverDialogTitle, "S??r??c??leri y??kleme"],
            [InstallingDriverDialogDesc, "Kurulum, ana s??r??c??leri y??kl??yor."],
            [SuccessInstallationDialogTitle, "Kurulum ba??ar??yla tamamland??"],
            [SuccessInstallationDialogDesc, "Kurulum i??ini bitirdi:)"],
            [SuccessInstallationDialogLongDesc, "'Optitex Dongle Keys' ba??ar??yla y??klenen s??r??c??ler.\n\n\
L??tfen telgram kanal??m??z?? ziyaret edin:\
'@OPTITEX_PATTERN_DESIGN'\n\
??leti??im: +989126867971"]
        ]
    )]
])
const asList = [
    English,
    Spanish,
    Turkey
]

function fromString(language, object) {
    if (!asList.includes(language))
        throw new TypeError('Language not defined!')
    const temp = languages.get(language).get(object);
    return temp ? temp : ""
}
