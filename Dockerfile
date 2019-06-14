FROM centos:7
ARG JA_ENCODING=UTF-8
RUN rm -f /etc/rpm/macros.image-language-conf
RUN sed -i '/^override_install_langs=/d' /etc/yum.conf
RUN yum -y upgrade ca-certificates
RUN yum -y update
RUN yum -y install epel-release 
RUN yum --disablerepo=epel  reinstall -y glibc-common
ENV LANG ja_JP.${JA_ENCODING}
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ${JA_ENCODING}
RUN echo LANG="ja_JP.${JA_ENCODING}" > /etc/sysconfig/i18n
RUN yum clean all
RUN echo ZONE="Asia/Tokyo" > /etc/sysconfig/clock 
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
