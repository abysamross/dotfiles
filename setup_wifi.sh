#!/bin/bash

sudo ip link set wlp2s0 up
sudo systemctl restart wpa_supplicant.service
sudo systemctl restart dhclient.service
