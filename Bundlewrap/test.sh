#!/bin/bash -eu
pip3 install -r requirements.txt
bw test -P 4 -p 4

bw hash -d > node_status
