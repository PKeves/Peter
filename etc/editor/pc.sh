blue="[0;34m" ; green="[0;32m" ; yellow="[0;33m" ; red="[0;31m" ; white="[0m"

#docs
if [ $# -eq 0 ]; then
echo -en """
${blue}default profile${white}
pc dp
${blue}secured profile${white}
pc sp

"""
fi

#default profile
if [[ $1 == 'dp' ]]; then
    open -a /Applications/BetterTouchTool.app --hide 
    open -a /Applications/Karabiner-Elements.app --hide 
    open -a /Applications/Alfred\ 4.app --hide 
    hidutil property --set '{"UserKeyMapping":
        [{"HIDKeyboardModifierMappingSrc":0x7000000e3,
        "HIDKeyboardModifierMappingDst":0x7000000e3},
        {"HIDKeyboardModifierMappingSrc":0x700000039,
        "HIDKeyboardModifierMappingDst":0x700000039}],
        }' > /dev/null
fi

#secure profile
if [[ $1 == 'sp' ]]; then
    hidutil property --set '{"UserKeyMapping":
        [{"HIDKeyboardModifierMappingSrc":0x7000000e3, # left GUI (CMD)
        "HIDKeyboardModifierMappingDst":0x7000000e0},  # left CTRL
        {"HIDKeyboardModifierMappingSrc":0x700000039,  # Capslock
        "HIDKeyboardModifierMappingDst":0x7000000e3}], # Map to e4 after app approved (e4 = right ctrl)
        }' > /dev/null
    osascript -e 'tell app "BetterTouchTool" to quit'
    osascript -e 'tell app "Karabiner-Menu" to quit'
    osascript -e 'tell app "Karabiner-Elements" to quit'
    osascript -e 'tell app "Alfred 4" to quit'
fi