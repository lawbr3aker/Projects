let __lastId = 0

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
    SuccessInstallationDialogLongDesc = id();

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
        [Ready2RestartDialogRestartNowText, "Restart Now!"],
        [Ready2RestartDialogRestartLaterText, "Or maybe later?"],
        [SuccessInstallationDialogFinishButtonText, "Good luck"],
        [SelectLangDialogTitle, "Select language"],
        [SelectLangDialogDesc, "Choose right language to continue setup"],
        [WelcomeDialogTitle, "Welcome to installation setup of 'Optitex Sentinel'"],
        [WelcomeDialogDesc, "This setup will override some 'Optitex' applications and install some 'Sentinel' drivers.\nMake sure you select language correctly to have easy progress!"],
        [EnterPasswordDialogTitle, "Enter password"],
        [EnterPasswordDialogDesc, "To continue setup you must enter password!"],
        [Ready2InstallDialogTitle, "Setup is ready to override!"],
        [Ready2InstallDialogDesc, "Before install main drivers, setup must configure some required system setting to have perfect installation!"],
        [InstallingDialogTitle, "Installing"],
        [InstallingDialogDesc, "Setup is installing and configuring some setting!"],
        [Ready2RestartDialogTitle, "Ready 2 restart"],
        [Ready2RestartDialogDesc, "To install main drivers you may restart your windows!"],
        [Ready2RestartDialogLongDesc, "Setup finished successfully;)\n\
But a little step not passed: Restarting!\n\n\
After your windows restart, you must login to your account and give some minute to windows to load completely!\nAfter windows load completely, Everything is ok.\n\n\
Please visit our telegram channel: '@OPTITEX_PATTERN_DESIGN'\n\
Contact: +989126867971"],
        [InstallingDriverDialogTitle, "Installing drivers"],
        [InstallingDriverDialogDesc, "Setup is installing main drivers."],
        [SuccessInstallationDialogTitle, "Setup completed successfully"],
        [SuccessInstallationDialogDesc, "Setup has finished it work:)"]])],
    [Spanish, new Map([
        [CancelButtonText, "Cancelar"],
        [NextButtonText, "Próximo"],
        [BackButtonText, "atrás"],
        [CancelDialogText, "¿Estás seguro de que quieres cancelar la configuración?"],
        [CancelDialogNextButtonText, "sí"],
        [CancelDialogCancelButtonText, "No"],
        [LanguagesComboBoxLabelText, "Idioma:"],
        [Ready2InstallDialogText, "La configuración está lista para instalar Optitex Dongle Keys."],
        [PasswordEntryLabelText, "Contraseña:"],
        [MessageErrorOkButtonText, "OK!"],
        [MessageErrorDialogText, "La contraseña no es correcta!"],
        [Ready2InstallDialogInstallButtonText, "Instalar en pc"],
        [InstallingDialogAdvancedButtonText, "Avanzado..."],
        [InstallingDialogLessAdvancedButtonText, "Menos"],
        [Ready2RestartDialogFinishButtonText, "Terminar"],
        [Ready2RestartDialogRestartNowText, "reiniciar ahora"],
        [Ready2RestartDialogRestartLaterText, "¿O quizás más tarde?"],
        [SuccessInstallationDialogFinishButtonText, "Buena suerte"],
        [SelectLangDialogTitle, "Seleccione el idioma"],
        [SelectLangDialogDesc, "Elija el idioma correcto para continuar con la configuración"],
        [WelcomeDialogTitle, "Bienvenido a la configuración de instalación de 'Optitex Dongle Keys'"],
        [WelcomeDialogDesc, "Esta configuración instalará los controladores necesarios de Optitex.\nAsegúrese de seleccionar el idioma correctamente para tener un progreso fácil!"],
        [EnterPasswordDialogTitle, "Introducir la contraseña"],
        [EnterPasswordDialogDesc, "Para continuar con la configuración, debe ingresar la contraseña!"],
        [Ready2InstallDialogTitle, "La configuración está lista para instalar los requisitos!"],
        [Ready2InstallDialogDesc, "Antes de instalar los controladores principales, la instalación debe configurar algunos ajustes necesarios del sistema para tener una instalación perfecta!"],
        [InstallingDialogTitle, "Instalando"],
        [InstallingDialogDesc, "El programa de instalación está instalando y configurando algunos ajustes!"],
        [Ready2RestartDialogTitle, "Listo 2 reinicio"],
        [Ready2RestartDialogDesc, "Para instalar los controladores principales, puede reiniciar Windows!"],
        [Ready2RestartDialogLongDesc, "Después de reiniciar Windows, debe iniciar sesión en su cuenta y dar un minuto a Windows para que se cargue por completo.!\nDespués de que Windows se cargue por completo, la instalación reanudará el progreso..\n\n\
Nos vemos después de reiniciar:)"],
        [InstallingDriverDialogTitle, "Instalación de controladores"],
        [InstallingDriverDialogDesc, "El programa de instalación está instalando los controladores principales."],
        [SuccessInstallationDialogTitle, "La configuración se completó con éxito"],
        [SuccessInstallationDialogDesc, "La instalación ha terminado de funcionar:)"],
        [SuccessInstallationDialogLongDesc, "'Optitex Dongle Keys' controladores instalados correctamente.\n\n\
Visite nuestro canal de telegramas:'@OPTITEX_PATTERN_DESIGN'\n\
Contacto: +989126867971"]])],
    [Turkey, new Map([
        [CancelButtonText, "iptal"],
        [NextButtonText, "Sonraki"],
        [BackButtonText, "Geri"],
        [CancelDialogText, "Kurulumu iptal etmek istediğinizden emin misiniz?!"],
        [CancelDialogNextButtonText, "Evet"],
        [CancelDialogCancelButtonText, "Hayır"],
        [LanguagesComboBoxLabelText, "Dil:"],
        [Ready2InstallDialogText, "Kurulum, Optitex Dongle Anahtarlarını kurmaya hazır."],
        [PasswordEntryLabelText, "Parola:"],
        [MessageErrorOkButtonText, "Tamam mı!"],
        [MessageErrorDialogText, "Şifre doğru değil!"],
        [Ready2InstallDialogInstallButtonText, "Yüklemek"],
        [InstallingDialogAdvancedButtonText, "ileri..."],
        [InstallingDialogLessAdvancedButtonText, "Az"],
        [Ready2RestartDialogFinishButtonText, "Bitiş"],
        [Ready2RestartDialogRestartNowText, "Şimdi yeniden başlat"],
        [Ready2RestartDialogRestartLaterText, "Belki sonra"],
        [SuccessInstallationDialogFinishButtonText, "İyi şanslar"],
        [SelectLangDialogTitle, "Dil Seçin"],
        [SelectLangDialogDesc, "Kuruluma devam etmek için doğru dili seçin"],
        [WelcomeDialogTitle, "'Optitex Dongle Keys' kurulum kurulumuna hoş geldiniz"],
        [WelcomeDialogDesc, "Bu kurulum, Optitex gerekli sürücüleri yükleyecektir.\nİlerlemeyi kolaylaştırmak için dili doğru seçtiğinizden emin olun!"],
        [EnterPasswordDialogTitle, "Parolanı Gir"],
        [EnterPasswordDialogDesc, "Kuruluma devam etmek için şifre girmelisiniz!"],
        [Ready2InstallDialogTitle, "Kurulum, gereksinimleri yüklemeye hazır!"],
        [Ready2InstallDialogDesc, "Ana sürücüleri yüklemeden önce, kurulumun mükemmel kuruluma sahip olması için bazı gerekli sistem ayarlarını yapılandırması gerekir.!"],
        [InstallingDialogTitle, "Kurulum"],
        [InstallingDialogDesc, "Kurulum bazı ayarları kuruyor ve yapılandırıyor!"],
        [Ready2RestartDialogTitle, "Yeniden başlatmaya hazır"],
        [Ready2RestartDialogDesc, "Ana sürücüleri yüklemek için pencerelerinizi yeniden başlatabilirsiniz!"],
        [Ready2RestartDialogLongDesc, "Windows yeniden başlatıldıktan sonra, hesabınıza giriş yapmalı ve pencerelerin tamamen yüklenmesi için birkaç dakika vermelisiniz!\nWindows tamamen yüklendikten sonra, Kurulum ilerlemeye devam edecek.\n\n\
Yeniden başlattıktan sonra görüşürüz:)"],
        [InstallingDriverDialogTitle, "Sürücüleri yükleme"],
        [InstallingDriverDialogDesc, "Kurulum, ana sürücüleri yüklüyor."],
        [SuccessInstallationDialogTitle, "Kurulum başarıyla tamamlandı"],
        [SuccessInstallationDialogDesc, "Kurulum işini bitirdi:)"],
        [SuccessInstallationDialogLongDesc, "'Optitex Dongle Keys' başarıyla yüklenen sürücüler.\n\n\
Lütfen telgram kanalımızı ziyaret edin:\
'@OPTITEX_PATTERN_DESIGN'\n\
İletişim: +989126867971"]])
    ]])

const asList = [
    English,
    Spanish,
    Turkey
]

function fromString(language, object) {
    if (!asList.includes(language))
        throw new TypeError('Language not defined!')

    const temp = languages.get(language).get(object)
    return temp ? temp : ""
}
