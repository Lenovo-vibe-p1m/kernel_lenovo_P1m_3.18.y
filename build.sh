#!/bin/bash

#Script by Dhiraj

#clean out dir
rm -rf out

#get toolchain gcc-4.9
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 toolchain 

#Compile kernel with a build script to make things simple

#make out dir
mkdir -p out

export USE_CCACHE=1

export ARCH=arm64 ARCH_MTK_PLATFORM=mt6735

#host and user
export KBUILD_BUILD_USER="Saif001"
export KBUILD_BUILD_HOST="XenielLabs"

export CROSS_COMPILE=/home/ubuntu/los15/kernel/lenovo/P1m/toolchain/bin/aarch64-linux-android-

#Defconfig for p1m
make -C $PWD O=$PWD/out ARCH=arm64 yl6735m_65u_ov_m_defconfig

#make kernel in out dir
make -j64 -C $PWD O=$PWD/out ARCH=arm64
