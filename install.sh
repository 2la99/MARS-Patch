# MARS

if [ -z $UF ]; then
  UF=$TMPDIR/common/unityfiles
  unzip -oq "$ZIPFILE" 'common/unityfiles/util_functions.sh' -d $TMPDIR >&2
  [ -f "$UF/util_functions.sh" ] || { ui_print "! Unable to extract zip file !"; exit 1; }
  . $UF/util_functions.sh
fi

comp_check

MINAPI=28
DYNLIB=true
SYSOVER=false
DEBUG=false

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
/system/media/bootanimation.zip
/system/media/bootanimation_decrypting.zip
/system/media/bootanimation_plus.zip
/system/media/bootanimation_prime.zip
/system/media/shutdownanimation.zip
/system/product/media/bootanimation.zip
/system/product/media/bootanimation_decrypting.zip
/system/product/media/bootanimation_plus.zip
/system/product/media/bootanimation_prime.zip
/system/product/media/shutdownanimation.zip
/system/app/AmazeFileManager
/system/app/CMFileManager
/system/app/Calendar
/system/app/DeskClock
/system/app/Eleven
/system/app/Email
/system/app/ExactCalculator
/system/app/Facebook_AppManager
/system/app/Facebook_Instagram_stub
/system/app/Facebook_stub
/system/app/Galaxy4
/system/app/Gallery2
/system/app/Gello
/system/app/HoloSpiralWallpaper
/system/app/LGBackupLauncher
/system/app/LGFOTA
/system/app/LGMusicShare
/system/app/LGStk
/system/app/LatinIME
/system/app/LiveWallpapers
/system/app/MiuiCompass
/system/app/MiuiVideoPlayer
/system/app/NoiseField
/system/app/PABrowser
/system/app/PhaseBeam
/system/app/Phonograph
/system/app/PhotoPhase
/system/app/SnapdragonMusic
/system/app/SoundRecorder
/system/app/Stk
/system/app/ViaBrowser
/system/app/Videos
/system/app/YuBrowser
/system/app/messaging
/system/app/webview
/system/priv-app/Aegis
/system/priv-app/AudioFX
/system/priv-app/Browser
/system/priv-app/Contacts
/system/priv-app/Dialer
/system/priv-app/Eleven
/system/priv-app/Evernote
/system/priv-app/LGAirDriveSetting
/system/priv-app/LGAlarmClock
/system/priv-app/LGBackup
/system/priv-app/LGCalculator
/system/priv-app/LGCalendar
/system/priv-app/LGCb
/system/priv-app/LGContacts
/system/priv-app/LGDMSClient
/system/priv-app/LGEIME
/system/priv-app/LGEIME_DICT_XT9_bin
/system/priv-app/LGEIME_HWR_SOLUTION_MYSCRIPT
/system/priv-app/LGEIME_TEXT_SOLUTION_XT9
/system/priv-app/LGEIME_THEME_BLACK3
/system/priv-app/LGEasyHome
/system/priv-app/LGEmail
/system/priv-app/LGFileManager
/system/priv-app/LGFmRadio
/system/priv-app/LGFriendsManager
/system/priv-app/LGGallery
/system/priv-app/LGHome
/system/priv-app/LGMessage
/system/priv-app/LGMusic
/system/priv-app/LGMusicWidget
/system/priv-app/LGMyWellness
/system/priv-app/LGPCSuiteService
/system/priv-app/LGQMemoplus
/system/priv-app/LGQRemote
/system/priv-app/LGRemoteCall
/system/priv-app/LGSmartWorld
/system/priv-app/LGVidClip
/system/priv-app/LGVideo
/system/priv-app/LGVideoStudio
/system/priv-app/LGVoiceRecorder
/system/priv-app/LGWeather
/system/priv-app/LGWeatherService
/system/priv-app/LGWeatherTheme
/system/priv-app/LinageSetupWizard
/system/priv-app/MoKeeSetupWizard
/system/priv-app/MusicFX
/system/priv-app/Recorder
/system/priv-app/Screencast
/system/priv-app/SetupWizard
/system/priv-app/Snap
/system/priv-app/SnapdragonGallery
/system/priv-app/SoundRecorder
/system/priv-app/Trebuchet
/system/priv-app/Venus
/system/priv-app/opt
/system/priv-app/opt/OSAAmazonShopping
/system/priv-app/opt/OSAOrangeJeux
/system/priv-app/opt/OSAOrangeUpdates
/system/product/app/Facebook_AppManager
/system/product/app/LGAmazonAssistant
/system/product/app/LGAmazonAttribution
/system/product/app/LGCb
/system/product/priv-app/LGAlarmClock
/system/product/priv-app/Facebook_Installer
/system/product/priv-app/LGCalendar
/system/product/priv-app/LGEmail
/system/product/priv-app/LGFmRadio
/system/product/priv-app/LGFileManager
/system/product/priv-app/LGGallery
/system/product/priv-app/LGHiFiRecorder
/system/product/priv-app/LGMessage
/system/product/priv-app/LGMusic
/system/product/priv-app/LGMyWellness
/system/product/priv-app/LGUpdateCenter
/system/product/priv-app/LGQMemoplus
/system/product/priv-app/LGRemoteCall
/system/product/priv-app/LGVideo
/system/vendor/overlay/com.lge.launcher3
/vendor/overlay/com.lge.launcher3
"

print_modname() {
  center_and_print
  unity_main
}

set_permissions() {
  :
}

unity_custom() {
  :
}
