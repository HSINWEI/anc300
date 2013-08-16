#!../../bin/linux-x86/anc300
# ANC300 support

< envPaths
cd ${TOP}

dbLoadDatabase("dbd/anc300.dbd")

anc300_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/anc300App/Db")
# Device name (usually $(P)$(R))
epicsEnvSet("DEV", "E1:ANC300")

# Database records:
dbLoadRecords("db/ANC300.db","DEV=$(DEV),PORT=E1,PASSWORD=123456,PREC=9")
dbLoadRecords("db/asyn.db","DEV=$(DEV),PORT=E1,ADDR=0")

cd ${TOP}/iocBoot/${IOC}/
# Load per-axis database files:
epicsEnvSet "AXIS", 1
< anc300_axis.cmd
epicsEnvSet "AXIS", 2
< anc300_axis.cmd
epicsEnvSet "AXIS", 3
< anc300_axis.cmd
epicsEnvSet "AXIS", 4
< anc300_axis.cmd
epicsEnvSet "AXIS", 5
< anc300_axis.cmd
epicsEnvSet "AXIS", 6
< anc300_axis.cmd

# Autosave
< autosave.cmd
cd ${TOP}

drvAsynIPPortConfigure("E1", "10.0.3.1:7230")

iocInit()
#var streamDebug 1
dbl > ${TOP}/opi/pvs.pvlist

create_monitor_set("ANC300.req", 15)
