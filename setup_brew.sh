#!/bin/bash

# Install brews
brew $(cat Brewfile|grep -v "#")

# Install casks
if [ "$1" = "--no-cask" ]; then
	echo "Skipping Caskfile";
else
	brew $(cat Caskfile|grep -v "#");
fi
