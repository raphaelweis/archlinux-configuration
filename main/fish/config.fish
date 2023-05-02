#############################
# Plugins
#############################

starship init fish | source

#############################
# General configuratoin
#############################

set --erase fish_greeting # disable welcome prompt

#############################
# Interactive
#############################
if status is-interactive
    # Commands to run in interactive sessions can go here
end
