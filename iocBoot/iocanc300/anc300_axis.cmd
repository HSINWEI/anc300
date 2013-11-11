# VSCAN is voltage output scan rate. SCAN is for all other input parameters
dbLoadRecords("$(TOP)/db/ANC300_axis.db","DEV=$(DEV),PORT=$(PORT),A=$(AXIS),SCAN=Passive,VSCAN=.1 second")
dbLoadRecords("$(TOP)/db/ANC300_axis_mbb.db","DEV=$(DEV),PORT=$(PORT),A=$(AXIS),SCAN=Passive,VSCAN=.1 second")
