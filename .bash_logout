#######################################################################
#          Remove plaintext github hub credentials on logout          #
#######################################################################

if [ -e "$HOME"/.config/hub ]; then
    rm "$HOME"/.config/hub
fi
