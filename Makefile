
# Location of the installation of AOLServer
NSHOME   =  /usr/local/aolserver

# SSL support, uncomment two lines below IMAP 
# if c-client library compiled with SSL support
SSL      = -DSSL=1
SSLLIBS  = -lcrypto -lssl

# Location of the UW IMAP c-client library source for RH7.3 and up
IMAPFLAGS  = -I/usr/include/imap
IMAPLIBS   = /usr/lib/c-client.a -L/usr/kerberos/lib -lgssapi_krb5 -lpam

#
# Module name
#
MOD      =  nsimap.so

#
# Objects to build.
#
OBJS     = nsimap.o
CFLAGS	 = -I$(NSHOME)/include $(IMAPFLAGS) -g
MODLIBS	 = $(IMAPLIBS) $(SSLLIBS)

#
# Objects to clean
#
CLEAN   += clean_bak

include  $(NSHOME)/include/Makefile.module

clean_bak:
	rm -rf *~

