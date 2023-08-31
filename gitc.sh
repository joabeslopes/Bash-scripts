#!/bin/bash

# Shortcut for commiting on git. There is no need to add quotes on the message.
message="$@"
git commit -m "$message"
