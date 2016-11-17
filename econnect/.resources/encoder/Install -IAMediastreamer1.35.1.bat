ECHO OFF
set ADBPATH=C:\Android\sdk\platform-tools

ECHO Ensure that UUT is booted up and USB is connected
ECHO Ensure ADBPATH below points to correct location of ADB.EXE

ECHO ADBPATH=%ADBPATH%

ECHO If not, press ctrl-c to terminate batch file and edit ADBPATH accordingly.
pause


%ADBPATH%\adb devices
%ADBPATH%\adb root
pause

ECHO Copying crossdomain.xml to server's root
%ADBPATH%\adb push crossdomain.xml /mnt/iamediastreamer

ECHO Uninstalling 1.34 (not concerned about FAILURE)
%ADBPATH%\adb uninstall com.iadvantage.iamediastreamer 

ECHO Uninstalling 1.35 (not concerned about FAILURE)
%ADBPATH%\adb uninstall com.in_advantage.iamediastreamer

ECHO installing IAMediaStreamer1.35.1apk
%ADBPATH%\adb install IAMediaStreamer1.35.1.apk

%ADBPATH%\adb shell am start -n com.in_advantage.iamediastreamer/com.in_advantage.iamediastreamer.MainActivity

pause