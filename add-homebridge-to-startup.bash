#!/usr/bin/env awesome-bash

awesome_shell_help <<_HELP_
Adds homebridge to init.d and startup

Usage: $awesome_shell_script_name [-h|--help]

Options:
    -h, --help   this help

_HELP_
#awesome-shell ref:db4a91e

init_scripts_dir="$awesome_shell_script_dir/init.d"
[ -d "$init_scripts_dir" ] && [ -f "$init_scripts_dir/homebridge" ] 
fatal_if_any_error "Cannot find $init_scripts_dir/homebridge file"
awesome_shell_include system

has_command 'homebridge' || fatal "Cannot find homebridge. Have you installed it: sudo npm install -g --unsafe-perm homebridge?"

ask_to_confirm "About to install homebridge as a startup service"
awesome_shell_include password
keep_sudo_alive

destination_file='/etc/init.d/homebridge'
silent_exec_with_title "Adding $destination_file" "sudo cp $init_scripts_dir/homebridge destination_file"
silent_exec_with_title "Setting up permissions for $destination_file" "sudo chmod 755 $destination_file"
silent_exec_with_title "Setting up homebridge for startup" "sudo update-rc.d homebridge defaults"
fatal_if_any_error

msg "To start service manually: sudo /etc/init.d/homebridge start"
msg "Logging into /var/log/homebridge.log and /var/log/homebridge.err"
