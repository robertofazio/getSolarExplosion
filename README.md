getSolarExplosion
=================

get the radiological activity of the Sun in real time every minutes

On March 4, 2010, the NOAA ( National Oceanic and Atmospheric Administration ) under the technical guidance of NASA launches the geosta- tionary satellite GOES- 15, which currently continues to orbit along the Earth at a distance of 35.780 km .
Its function is to monitor the radiological activity of the Sun and its impact on our planet constantly sending x-ray images of the Sun

With this shell script you will be able to receive every minutes the Solar X-ray Flux ( you will get in Watts units per meter squared )

___

http://www.swpc.noaa.gov/ftpdir/lists/xray/Gp_xr_1m.txt

it create a local file lastSolarExplosion.txt and send the last values of the solar explosion to serial port

keep in mind to check your serial port by terminal ls /dev/tty*
/dev/tty.usbmodem1421

n.b.
github space It's just a reminder for me. This is a work in progress for my 8 minutes installation.

more info about satellite GOES- 15 on NASA website http://www.nasa.gov/mission_pages/GOES-P/science/index.html



