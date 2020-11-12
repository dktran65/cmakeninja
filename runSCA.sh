#!/bin/bash

## ---Setup KW Project and Server Location
KW_PROJECT=cmake_ninja
KW_SVRNAME=localhost
KW_SVRPORT=8090
KW_INJECTFILE=kwinject.out
KW_BUILDTOOLS=/opt/klocwork/kwbuildtools20.3/bin

## --------------------------------------------------------------------------------
## --- [Cleanup Process] --- Now let do UE4 Game code and project folder clean up ...
## ---
rm -rf /S/Q kwtables
rm -rf /F/Q kwinject.out
rm -rf /F/Q build.ninja


## --------------------------------------------------------------------------------
## --- [kwinject Process] --- Monitor and trace native build, and then generate Build-Spec File
$KW_BUILDTOOLS/kwinject --output $KW_INJECTFILE sh run_native.sh

## --------------------------------------------------------------------------------
## --- [kwinject Process] --- Monitor and trace native build, and then generate Build-Spec File
$KW_BUILDTOOLS/kwbuildproject --url http://$KW_SVRNAME:$KW_SVRPORT/$KW_PROJECT -o kwtables $KW_INJECTFILE --force


## --------------------------------------------------------------------------------
## --- [kwadmin Process] --- Prep data to be Loaded on to Klocwork Portal
$KW_BUILDTOOLS/kwadmin --url http://$KW_SVRNAME:$KW_SVRPORT load $KW_PROJECT kwtables
