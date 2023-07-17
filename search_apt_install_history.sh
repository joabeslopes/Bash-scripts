#!/bin/bash

zcat -qf /var/log/apt/history.log* | grep " install "

# For see the uninstall log, it's just change the option on grep
