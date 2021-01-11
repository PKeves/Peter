export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export TIME_STYLE=long-iso  # sets yyyy-mm-dd hh:mm as default date format
bash_profile_cache="/Users/peter/.bash_profile_cache"
PS1=$'\e[1;36m$PWD $ \E[0m'

ad() { if [ $# -eq 0 ] ; then command cd .  ; else command cd $1 ;fi }  #absorb dir
alias ada='cd /Users/peter/apps'
alias adaa='cd /Users/peter/apps/alfred'
alias adab='cd /Users/peter/apps/browser'
alias adad='cd /Users/peter/apps/db'
alias adae='cd /Users/peter/apps/editor'
alias adaj='cd /Users/peter/apps/jupyter'
alias adak='cd /Users/peter/apps/karabiner'
alias adao='cd /Users/peter/apps/os'
alias adap='cd /Users/peter/apps/powershell'
alias adas='cd /Users/peter/apps/spotify'
alias adg='cd /Users/peter/git'
alias adl='cd /Users/peter/lib'
alias adlb='cd /Users/peter/lib/books'
alias adld='cd /Users/peter/lib/docs'
alias adli='cd /Users/peter/lib/id'
alias adll='cd /Users/peter/lib/lang'
alias adln='cd /Users/peter/lib/notes'
alias adls='cd /Users/peter/lib/safe'
alias adp='cd /Users/peter'    
alias adr='cd /'               
alias adt='cd /Users/peter/tmp'
bd(){
    cat $1 ; printf "\n"
}  #body
alias bp='. ~/.bash_profile'  #build profile
alias cp='cp -R'
cr() { wc -l $@ | awk '{ printf $1 " " $2 "\n" }' | column -t | sed 's/ //'; }  #count rows
cpo(){
    gcp -R $1 $2
    op $2
} # cp + open
alias df='code -d' #difference
alias ex='exit'
fd() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type d -iname "$name" 
}  #find $dir
ff() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type f -iname "$name" 
} #find $file
alias fp='ps -eaf | grep '  #find $process
fs() {
    dir="" ; string=""
    if [[ $# == 2 ]] ; then dir="$1/" ; string="$2" ; else dir="$PWD/" ; string="$1" ; fi
    ggrep -nirP --include \*$3 --exclude \*.onnx "$string" "$dir" | awk -F: '{gsub(/^[ \t]+/, "", $2); gsub (/[ \t]+$/, "", $2); gsub(/^[ \t]+/, "", $3); gsub (/[ \t]+$/, "", $3); $3=$3$4$5$6$7$8$9$10; printf ("%s! %3s %s\n", $1, $2, substr($3,0,60))}' | column -t -s '!'
}  #find $string
alias gp='chmod -R 777'  #grant permissions
gz(){
    for file in "$@"; do
        ext="${file##*.}"
        if [[ "$ext" == "zip" ]]; then
            unzip $file
        elif [[ "$ext" == "gz" ]]; then
            gunzip -d $file
        else 
            gzip $file
        fi
    done
}   #gzip
hd() { if [ $# -eq 2 ] ; then head -n $1 $2; printf "\n"; else head $1 ; printf "\n"; fi }  #head $file | head $file $limit
alias hs='history'  #history
alias jn='jupyter notebook'
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
}  #modify: md $file
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
mvo() {
    gmv $1 $2
    open $2
} #mv + open
alias nd='mkdir -p'  #new directory
nda(){ mkdir -p $1 && cd $1; } #nd + absorb
nds(){ mkdir -p $1 && sd $1; } #nd + stream
alias nf='touch'  #new file
nfo() {
    for file in "$@"; do
        touch $file
        open $file
    done
}   #new file + open
nj() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
}   #new java
njo() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
}   #nj + open
njt() {
touch /Users/peter/tmp/Test.java
echo """public class Test{
    public static void main(String args[]){
        
    }
}""" > /Users/peter/tmp/Test.java
    open /Users/peter/tmp/Test.java 
}   #nj + test
np() {
    for file in "$@"; do
        touch $file.py
    done
}   #new python
npo() {
    for file in "$@"; do
        touch $file.py
        open $file.py
    done
} #np + open
npt() {
    touch /Users/peter/tmp/test.py
    open /Users/peter/tmp/test.py
}   #np + test
nt() {
    for file in "$@"; do
        touch $file.txt
    done
}   #new text
nto() {
    for file in "$@"; do
        touch $file.txt
        open $file.txt
    done
}   #new text + open
ob(){
    for file in "$@"; do
        open $file -a "Google Chrome"
    done
}   #open with browser
oe(){
    for file in "$@"; do
        open $file -a "Visual Studio Code"
    done
}   #open with editor
ol(){
    code -g $2:$1
}   #open line
on(){
    for file in "$@"; do
        open $file -a "Notes"
    done
}   #open with notes
alias op='open' #open with default app
ov(){
    for file in "$@"; do
        open $file -a "Preview"
    done
}   #open with browser
pr(){
    rm ~/Library/Mobile\ Documents/com~apple~CloudDocs/*
    
    nd ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps
    cp ~/apps/alfred ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/autohotkey ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/btt ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/browser ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/editor ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/db ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/karabiner ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/os ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/
    cp ~/apps/powershell ~/Library/Mobile\ Documents/com~apple~CloudDocs/apps/

    nd ~/Library/Mobile\ Documents/com~apple~CloudDocslib
    cp ~lib/docs ~/Library/Mobile\ Documents/com~apple~CloudDocslib
    cp ~lib/id ~/Library/Mobile\ Documents/com~apple~CloudDocslib
    cp ~lib/notes ~/Library/Mobile\ Documents/com~apple~CloudDocslib
}   #push resources
rj(){
    javac $1 &&  java $1
} #run java
rjt(){
    javac /Users/peter/tmp/Test.java && java /Users/peter/tmp/Test.java
} #rj + test
alias rp='/usr/local/bin/python3' #run python
alias rpt='/usr/local/bin/python3 /Users/peter/tmp/test.py' #rp + test
alias rm='rm -r'  #remove
alias sc='/Users/peter/apps/editor/sc.sh'  #source control
sd() { if [ $# -eq 0 ] ; then cd . && la ; else cd $1 && la $2 ;fi }  #stream dir
alias sda='sd /Users/peter/apps'
alias sdaa='sd /Users/peter/apps/alfred'
alias sdab='sd /Users/peter/apps/browser'
alias sdad='sd /Users/peter/apps/db'
alias sdae='sd /Users/peter/apps/editor'
alias sdaj='sd /Users/peter/apps/jupyter'
alias sdak='sd /Users/peter/apps/karabiner'
alias sdao='sd /Users/peter/apps/os'
alias sdap='sd /Users/peter/apps/powershell'
alias sdas='sd /Users/peter/apps/spotify'
alias sdg='sd /Users/peter/git'
alias sdl='sd /Users/peter/lib'
alias sdlb='sd /Users/peter/lib/books'
alias sdld='sd /Users/peter/lib/docs'
alias sdli='sd /Users/peter/lib/id'
alias sdll='sd /Users/peter/lib/lang'
alias sdln='sd /Users/peter/lib/notes'
alias sdls='sd /Users/peter/lib/safe'
alias sdp='sd /Users/peter'    
alias sdr='sd /'               
alias sdt='sd /Users/peter/tmp'
tc(){
    while read l; do 
        mv /Users/peter/tmp/$l /Users/peter/
    done < $bash_profile_cache \
    &&
    for item in "$@"; do
        mv /Users/peter/tmp/$item /Users/peter/
    done \
    &&
    rm -rf /Users/peter/tmp/{,.[.!],..?}*  >/dev/null 2>/dev/null \
    &&
    while read l; do 
        mv /Users/peter/$l /Users/peter/tmp
    done < $bash_profile_cache \
    &&
    for item in "$@"; do
        mv /Users/peter/$item /Users/peter/tmp
    done
}   #tmp clean
tf(){
    gsed --in-place "/$1/d" $bash_profile_cache
}   #tmp forget (remove_from bash_profile_cache)
tfa(){
    echo -n > $bash_profile_cache
}   #tf + all bash_profile_cache
tm(){
    while read l; do 
    echo $l
    done < $bash_profile_cache
}   #tmp memory bash_profile_cache
tr(){
    echo "$1" >> $bash_profile_cache
}   #tmp remember (add to bash_profile_cache)='sd /Users/peter/tmp'
alias pcd='. /Users/peter/apps/editor/pc.sh dp'  #profile control defualt profile
alias pcs='. /Users/peter/apps/editor/pc.sh sp'  #profile control secure profile
alias py='python'
tl() { if [ $# -eq 2 ] ; then tail -n $1 $2; printf "\n"; else tail $1 ; printf "\n"; fi }  #tail $file | tail $file $limit
