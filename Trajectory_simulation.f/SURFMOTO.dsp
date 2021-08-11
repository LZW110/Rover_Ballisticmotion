# Microsoft Developer Studio Project File - Name="SURFMOTO" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=SURFMOTO - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "SURFMOTO.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "SURFMOTO.mak" CFG="SURFMOTO - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "SURFMOTO - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "SURFMOTO - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
F90=df.exe
RSC=rc.exe

!IF  "$(CFG)" == "SURFMOTO - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE F90 /compile_only /iface:nomixed_str_len_arg /iface:cref /nologo /warn:nofileopt
# ADD F90 /compile_only /iface:nomixed_str_len_arg /iface:cref /nologo /warn:nofileopt
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib fmpich2.lib fmpich2s.lib fmpich2g.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ws2_32.lib fmpich2.lib fmpich2s.lib fmpich2g.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "SURFMOTO - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE F90 /check:bounds /compile_only /dbglibs /debug:full /iface:nomixed_str_len_arg /iface:cref /nologo /traceback /warn:argument_checking /warn:nofileopt
# ADD F90 /browser /check:bounds /compile_only /dbglibs /debug:full /iface:nomixed_str_len_arg /iface:cref /nologo /traceback /warn:argument_checking /warn:nofileopt
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR /YX /FD /GZ /c
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib fmpich2.lib fmpich2s.lib fmpich2g.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib fmpich2.lib fmpich2s.lib fmpich2g.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /stack:0x989680 /subsystem:console /incremental:no /debug /machine:I386 /pdbtype:sept /FORCE:MULTIPLE
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "SURFMOTO - Win32 Release"
# Name "SURFMOTO - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat;f90;for;f;fpp"
# Begin Source File

SOURCE=.\BSDET.FOR
# End Source File
# Begin Source File

SOURCE=.\BZSURF.F90
DEP_F90_BZSUR=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\daux.f
# End Source File
# Begin Source File

SOURCE=.\ddaskr.f
# End Source File
# Begin Source File

SOURCE=.\defcont.c
# End Source File
# Begin Source File

SOURCE=.\dlinpk.f
# End Source File
# Begin Source File

SOURCE=.\EQUTNS.F90
DEP_F90_EQUTN=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\EVENTS.F90
DEP_F90_EVENT=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\GLOBAL.f90
# End Source File
# Begin Source File

SOURCE=.\LDVAR.F90
DEP_F90_LDVAR=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\ODESLVR.F90
DEP_F90_ODESL=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\pcm_addcont.c
# End Source File
# Begin Source File

SOURCE=.\pcm_addcosu.c
# End Source File
# Begin Source File

SOURCE=.\pcm_calcntel.c
# End Source File
# Begin Source File

SOURCE=.\pcm_calcont.c
# End Source File
# Begin Source File

SOURCE=.\pcm_calcsgeo.c
# End Source File
# Begin Source File

SOURCE=.\pcm_calctfrc.c
# End Source File
# Begin Source File

SOURCE=.\pcm_centsort.c
# End Source File
# Begin Source File

SOURCE=.\pcm_coldet.c
# End Source File
# Begin Source File

SOURCE=.\pcm_cosupre.c
# End Source File
# Begin Source File

SOURCE=.\pcm_cractelm.c
# End Source File
# Begin Source File

SOURCE=.\pcm_crcemasl.c
# End Source File
# Begin Source File

SOURCE=.\pcm_creabvtr.c
# End Source File
# Begin Source File

SOURCE=.\pcm_creadcel.c
# End Source File
# Begin Source File

SOURCE=.\pcm_creaispo.c
# End Source File
# Begin Source File

SOURCE=.\pcm_defcont.c
# End Source File
# Begin Source File

SOURCE=.\pcm_frcntmem.c
# End Source File
# Begin Source File

SOURCE=.\pcm_freemem.c
# End Source File
# Begin Source File

SOURCE=.\pcm_mathlib.c
# End Source File
# Begin Source File

SOURCE=.\pcm_print.c
# End Source File
# Begin Source File

SOURCE=.\pcm_root.c
# End Source File
# Begin Source File

SOURCE=.\pcm_tritri.c
# End Source File
# Begin Source File

SOURCE=.\POLYGRAV.F90
DEP_F90_POLYG=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\RIGFNC.F90
DEP_F90_RIGFN=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\SEARCH.F90
DEP_F90_SEARC=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\SEARCHID.F90
DEP_F90_SEARCH=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\SURFMOTO.F90
DEP_F90_SURFM=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# Begin Source File

SOURCE=.\TLKIT.F90
# End Source File
# Begin Source File

SOURCE=.\TRJCAL.F90
DEP_F90_TRJCA=\
	".\Debug\GLOBAL.mod"\
	
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\pcm.h
# End Source File
# Begin Source File

SOURCE=.\pcm_env.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
