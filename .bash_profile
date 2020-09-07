PS1=$'\e[1;36m$PWD $ \E[0m'

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export TIME_STYLE=long-iso  # sets yyyy-mm-dd hh:mm as default date format

alias bp='. ~/.bash_profile'  #build profile
alias cp='cp -R'
alias ex='exit'
fd() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1" ; name="$2" ; else dir="$PWD" ; name="$1" ; fi
    gfind $dir -type d -iname "$name" 
}  #find directory
ff() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1" ; name="$2" ; else dir="$PWD" ; name="$1" ; fi
    gfind $dir -type f -iname "$name" 
} #find file
alias fp='ps -eaf | grep '  #find process
fs() {
    dir="" ; string=""
    if [[ $# == 2 ]] ; then dir="$1" ; string="$2" ; else dir="$PWD" ; string="$1" ; fi
    ggrep -nirP --include \*$3 --exclude \*.onnx "$string" "$dir" | awk -F: '{gsub(/^[ \t]+/, "", $2); gsub (/[ \t]+$/, "", $2); gsub(/^[ \t]+/, "", $3); gsub (/[ \t]+$/, "", $3); $3=$3$4$5$6$7$8$9$10; printf ("%s! %3s %s\n", $1, $2, substr($3,0,60))}' | column -t -s '!'
}  #find string
alias gp='chmod -R 777'  #grant permissions
hd() { if [ $# -eq 2 ] ; then head -n $1 $2; printf "\n"; else head $1 ; printf "\n"; fi } #head
alias hk='/Users/root/code/shell/housekeeper.sh'  #housekeeping
alias hs='history'  #history
alias i='. /Users/root/code/shell/i.sh'  #switch host
alias ka='killall'  #kill all
alias kp='kill -9'  #kill process
alias lj='jobs'  #list jobs
alias lp='top'  #list processes
la() {
gls -A --group-directories-first $1
}   #list alphabetically
lc() {
gls -lrt $1 |  awk '{print $6,$7,$8,$9}'  | sed -n '1!p'
}  #list chronologically 
md() {
    if [ $# -eq 0 ]; then
    vim -
    else
    vim $1
    fi
}  #modify: md file or ls | md
alias me='whoami'  #me
mv() {
    if [[ $# -eq 2 ]] ; then 
    gmv $1 $2
    else
    target=$(echo "${@:${#@}:${#@}}")
    set -- "${@: 1: $#-1}"
    gmv -t $target $@
    fi
}  #move file_a file_b ... file_z to target
alias nd='mkdir -p'  #new directory
ndsd(){ mkdir -p $1 && cd $1; }
alias nf='touch'  #new file
nfop(){ for var in "$@"; do touch $var && code -r $var; done }
alias op='open'  #open
rc() { wc -l $@ | awk '{ printf $2 " " $1 "\n" }' | column -t | sed 's/ //'; }  #row count
rd(){
    cat $1 ; printf "\n"
}  #read
alias rm='rm -r'  #remove
alias sc='/Users/root/code/shell/source_control.sh'  #source control
sd() { if [ $# -eq 0 ] ; then cd . && la ; else cd $1 && la $2 ;fi }  #swich directory
alias sdal='sd /Users/root/alfred'
alias sdbt='sd /Users/root/btt'
alias sdch='sd /Users/root/chrome'
alias sdco='sd /Users/root/code'
alias sdgi='sd /Users/root/git'
alias sdka='sd /Users/root/karabiner'
alias sdos='sd /'
alias sdsp='sd /Users/root/spotify'
alias sdtm='sd /Users/root/tmp'
tl() { if [ $# -eq 2 ] ; then tail -n $1 $2; printf "\n"; else tail $1 ; printf "\n"; fi } #tail