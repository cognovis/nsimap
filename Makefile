ifdef INST
  NSHOME ?= $(INST)
else
  ifdef NSBUILD
    NSHOME=..
  else
    NSHOME=/usr/local/aolserver
    ifneq ( $(shell [ -f $(NSHOME)/include/Makefile.module ] && echo ok), ok)
      NSHOME ?= ../aolserver
    endif
  endif
endif

# SSL support, uncomment two lines below IMAP 
# if c-client library compiled with SSL support
SSL      = -DSSL=1
SSLLIBS  = -lcrypto -lssl

# Location of the UW IMAP c-client library source for RH7.3 and up
IMAPFLAGS  = -I/usr/include/imap
# RedHat 8.x
#IMAPLIBS   = /usr/lib/c-client.a -L/usr/kerberos/lib -lgssapi_krb5 -lpam
# Mandrake 10.x
IMAPLIBS   = /usr/lib/libc-client-nossl.a -lpam

#
# Module name
#
MOD      =  nsimap.so

#
# Objects to build.
#
OBJS     = nsimap.o
CFLAGS	 = $(IMAPFLAGS) -g
MODLIBS	 = $(IMAPLIBS) $(SSLLIBS)

#
# Objects to clean
#
CLEAN   += clean_bak

include  $(NSHOME)/include/Makefile.module

clean_bak:
	rm -rf *~


