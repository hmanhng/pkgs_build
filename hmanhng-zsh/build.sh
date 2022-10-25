#!/usr/bin/env bash
pkg=(`pwd | cut -f6 -d'/'`)

## Script Termination
exit_on_signal_SIGINT () {
    { printf "\n\n%s\n" "Script interrupted." 2>&1; echo; }
    exit 0
}

exit_on_signal_SIGTERM () {
    { printf "\n\n%s\n" "Script terminated." 2>&1; echo; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

# Build packages
build_pkgs () {
	echo -e "\nBuilding Packages - \n"
		echo -e "Building ${pkg}..."
		makepkg -s --skipchecksums

		rm -rf src pkg

		# Verify
		while true; do
			set -- ${pkg}-*
			if [[ -e "$1" ]]; then
				echo -e "\nPackage '${pkg}' generated successfully.\n"
				break
			else
				echo -e "\nFailed to build '${pkg}', Exiting...\n"
				exit 1;
			fi
		done

	RDIR='../../pkgs/x86_64'
	if [[ -d "$RDIR" ]]; then
		mv -f ./*.pkg.tar.zst "$RDIR"
		echo -e "Packages moved to Repository.\n[!] Don't forget to update the database.\n"
	fi
}

# Execute
build_pkgs
