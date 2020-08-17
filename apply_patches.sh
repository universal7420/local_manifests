#!/bin/bash

# Original script credit to ChronoMonochrome
# Adapted by JoshuaDoes to be simpler

apply() {
	[ ! -n "$ANDROID_BUILD_TOP" ] && echo "Please specify ANDROID_BUILD_TOP before running this script!" && return

	while read line; do
		proj=$(echo $line | cut -d " " -f1)
		patch=$(echo $line | cut -f 2- -d " ")
		echo -e "Applying patches to $proj"
		echo
		git -C "$ANDROID_BUILD_TOP/$proj" apply "$ANDROID_BUILD_TOP/.repo/local_manifests/patches/$patch"
		echo ""; echo "";
	done < $ANDROID_BUILD_TOP/.repo/local_manifests/patches/list.txt
}

apply
