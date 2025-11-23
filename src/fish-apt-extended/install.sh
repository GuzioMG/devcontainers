#!/bin/sh
set -e

echo "Activating feature 'fish-apt-extended'"

STARSHIP=${STARSHIP:-"no"}
GREETING=${GREETING:-"fish_default"}
UPDATE_DATE="$(cat ./update_date.txt)"

if [ "$STARSHIP" = "yes" ] || [ "$STARSHIP" = "true" ]; then
	echo "Installing Starship prompt for FISh..."
	chmod +x "./install_starship-$UPDATE_DATE.sh"
	set +e; ./install_starship-$UPDATE_DATE.sh --yes
	if [ $? -ne 0 ]; then
		set -e
		echo "!!!!! ERROR: Starship installation failed - no changes to FISh prompt will be made"
	else
		set -e
		#echo >> ~/.config/fish/config.fish
		#echo "starship init fish | source" >> ~/.config/fish/config.fish
		echo "Set Starship as the prompt for FISh successfully!"
	fi
fi

if [ "$GREETING" = "fish_default" ]; then
	echo "Using default Greeting."
else
	echo "Selected custom Greeting '$GREETING'..."
	if [ "$GREETING" = "fastfetch" ] || [ "$GREETING" = "fastfetch" ]; then
		:
	elif [ "$GREETING" = "simple" ]; then
		source /etc/os-release
		GREETING="echo \" \\\$ >> DevContainer with FISh v\$FISH_VERSION | via: $PRETTY_NAME\""
	else
		GREETING="echo \"$GREETING\""
	fi

	if [ "$GREETING" = "disabled" ]; then
		echo "...so Greetings shall be disabled!"
		#echo >> ~/.config/fish/config.fish
		#echo "set -g fish_greeting" >> ~/.config/fish/config.fish
	else
		echo "...which is: $GREETING"
		#echo >> ~/.config/fish/config.fish
		#echo "function fish_greeting" >> ~/.config/fish/config.fish
		#echo "    $GREETING" >> ~/.config/fish/config.fish
		#echo "end" >> ~/.config/fish/config.fish
	fi

	echo "Custom Greeting set successfully!"
fi

if [ "$GREETING" = "fastfetch" ]; then
	echo "Installing FastFetch..."
	ARCH=$(uname -m)
	if [ "$ARCH" = "x86_64" ]; then
		ARCH="x64"
	else
		echo "You don't seem to be using a 64-bit x86-CPU - assuming it's ARM64 instead, for the purpose of FastFetch installation."
		ARCH="arm"
	fi
	cp -vr -npr ./fastfetch_$ARCH-$UPDATE_DATE/usr/ /
	echo "FastFetch installed successfully!"
fi


echo "FISh Done!!!"