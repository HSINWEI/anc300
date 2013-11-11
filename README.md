ANC300 EPICS Driver
-------------------

StreamDevice-based EPICS support for the attocube ANC300 piezo controller.

Requirements
============

Though it may work on other versions, the driver was tested on these:

1. EPICS base 3.14.12.3 http://www.aps.anl.gov/epics/
2. asyn 4-21 http://www.aps.anl.gov/epics/modules/soft/asyn/
3. StreamDevice 2.6 http://epics.web.psi.ch/software/streamdevice/

A newer StreamDevice may be required than the NSLS-II Debian package has (as of early 2013).
If included in $(TOP)/StreamDevice, it will be built automatically.
The newer StreamDevice also requires a newer asyn (>= 4-18).

Optional
========

1. EDM http://ics-web.sns.ornl.gov/edm/log/getLatest.php
   Screens are provided in $TOP/opi for EDM.
2. Autosave http://www.aps.anl.gov/bcda/synApps/autosave/autosave.html

Installation
============

1. Install EPICS
    1. If using a Debian-based system (e.g., Ubuntu), use the packages here http://epics.nsls2.bnl.gov/debian/
    2. If no packages are available for your distribution, build from source
2. Edit configure/RELEASE
    1. Point the directories listed in there to the appropriate places
    2. If using the Debian packages, everything can be pointed to /usr/lib/epics
3. Edit iocBoot/iocanc300/st.cmd
    1. Change the shebang on the top of the script if your architecture is different than linux-x86:
        #!../../bin/linux-x86/anc300
        (check if the environment variable EPICS_HOST_ARCH is set, or perhaps `uname -a`, or ask someone if
         you don't know)
    2. The following line sets the prefix to all of your ANC300 PVs:
        epicsEnvSet("DEV", "E1:ANC300")
       Set the second quoted string appropriately.
    3. The following line sets the IP address of the serial device server communicating with the ANC300:
       drvAsynIPPortConfigure("$(PORT)", "10.0.2.5:7230")
       The IP address should be changed, but the port should remain the same.
    4. The ANC300 has a configurable number of axes (up to 6), add these lines for each axis, replacing the 1 with the axis number (1-6):
       epicsEnvSet "AXIS", 1
       < anc300_axis.cmd
4. Go to the top directory and `make`
5. If all goes well:

    `cd iocBoot/iocANC300`  
    `chmod +x st.cmd`  
    `./st.cmd`  
6. Run EDM:
    `export EDMDATAFILES=$TOP/opi:$EDMDATAFILES`
    `edm -x -m "DEV=E1:ANC300" anc300_axes` (general configuration)
    `edm -x -m "DEV=E1:ANC300,A=1" anc300_axis` (axis 1)
