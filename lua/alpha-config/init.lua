local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

if (vim.o.lines > 30 ) then
dashboard.section.header.val = {
"            :h-                                  Nhy`               ",
"           -mh.                           h.    `Ndho               ",
"           hmh+                          oNm.   oNdhh               ",
"          `Nmhd`                        /NNmd  /NNhhd               ",
"          -NNhhy                      `hMNmmm`+NNdhhh               ",
"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
"       //+++//++++++////+++///::--                 .::::-------::   ",
"       :/++++///////////++++//////.                -:/:----::../-   ",
"       -/++++//++///+//////////////               .::::---:::-.+`   ",
"       `////////////////////////////:.            --::-----...-/    ",
"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
"                        .-:mNdhh:.......--::::-`                    ",
"                           yNh/..------..`                          ",
"                                                                    ",
}
else 
dashboard.section.header.val = {
	[[                                                            ]],
	[[ 888b    888                  888     888 d8b               ]],
	[[ 8888b   888                  888     888 Y8P               ]],
	[[ 88888b  888                  888     888                   ]],
	[[ 888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.  ]],
	[[ 888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888 "888 "88b ]],
	[[ 888  Y88888 88888888 888  888  Y88o88P   888 888  888  888 ]],
	[[ 888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888 ]],
	[[ 888    Y888  "Y8888   "Y88P"     Y8P     888 888  888  888 ]],
	[[                                                            ]],
}
end

dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "p", "  > Projects", ":Telescope sessions_picker<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
