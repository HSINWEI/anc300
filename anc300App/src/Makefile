TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = anc300
# anc300.dbd will be created and installed
DBD += anc300.dbd

# anc300.dbd will be made up from these files:
anc300_DBD += base.dbd

# Include dbd files from all support applications:
anc300_DBD += asyn.dbd
anc300_DBD += stream.dbd
anc300_DBD += drvAsynIPPort.dbd
anc300_DBD += drvAsynSerialPort.dbd
anc300_DBD += calcSupport.dbd
anc300_DBD += asSupport.dbd
anc300_DBD += calcoutRecord.dbd

# Add all the support libraries needed by this IOC
anc300_LIBS += calc sscan stream asyn autosave

# anc300_registerRecordDeviceDriver.cpp derives from anc300.dbd
anc300_SRCS += anc300_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
anc300_SRCS_DEFAULT += anc300Main.cpp
anc300_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#anc300_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
anc300_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

