# Note Performer Downloader & Installer
# - finlayacourt

# Check for root
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi

# Download & install noteperformer
echo 'Install Noteperformer [Y/n]'
read response
if [ response != 'n' ]
  then  
    curl http://www.noteperformer.com/DownloadNotePerformerTrial.php -L > /tmp/noteperformer.dmg
    hdiutil attach /tmp/noteperformer.dmg
    installer -package /Volumes/NotePerformer*/*.pkg -target /
    hdiutil detach /Volumes/NotePerformer*
    rm /tmp/noteperformer.dmg
fi

# Install libfaketime to Sibelius
echo 'Patch for unlimited trial [Y/n]'
read response
if [ response != 'n' ]
  then
    curl https://raw.githubusercontent.com/finlayacourt/Note-Performer-Installer/master/libfaketime.1.dylib > /Applications/Sibelius.app/Contents/Frameworks/libfaketime.1.dylib
    /usr/libexec/PlistBuddy -c 'Add :LSEnvironment:DYLD_INSERT_LIBRARIES string /Applications/Sibelius.app/Contents/Frameworks/libfaketime.1.dylib' -c 'Add :LSEnvironment:FAKETIME string @2018-01-01 00:00:00' -c 'Add :LSEnvironment:DYLD_FORCE_FLAT_NAMESPACE string 1' '/Applications/Sibelius.app/Contents/Info.plist'
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v -f /Applications/Sibelius.app
fi
exit