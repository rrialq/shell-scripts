&& title '    * Creating 10-keyboard.conf' \
&& echo 'Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout"  "es,us"
    Option "XkbModel"   "pc104"
    Option "XkbVariant" "deadtilde,dvorak"
    Option "XkbOptions" "grp:alt_shift_toggle"
EndSection' | sudo tee --append /etc/X11/xorg.conf.d/10-keyboard.conf > /dev/null
