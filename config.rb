=begin rdoc
Specify some constants.
=end
ALT     =   "Alt-"
SHIFT   =   "Shift-"
WINKEY  =   "Mod4-"
HLWM_DIR    =   "~/.config/herbstluftwm"
HLWM_SCRIPT_DIR =   "#{HLWM_DIR}/scripts"
BROWSER =   "spawn /home/zsolt/bin/mybrowser"
URXVT   =   "spawn urxt-config-sh"

KC_USE_TAG  =   WINKEY+"t"
KC_MOVE_TAG =   WINKEY+"m"

=begin rdoc
What should run after entering keychain.
<i>%n</i> will substitute the name of the keychain.
=end
KEYCHAIN_ENTER = "emit_hook chain_enter %n"

=begin rdoc
What should run after leave keychain.
<i>%n</i> will substitute the name of the keychain.
=end
KEYCHAIN_LEAVE = "emit_hook chain_leave %n"

=begin rdoc
Which key to cancel the keychains.
=end
KEYCHAIN_EXITKEY = "Escape"

=begin rdoc
The keybinds hash.

The key (of hash) is the hotkey, the value is the herbstluftwm command.
=end
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

=begin rdoc
The keychains array of hashes.
The hash: <i>name</i> is the name of the keychain,
<i>key</i> is the hotkey to enter to keychain,
<i>chains</i> is a hash as <i>ARR_KEYBIND</i>
=end
ARR_KEYCHAINS = [
    {
        "name"  =>  "frame",
        "key"   =>  WINKEY+"f",
        "chains"=>  {
            "a" =>  "shift left",
            "s" =>  "shift right",
            "q" =>  "shift up",
            "y" =>  "shift down"
        }
    },
    {
        "name"  =>  "web",
        "key"   =>  WINKEY+"w",
        "chains"=>  {
            "g"	=>	"#{BROWSER} \"mail.google.com/mail/u/0/#search/l%3Aunread\"",
            "h"	=>	"#{BROWSER} \'hup.hu/user/4277/track\'",
            "m"	=>	"#{BROWSER} 'www.bgrg.mozanaplo.hu'",
            "f"	=>	"#{BROWSER} 'www.facebook.com'",
            "t"	=>	"#{BROWSER} 'http://rpi:9091/transmission/web/'",
            "r"	=>	"#{BROWSER} 'https://direktnet.raiffeisen.hu/rai/direktnet/home.do'"
        }
    },
    {
        "name"  =>  "layout",
        "key"   =>  WINKEY+"a",
        "chains"=>  {
            "v" =>  "set_layout vertical",
            "h" =>  "set_layout horizontal",
            "m" =>  "set_layout max",
            "g" =>  "set_layout grid",
            "r" =>  "rotate",
            "f" =>  "floating on"
        }
    },
    {
        "name"  =>  "herbst",
        "key"   =>  WINKEY+"h",
        "chains"=>  {
            "1" =>  "spawn xdotool click 1",
            "2" =>  "spawn xdotool click 2",
            "t" =>  "spawn #{HLWM_SCRIPT_DIR}/hlwm_translate.sh",
            "c" =>  "spawn #{HLWM_SCRIPT_DIR}/hlwm_calc.sh"
        }
    },
    {
        "name"  =>  "info",
        "key"   =>  WINKEY+"i",
        "chains"=>  {
            "v" =>  "spawn #{HLWM_SCRIPT_DIR}/info-vol.sh",
            "w" =>  "spawn #{HLWM_SCRIPT_DIR}/info-win.sh"
        }
    },
    {
        "name"  =>  "list",
        "key"   =>  WINKEY+"l",
        "chains"=> {
            "a" =>  "spawn #{HLWM_SCRIPT_DIR}/my-dmenu",
            "c" =>  "spawn #{HLWM_SCRIPT_DIR}/change_client.sh",
            "t" =>  "spawn #{HLWM_SCRIPT_DIR}/change_tag.sh"
        }
    },
    {
        "name"  =>  "musicpd",
        "key"   =>  WINKEY+"p",
        "chains"=>  {
            "space" =>  "spawn mpc toggle",
            "n"     =>  "spawn mpc next",
            "s"     =>  "spawn mpc stop",
            "p"     =>  "spawn mpc play"
        }
    },
    {
        "name"  =>  "split",
        "key"   =>  WINKEY+"s",
        "chains"=>  {
            "h" =>  "split horizontal 0.5",
            "v" =>  "split vertical 0.5",
            "r" =>  "remove"
        }
    },
    {
        "name"  =>  "vol",
        "key"   =>  WINKEY+"v",
        "chains"=>  {
            "q"     =>  "spawn mixer vol +5",
            "a"     =>  "spawn mixer vol -5",
            "Q"     =>  "spawn mixer vol +10",
            "A"     =>  "spawn mixer vol -10"
        }
    },
    {
        "name"  =>  "term",
        "key"   =>  WINKEY+"x",
        "chains"=>  {
            "b" =>  "#{URXVT} freebsd",
            "d" =>  "#{URXVT} dox",
            "v" =>  "#{URXVT} devel",
            "x" =>  "#{URXVT} main",
            "p" =>  "#{URXVT} vps ssh uzsolt.hu",
            "i" =>  "#{URXVT} rpi ssh rpi"
        }
    },
    {
        "name"  =>  "client",
        "key"   =>  WINKEY+"c",
        "chains"=>  {
            "c" =>  "close",
            "x" =>  "close"
        }
    }
]

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

=begin rdoc
Stores the rules.

It's an array. Every item is a hash, its key is the property, its value is its value.
=end
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
     :focus         =>  "on"},
    {:class     =>  "Yad",
     :pseudotile    =>  "on"
    }
]

=begin rdoc
The array of theme.

It's a hash. The keys are the property, the values are the property's value.
=end
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
