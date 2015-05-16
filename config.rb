ALT     =   "Alt-"
SHIFT   =   "Shift-"
WINKEY  =   "Mod4-"
HLWM_DIR    =   "~/.config/herbstluftwm"
HLWM_SCRIPT_DIR =   "#{HLWM_DIR}/scripts"

SEPARATOR   =   "SEP"
SEPARATOR2  =   "SEP2"
SEPARATOR3  =   "SEP3"

ARR_KEYBIND = {
    ALT+SHIFT+"q"	=>	"spawn #{HLWM_SCRIPT_DIR}/hlwm_quit.sh",
    ALT+SHIFT+"r"	=>	"reload",
    ALT+"Return"	=>	"spawn urxvt",
    ALT+"s"	        =>	"floating toggle",
    ALT+"p"	        =>	"pseudotile toggle",
    WINKEY+"Tab"	=>	"cycle_frame",
    WINKEY+"Left"	=>	"focus left",
    WINKEY+"j"	    =>	"focus right",
    ALT+"Escape"	=>	"use_previous"
}

ARR_KEYCHAINS = {
    "frame"     =>  [
        [   WINKEY, "f",
            [
                [   nil,    "a",    "shift left"    ],
                [   nil,    "s",    "shift right"   ],
                [   nil,    "q",    "shift up"      ],
                [   nil,    "y",    "shift down"    ],
            ],
        ]
    ]
}

=begin rdoc
Stores the tags properties.

Hash. The key is the name of the tag, the value is an array:
* first item is the hotkey
* second item is the layout.
=end
ARR_TAGS = {
    "term"  =>  ["x","(clients max:0)"],
    "web"   =>  ["w","(clients max:0)"],
    "rss"   =>  ["r","(clients max:0)"],
    "email" =>  ["e","(clients max:0)"],
    "dox"   =>  ["d","(split horizontal:0.5:1 (clients max:0) (clients max:1))"],
    "dev"   =>  ["v","(clients max:0)"],
    "bsd"   =>  ["b","(clients max:0)"],
    "lowr"  =>  ["l","(clients max:0)"],
    "music" =>  ["m","(clients max:0)"],
    "burn"  =>  ["n","(clients max:0)"],
    "util"  =>  ["u","(clients max:0)"],
    "game"  =>  ["g","(clients max:0)"],
    "vps"   =>  ["p","(clients max:0)"],
    "rpi"   =>  ["i","(clients max:0)"]
}

ARR_RULES = [
    {:focus     =>  "true"},
    {:class     =>  "Conky",
     :manage    =>  "off"},
    {:class     =>  "KeepassX",
     :pseudotile =>  "on"},
    {:instance  =>  "Navigator",
     :class     =>  "Firefox",
     :tag       =>  "web"},
    {:class     =>  "Chrome",
     :tag       =>  "web"},
    {:instance  =>  "FreeBSD",
     :class     =>  "URxvt",
     :tag       =>  "bsd",
     :switchtag =>  "on"},
    {:instance  =>  "RSS",
     :class     =>  "URxvt",
     :tag       =>  "rss",
     :focus     =>  "false"},
    {:instance  =>  "devel",
     :class     =>  "URxvt",
     :tag       =>  "dev",
     :switchtag =>  "on"},
    {:instance  =>  "dox",
     :class     =>  "URxvt",
     :tag       =>  "dox",
     :index     =>  "0",
     :switchtag =>  "on"},
    {:class     =>  "Latex-viewer",
     :tag       =>  "dox",
     :index     =>  "1",
     :focus     =>  "false"},
    {:instance  =>  "latex-viewer",
     :tag       =>  "dox",
     :index     =>  "1",
     :focus     =>  "false"},
    {:instance  =>  "vps",
     :class     =>  "URxvt",
     :tag       =>  "vps",
     :switchtag =>  "on"},
    {:instance  =>  "rpi",
     :class     =>  "URxvt",
     :tag       =>  "rpi",
     :switchtag =>  "on"},
    {:class     =>  "LibreOffice",
     :tag       =>  "lowr"},
    {:class     =>  "libreoffice-writer",
     :tag       =>  "lowr"},
    {:class     =>  "libreoffice-calc",
     :tag       =>  "lowr"},
    {:class     =>  "Qmpdclient",
     :tag       =>  "music"},
    {:class     =>  "Cdcat",
     :tag       =>  "utils"},
    {:windowtype   =>  "_NET_WM_WINDOW_TYPE_DIALOG",
     :focus     =>  "on",
     :pseudotile    =>  "on"},
    {:windowtype    =>  "_NET_WM_WINDOW_TYPE_UTILITY",
     :manage        =>  "off",
     :focus         =>  "on"}
]

ARR_THEME = {
    :frame_border_normal_color  =>  "#101010",
    :frame_border_active_color  =>  "#222222",
    :frame_bg_normal_color      =>	"#565656",
    :frame_bg_active_color	    =>	"#345f0C",
    :frame_bg_transparent	    =>	"1",
    :frame_border_width	        =>	"1",
    :window_border_width	    =>	"3",
    :window_border_inner_width	=>	"1",
    :window_border_normal_color	=>	"#454545",
    :window_border_active_color	=>	"#9fbc00",
    :always_show_frame	        =>	"1",
    :frame_gap	                =>	"1",
    :window_gap	                =>	"-2",
    :frame_padding	            =>	"2",
    :smart_window_surroundings	=>	"0",
    :smart_frame_surroundings	=>	"1",
    :mouse_recenter_gap	        =>	"0"
}
