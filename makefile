BIN_LIB=TOBJLIB
LIBLIST=$(BIN_LIB) EUGENE DERICK
SHELL=/QOpenSys/usr/bin/qsh

all: testmember.sqlrpgle

#depts.sqlrpgle: depts.dspf			dependency
#employees.sqlrpgle: emps.dspf		dependency

%.sqlrpgle:
	system -s "CHGATR OBJ('./qrpglesrc/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./qrpglesrc/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF)"

#%.dspf:
#	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QDDSSRC) RCDLEN(112)"
#	system "CPYFRMSTMF FROMSTMF('./qddssrc/$*.dspf') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QDDSSRC.file/$*.mbr')"
#	system -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/QDDSSRC) SRCMBR($*)"