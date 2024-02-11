FROM centos:8

RUN dnf groupinstall -y "Development Tools" && \
    dnf install -y \
        kernel-devel \
        kernel-headers

ENV PATH /root/.nimble/bin:$PATH
RUN curl https://nim-lang.org/choosenim/init.sh -sSf > init.sh
RUN sh init.sh -y \
    && choosenim stable
COPY tools /tools
RUN cd /tools && \
    nimble build -Y && \
    cp -p bin/* /

COPY template.spec /
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
