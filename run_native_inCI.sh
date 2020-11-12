#!/bin/bash

mkdir -p build.ninja && cd build.ninja && cmake $1 -G Ninja && ninja
