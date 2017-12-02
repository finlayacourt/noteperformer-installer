# Note Performer Downloader & Installer
# - Finlay A'Court

curl http://www.noteperformer.com/DownloadNotePerformerTrial.php -L > /tmp/noteperformer.dmg
hdiutil attach /tmp/noteperformer.dmg
installer -package /Volumes/NotePerformer*/*.pkg -target /
hdiutil detach /Volumes/NotePerformer*
# rm /tmp/noteperformer.dmg