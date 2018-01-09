#!/bin/sh

VERSION_PATTERN='[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+'

guessLatestRelease() {
	local replaceWith='/download'
    LATEST_RELEASE_URL=$( curl -w "%{url_effective}\n" -I -L -s -S https://github.com/atom/atom/releases/latest -o /dev/null )
	[ $? -gt 0 ] && exit 1
    LATEST_RELEASE_URL="${LATEST_RELEASE_URL/\/tag\//${replaceWith}/}/atom.x86_64.rpm"
	LATEST_RELEASE=$( echo "${LATEST_RELEASE_URL}" | grep -oh ${VERSION_PATTERN} )
}

guessCurrentRelease() {
	# Salida similar a: 1.23.1
	CURRENT_RELEASE=$( rpm -qa | grep atom | grep -oh ${VERSION_PATTERN} )
}

showReleaseVersion() {
    echo "* Atom latest  version=${LATEST_RELEASE}"
    echo "* Atom current version=${CURRENT_RELEASE}"
}

ioDownload() {
	echo "* Atom download begins"
	curl -L "${1}" --output "${2}" --silent || exit 1
	echo "* Atom download ends $?"
}

atomDownload() {
	ioDownload "${LATEST_RELEASE_URL}" "${ATOM_INSTALLER}"
}

atomInstallOrUpdate() {
	ATOM_INSTALLER='/tmp/atom.x86_64.rpm'
	if [ "x${CURRENT_RELEASE}" = "x" ]; then	
		atomDownload
		echo "* Atom installation begins"
		rpm -i "${ATOM_INSTALLER}"
		echo "* Atom installation ends"
	elif [ "x${CURRENT_RELEASE}" != "x${LATEST_RELEASE}" ]; then
		atomDownload
		echo "* Atom update begins"
		rpm -U ${ATOM_INSTALLER}
		echo "* Atom update ends"
	else
		echo "* Atom is updated"
    fi
}

guessLatestRelease
guessCurrentRelease
showReleaseVersion
atomInstallOrUpdate
