#!/bin/sh
set -ev

#download and install qt
curl -sL -o /tmp/qt-opensource-mac-x64-android-ios-5.7.0.dmg https://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-mac-x64-android-ios-5.7.0.dmg
hdiutil attach /tmp/qt-opensource-mac-x64-android-ios-5.7.0.dmg
/Volumes/qt-opensource-mac-x64-android-ios-5.7.0/qt-opensource-mac-x64-android-ios-5.7.0.app/Contents/MacOS/qt-opensource-mac-x64-android-ios-5.7.0 --script $GOPATH/src/github.com/therecipe/qt/internal/ci/iscript.qs
diskutil unmountDisk disk2

#download and install android sdk
curl -sL -o /tmp/android-sdk_r24.4.1-macosx.zip https://dl.google.com/android/android-sdk_r24.4.1-macosx.zip
unzip /tmp/android-sdk_r24.4.1-macosx.zip -d /tmp
export ANDROID_SDK_DIR=/tmp/android-sdk-macosx

#install deps for android sdk

#download and install android ndk
curl -sL -o /tmp/android-ndk-r12b-darwin-x86_64.zip https://dl.google.com/android/repository/android-ndk-r12b-darwin-x86_64.zip
unzip /tmp/android-ndk-r12b-darwin-x86_64.zip -d /tmp
export ANDROID_NDK_DIR=/tmp/android-ndk-r12b

#download and install virtualbox
curl -sL -o /tmp/VirtualBox-5.1.6-110634-OSX.dmg http://download.virtualbox.org/virtualbox/5.1.6/VirtualBox-5.1.6-110634-OSX.dmg
hdiutil attach /tmp/VirtualBox-5.1.6-110634-OSX.dmg
sudo installer -pkg VirtualBox.pkg -target /
diskutil unmountDisk disk2

#download and install sailfish sdk
curl -sL -o /tmp/SailfishOSSDK-Beta-1608-Qt5-mac-offline.dmg https://releases.sailfishos.org/sdk/installers/1608/SailfishOSSDK-Beta-1608-Qt5-mac-offline.dmg
hdiutil attach /tmp/SailfishOSSDK-Beta-1608-Qt5-mac-offline.dmg
/Volumes/SailfishOSSDK-mac-offline-160801/SailfishOSSDK-mac-offline-160801.app/Contents/MacOS/SailfishOSSDK-mac-offline-160801 --script $GOPATH/src/github.com/therecipe/qt/internal/ci/iscriptcd.qs
diskutil unmountDisk disk2
