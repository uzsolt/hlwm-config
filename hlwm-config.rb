#!/usr/bin/env ruby

=begin rdoc
Load config file.
=end
def loadConfig(file=nil)
    file ||= (ENV["XDG_CONFIG_HOME"] or ENV["HOME"]+"./config") +
        "/herbstluftwm/config.rb"
    load file
end

def strKeybind(arr)
    "keybind #{arr[0]}#{arr[1]} #{arr[2] if arr[2].is_a? String}"
end

def strKeyunbind(arr)
    "keyunbind #{arr[0]}#{arr[1]}"
end

=begin rdoc
Create string of keybinds which can use with <b>herbstclient</b>.
=end
def doKeybind(arr=ARR_KEYBIND,sep=SEPARATOR)
    doChain(arr,"keybind %k %v")
end

=begin rdoc
Create string of keychains.
=end
def doKeychain(arr)
    keych = ""
    arr.each { |k,v|
        keyunbind = ""
        v[0][2].each { |key|
            keyunbind += " #{SEPARATOR3} #{strKeyunbind(key)}"
        }

        keych += " #{SEPARATOR} #{strKeybind(v[0])} chain "+
            "#{SEPARATOR2} emit_hook chain_enter #{k}" +
            doKeybind(v[0][2].map{|x| x[2]+=" XXX"},SEPARATOR2) +
            " #{SEPARATOR2} keybind Escape chain #{keyunbind}"
    }
    keych
end

=begin rdoc
Create string of tags.
=end
def doTags(arr=ARR_TAGS)
    arr_tmp = arr.dup
    doChain(arr_tmp.update(arr_tmp) {
        |k,v| v[1]
    }, "add %k #{SEPARATOR} load %k \"%v\"")
end

=begin rdoc
Create string of rules.
=end
def doRules(arr=ARR_RULES)
    rules = ""
    arr.each { |v|
        rules += " #{SEPARATOR} rule #{doChain(v,"%k=%v","")}"
    }
    rules
end

def doTheme(arr=ARR_THEME)
    doChain(arr,"set %k \"%v\"")
end

def doChain(arr,format,sep=SEPARATOR)
    ret = ""
    arr.each { |k,v|
        ret += " #{sep} #{format.gsub(/%k/,k.to_s).gsub(/%v/,v.to_s)}"
    }
    ret
end

loadConfig("config.rb")
#puts doKeychain(ARR_KEYCHAINS)
["doTags","doRules","doTheme","doKeybind"].each { |k|
    system "herbstclient chain " + send(k)
}
