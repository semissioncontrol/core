# semissioncontrol/core - (c) 2020 SEMC

# This is the core of SEMC. It is with this
# program that SEMC modules are installed,
# managed, invoked and removed. It is the
# most important (yet maybe the easiest to
# write) parts of code in SEMC.

# Theory
# The installation script, from 
# `semissioncontrol.github.io/install.sh`, 
# has already created the /semc directory.
# It is now core's turn to install modules.
# A list of the intended modules to install are
# located at semissioncontrol/core/supported.

# First off, install cli, this is the most important
# and is done first.

# Get cli
cd /semc/src
git clone https://github.com/semissioncontrol/cli

# Invoke cli installation script
bash /semc/src/core/actions/start/cli

# Now, go through the installation file. Each
# module to be installed is seperated by a
# newline in semissioncontrol/core/supported
while IFS= read -r line
do
	echo "Installing semissioncontrol/$line"
	cd /semc/src
	git clone https://github.com/semissioncontrol/$line

done < "/semc/src/core/supported"
