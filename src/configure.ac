# Configuration script for webisoget library and command-line tool
# by fox, 2005-2016

#
# Note the version number appears in doc/webisoget.html as well.
#
AC_INIT(WebISOGet, 2.8.7)
AM_INIT_AUTOMAKE
AC_AIX

AC_CONFIG_MACRO_DIR([m4])
AC_PROG_LIBTOOL
AC_LANG(C)

AC_PROG_CC

AC_PROG_INSTALL

# look for openssl install
AC_ARG_WITH(ssl,
    AC_HELP_STRING([--with-ssl=PATH], [openssl install path]),
[ case "$withval" in
   no)
     ;;
   *)
     LDFLAGS="$LDFLAGS -L$withval/lib"
     CPPFLAGS="$CPPFLAGS -I$withval/include"
     ;;
  esac ])

# look for curl install
AC_ARG_WITH(curl,
    AC_HELP_STRING([--with-curl=PATH], [Curl install path]),
[ case "$withval" in
   no)
     ;;
   *)
     LDFLAGS="$LDFLAGS -L$withval/lib"
     CPPFLAGS="$CPPFLAGS -I$withval/include"
     ;;
  esac ])
# look for curl lib
AC_ARG_WITH(curl-lib,
    AC_HELP_STRING([--with-curl-lib=PATH], [Curl lib path]),
[ case "$withval" in
   no)
     ;;
   *)
     LDFLAGS="$LDFLAGS -L$withval"
     ;;
  esac ])

# look for curl includes
AC_ARG_WITH(curl-include,
    AC_HELP_STRING([--with-curl-include=PATH], [Curl include path]),
[ case "$withval" in
   no)
     ;;
   *)
     CPPFLAGS="$CPPFLAGS -I$withval"
     ;;
  esac ])

AC_CHECK_LIB(curl,curl_easy_init,,
      AC_MSG_ERROR(Cannot find the curl library),
      [-lssl -lcrypto -lz])
AC_CHECK_HEADER([curl/curl.h])

# check for right version of curl
AC_MSG_NOTICE([Checking libcurl version.])
AC_LINK_IFELSE([
  AC_LANG_SOURCE([[
#include <curl/curl.h>
int main(){ CURL *c; curl_easy_setopt(c, CURLOPT_RESOLVE, NULL);}
]])]
,[CPPFLAGS="$CPPFLAGS -DHAVE_CURLOPT_RESOLVE"],[AC_MSG_NOTICE(libcurl does not support CURLOPT_RESOLVE (needs vers 7.30+) --  map command wll not work)]) 



AC_OUTPUT(Makefile)
