#!/bin/zsh
# cf. [シェル - echoで文字に色をつける その1 - Miuran Business Systems](http://www.m-bsys.com/linux/echo-color-1)

color_black='\e[30m'
color_red='\e[31m'
color_green='\e[32m'
color_yellow='\e[33m'
color_blue='\e[34m'
color_magenta='\e[35m'
color_cyan='\e[36m'
color_white='\e[37m'

background_color_black='\e[40m'
background_color_red='\e[41m'
background_color_green='\e[42m'
background_color_yellow='\e[43m'
background_color_blue='\e[44m'
background_color_magenta='\e[45m'
background_color_cyan='\e[46m'
background_color_white='\e[47m'

font_bold='\e[1m'
font_low_intensity='\e[2m'
font_underline='\e[4m'
font_blink='\e[5m'
font_reverse_video='\e[7m'
font_invisible_text='\e[8m'

font_red_and_bold='\e[31;1m'

# color_reset='\e0[m'
color_reset='\e[m'

message='Hello, world!'
echo "${color_green}${message}${color_reset}"
echo "${color_red}${message}${color_reset}"
