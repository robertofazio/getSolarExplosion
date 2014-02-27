getSolarExplosion
=================

Get the radiological activity of the Sun in real time every minutes
___

On March 4, 2010, the NOAA ( National Oceanic and Atmospheric Administration ) under the technical guidance of NASA launches the geostationary satellite GOES- 15, which currently continues to orbit along the Earth at a distance of 35.780 km .

Its mainly function is to monitor the weather and among other things it also monitors the activity of the Sun in particular the radiological activity of the Sun. 

Following the research of my friend Alejandro Tamayo http://www.thepopshop.org/ and his partner Iván López I decided to use the same openData to get the solar datas and try to use it in order to develop an interactive light installation.

The algorithm was developed as an artistic project, as an art-science collaboration between Alejandro and Iván López, and it was part of a larger project called "Internal Astronomies" which Alejandro developed during his MFA.

For more info about his idea to use the solar explosion take a look into the Alejandro web page :
http://www.thepopshop.org/2011/1/index_en.html
http://medialab-bogota.org/wiki/doku.php?id=explosiones

___
how it works:

With this shell script you will be able to receive every minutes the intensity of the Solar X-ray Flux (in Watts units per meter squared)  then send the last value to serial to Arduino. 

// get the datas
wget http://www.swpc.noaa.gov/ftpdir/lists/xray/Gp_xr_1m.txt

// send to serial port to Arduino and save to .txt file
cat lastSolarExplosion.txt > /dev/tty.usbmodem1421
cat lastSolarExplosion.txt > filedaleggere.txt

Processing reads the last values by text streaming 

// read every minutes 
___

http://www.swpc.noaa.gov/ftpdir/lists/xray/Gp_xr_1m.txt

keep in mind to check your serial port by terminal ls /dev/tty*
/dev/tty.usbmodem1421

___
how to use:
- open terminal 
- go where getData.sh is located e.g. cd /Users/robertofazio/Desktop/GetData.sh 
- It create a local file called lastSolarExplosion.txt and send the last values of the solar explosion to serial port

if you want to read through serial port try the Arduino sketch example.

n.b.
github space It's just a reminder for me. This is a work in progress for my 8 minutes installation.

more info about satellite GOES- 15 on NASA website http://www.nasa.gov/mission_pages/GOES-P/science/index.html



