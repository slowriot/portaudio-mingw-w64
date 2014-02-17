# This is mostly used by the musicplayer module atm.
# This is mostly for MacOSX now because it is the only OS
# where we link against this PortAudio.

!mac {
	error( "Only tested for MacOSX yet." )
}

TEMPLATE = lib
CONFIG = staticlib

INCLUDEPATH += include src/common
SOURCES += $$files(src/common/*.c)
HEADERS += $$files(include/*.h)
HEADERS += $$files(src/common/*.h)

!win32 {
	SOURCES += $$files(src/os/unix/*.c)
	HEADERS += $$files(src/os/unix/*.h)
}

mac {
	QMAKE_CFLAGS += -DPA_USE_COREAUDIO
	SOURCES += $$files(src/hostapi/coreaudio/*.c)
	HEADERS += $$files(src/hostapi/coreaudio/*.h)
	SOURCES -= src/hostapi/coreaudio/pa_mac_core_old.c
}
