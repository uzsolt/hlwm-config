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
    doChain(arr,"keybind %k %v",sep)
end

=begin rdoc
Create string of keychains.
=end
def doKeychain(arr=ARR_KEYCHAINS)
    arrkc = Hash.new()
    arr.each { |v|
        keych = ""
        keyunbind = ""
        v["chains"][KEYCHAIN_EXITKEY] = ""
        v["chains"].keys.each { |key|
            keyunbind += " #{SEPARATOR3} keyunbind #{key}"
        }
        keyunbind += " #{SEPARATOR3} #{KEYCHAIN_LEAVE.gsub(/%n/,v["name"])}"

        chdup = v["chains"].dup
        chdup.update(chdup) {
            |ck,cv|
            "chain #{SEPARATOR3} #{cv} #{keyunbind}"
        }
        keych += doKeybind(chdup,SEPARATOR2)
        arrkc[v["key"]] = "chain #{SEPARATOR2} #{KEYCHAIN_ENTER.gsub(/%n/,v["name"])} #{keych}"
    }
    doKeybind arrkc
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

def hashTags(cmd)
    ret = Hash.new
    ARR_TAGS.each { |k,v|
        ret[v[0]]   =  "#{cmd} #{k}"
    }
    ret
end

def doTagsKeychain(arr=ARR_TAGS)
    doKeychain([
        {"name" =>  "tag",
         "key"  =>  KC_USE_TAG,
         "chains"   =>  hashTags("use")
        },
        {"name" =>  "move",
         "key"  =>  KC_MOVE_TAG,
         "chains"   =>  hashTags("move")
        }
    ])
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

["doTags","doRules","doTheme","doKeybind","doKeychain","doTagsKeychain"].each { |k|
    system "herbstclient chain " + send(k)
}
