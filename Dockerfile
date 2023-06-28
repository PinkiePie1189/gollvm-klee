FROM fedora:36

WORKDIR /gollvm

COPY workarea . 

RUN dnf update -y


COPY ./compile_gollvm.sh .

RUN ["chmod", "a+x", "compile_gollvm.sh"]

RUN ./compile_gollvm.sh | tee build.log

RUN dnf install -y klee clang

#WORKDIR /gccgo_build

#COPY gccgo .

#WORKDIR /gccgo_build/objdir

#ARG CC=/usr/bin/clang

#RUN ["/gccgo_build/gccgo/configure", "--enable-languages=c,c++,go", "--enable-shared"]

CMD ["/bin/bash"]
