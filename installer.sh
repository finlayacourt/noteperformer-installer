# Note Performer Downloader & Installer
# - finlayacourt

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi
curl http://www.noteperformer.com/DownloadNotePerformerTrial.php -L > /tmp/noteperformer.dmg
hdiutil attach /tmp/noteperformer.dmg
installer -package /Volumes/NotePerformer*/*.pkg -target /
hdiutil detach /Volumes/NotePerformer*
rm /tmp/noteperformer.dmg
exit
