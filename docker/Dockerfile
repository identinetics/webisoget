FROM centos:7

RUN yum -y update \
 && yum -y groupinstall "Development tools" \
 && yum -y install epel-release \
 && yum -y install shtool \
 && yum -y install libtool shtool libcurl-devel openssl-devel

WORKDIR /src
RUN git clone \
 && bash ./boot \
 && ./configure
RUN make
RUN make install \
 && webisoget -version | egrep '^WebISOGet version ' \
 && mkdir /webisoget

WORKDIR /webisoget


