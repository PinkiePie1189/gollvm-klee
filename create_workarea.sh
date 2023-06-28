#!/bin/bash

mkdir workarea
cd workarea

git clone https://github.com/llvm/llvm-project.git

cd llvm-project
git checkout 09629215c272f09e3ebde6cc7eac9625d28910ff

cd llvm/tools

git clone https://go.googlesource.com/gollvm
cd gollvm
git checkout 3452ec6bebaa1b432aabed1991475f4444c1775e

git clone https://go.googlesource.com/gofrontend
cd gofrontend
git checkout 1c5bfd57131b68b91d8400bb017f35d416f7aa7b
cd ..

cd libgo
git clone https://github.com/libffi/libffi.git

cd libffi
git checkout 2e825e219fa06d308b9a9863d70320606d67490d
cd ..


git clone https://github.com/ianlancetaylor/libbacktrace.git
cd libbacktrace
git checkout fd9442f7b5413e7788dfcf356f6261afcedb56e8
cd ..
