
# set the options for a terminal device interface
stty -F /dev/tty.usbmodem1421 9600 -parity cs8 -cstopb

while :
do
    sleep 60 & pid=$!
    
# scarica il file
wget http://www.swpc.noaa.gov/ftpdir/lists/xray/Gp_xr_1m.txt

# tail: mostra il file dalla fine. -1 mostra solo l'ultima riga. Con il simbolo |
# aggiungo un comando che deve applicarsi al risultato del comando tail
# quindi con awk dici di tagliare l'ottavo elemento
tail -1 Gp_xr_1m.txt| awk '{ print $8 }'> lastSolarExplosion.txt

# concatenate and print files
cat lastSolarExplosion.txt > /dev/tty.usbmodem1421
# remove directory entries
rm Gp_xr_1m.txt

    wait $pid
done