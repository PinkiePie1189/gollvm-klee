#apt install -y git gcc g++ ninja-build cmake python3 m4

dnf install -y git gcc g++ ninja-build cmake python3 m4 clang lld


cd workarea

mkdir build.rel
cd build.rel

cmake \
 -DCMAKE_SHARED_LINKER_FLAGS=-flto \
 -DGOLLVM_EXTRA_CFLAGS=-flto \
 -DCMAKE_C_FLAGS=-flto \
 -DCMAKE_CXX_FLAGS=-flto \
 -DCMAKE_EXE_LINKER_FLAGS=-save-temps \
 -DCMAKE_C_COMPILER=/usr/bin/clang \
 -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
 -DCMAKE_INSTALL_PREFIX=/usr/local \
 -DCMAKE_BUILD_TYPE=Release \
 -DLLVM_USE_LINKER=lld \
 -G Ninja \
 ../llvm-project/llvm

# Build all of gollvm
ninja -v gollvm

# Install gollvm to /usr/local
ninja -v install-gollvm

export LD_LIBRARY_PATH=/usr/local/lib64
export PATH=/usr/local/bin:$PATH
