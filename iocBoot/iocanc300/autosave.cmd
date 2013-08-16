# autosave/restore mechanisms
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")
set_pass1_restoreFile("ANC300.sav")

makeAutosaveFileFromDbInfo("${TOP}/as/req/ANC300.req", autosaveFields)
