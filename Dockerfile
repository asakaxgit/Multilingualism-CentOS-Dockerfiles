FROM centos:6
ARG JA_ENCODING=utf8
RUN yum -y upgrade ca-certificates
RUN yum -y update
RUN yum -y install epel-release 
RUN yum --disablerepo=epel  reinstall -y glibc-common
ENV LANG ja_JP.${JA_ENCODING}
RUN echo LANG="ja_JP.${JA_ENCODING}" > /etc/sysconfig/i18n
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ${JA_ENCODING}
RUN yum clean all
RUN echo ZONE="Asia/Tokyo" > /etc/sysconfig/clock 
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
