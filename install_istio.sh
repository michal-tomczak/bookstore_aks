#!/bin/bash

curl -sL https://istio.io/downloadIstioctl | sh -;
export PATH=./istioctl/bin:$PATH;
which istioctl
