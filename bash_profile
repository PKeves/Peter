#todo:
#pr

shopt -s extglob

export TIME_STYLE=long-iso
peter_dir='/Users/peter'
host_dir=$peter_dir  # when working on different host change it to host_dir
PS1=$'\e[1;36m$PWD $ \E[0m'

ad() { 
if [ $# -eq 0 ] ; then
    cd . 
elif [[ -f $1 ]]; then
    vim $1 -u ${peter_dir}/.vimrc
else 
    cd $1 
fi 
}
alias adb='ad ${peter_dir}/.bash_profile'
add() {
    mkdir -p $1
    ad $1
} 
adf() {
    for file in "$@"; do
        touch $file
        ad $file
    done
} 
alias adg='ad ${peter_dir}/git'
alias adh='ad ${host_dir}'
alias adi='ad ${peter_dir/res/index'
alias adp='ad ${peter_dir}'    
alias adr='ad ${peter_dir}/res'
alias adri='ad ${peter_dir}/res/issues'
alias adt='ad ${peter_dir}/tmp'
alias adu='ad ..'    
alias adv='ad ${peter_dir}/.vimrc'
bd(){
    cat $1 ; printf "\n"
}
alias bp='. ${peter_dir}/.bash_profile'
alias cp='cp -R'
cr() { wc -l $@ | awk '{ printf $1 " " $2 "\n" }' | column -t | sed 's/ //'; }
cpo(){
    gcp -R $1 $2
    op $2
} # cp + open
alias df='code -d' #difference
alias ex='exit'
alias ds='fc -s'
alias fb='which'
fd() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type d -iname "$name" 
}
ff() {
    dir="" ; name=""
    if [[ $# == 2 ]] ; then dir="$1/" ; name="$2" ; else dir="$PWD/" ; name="$1" ; fi
    gfind $dir -type f -iname "$name" 
} #find $file
fs() {
    dir="" ; string=""
    if [[ $# == 2 ]] ; then dir="$1/" ; string="$2" ; else dir="$PWD/" ; string="$1" ; fi
    ggrep -nirP --include \*$3 --exclude \*.onnx "$string" "$dir" | awk -F: '{gsub(/^[ \t]+/, "", $2); gsub (/[ \t]+$/, "", $2); gsub(/^[ \t]+/, "", $3); gsub (/[ \t]+$/, "", $3); $3=$3$4$5$6$7$8$9$10; printf ("%s! %3s %s\n", $1, $2, substr($3,0,60))}' | column -t -s '!'
}
alias gad='git add'
alias gada='git add -A'
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbrl='git branch -v'
alias gbrm='git branch -m'
alias gbrr='git branch -r'
alias gcf='git config --global'
alias gcfa='git config --global --add'
alias gcfe='git config --global --edit'
alias gcfl='git config --global --list'
alias gcfr='git config --global --replace-all'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gcht='git checkout -t'
alias gcl='git clone'
gcm() { git commit -m "$1";}
gcma() { git commit -am "$1";}
alias gcn='git clean -fd'
alias gcp='git cherry-pick'
alias gdf='git diff'
alias gft='git fetch'
alias ggr='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gin='git init'
alias glg='git log'
alias gmr='git merge'
alias gp='chmod -R 777'
gph() { git push origin $1:$1; }
alias gpl='git pull origin'
alias grbi='giti rebase -i'
alias grr='git rebase'
alias grs='git reset'
alias grsh='git reset --hard'
alias grv='git revert'
alias gss='git stash'
alias gssl='git stash list'
alias gssp='git stash pop'
alias gst='git status'
alias gtg='git tag'
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
} 
hd() { if [ $# -eq 2 ] ; then head -n $1 $2; printf "\n"; else head $1 ; printf "\n"; fi }  #head $file | head $file $limit
alias hs='history'
alias jn='jupyter notebook'
alias ka='killall'
alias kp='kill -9'
alias lj='jobs'
la() {
gls -A --group-directories-first $1 -I ".DS_Store" 
} 
lc() {
gls -lrt $1 |  awk '{print $6,$7,$8,$9}'  | sed -n '1!p'
}
alias lg='la ${peter_dir}/git'
lp(){
    if [ $# -eq 0 ]; then
    top
    else
    ps -eaf | grep $1
    fi
}
alias me='whoami'
alias nd='mkdir -p'
nda(){ mkdir -p $1 && cd $1; } 
nds(){ mkdir -p $1 && sd $1; } 
alias nf='touch'
nfo() {
    for file in "$@"; do
        touch $file
        open $file
    done
} 
nj() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
} 
njo() {
    for raw_file in "$@"; do
        file="$(tr '[:lower:]' '[:upper:]' <<< ${raw_file:0:1})${raw_file:1}"
        touch $file.java
    done
} 
njt() {
touch ${peter_dir}/tmp/Test.java
echo """public class Test{
    public static void main(String args[]){
        
    }
}""" > ${peter_dir}/tmp/Test.java
    open ${peter_dir}/tmp/Test.java 
} 
np() {
    for file in "$@"; do
        touch $file.py
    done
} 
npo() {
    for file in "$@"; do
        touch $file.py
        open $file.py
    done
} #np + open
npt() {
    touch ${peter_dir}/tmp/test.py
    open ${peter_dir}/tmp/test.py
} 
nt() {
    for file in "$@"; do
        touch $file.txt
    done
} 
nto() {
    for file in "$@"; do
        touch $file.txt
        open $file.txt
    done
} 
oc(){
    for file in "$@"; do
        open $file -a "Google Chrome"
    done
} 
ov(){
    for file in "$@"; do
        open $file -a "Visual Studio Code"
    done
} 
ol(){
    code -g $2:$1
} 
on(){
    for file in "$@"; do
        open $file -a "Notes"
    done
} 
oi(){
    open ${peter_dir}/index -a "Visual Studio Code"
}
alias op='open' #open with default app
rj(){
    javac $1 &&  java $1
} #run java
rjt(){
    javac ${peter_dir}/tmp/Test.java && java ${peter_dir}/tmp/Test.java
} #rj + test
alias rp='/usr/local/bin/python3' #run python
alias rpt='/usr/local/bin/python3 ${peter_dir}/tmp/test.py' #rp + test
alias rm='rm -r'
rme(){
    exclude=
    for i in "$@"; do 
        exclude="$exclude$i|"
    done
    exclude=$(echo ${exclude# } | sed 's/.$//')
    rm -- !($exclude)
}
sd() { 
if [ $# -eq 0 ] ; then
    cd . && la
elif [[ -f $1 ]]; then
    vim $1 -u ${peter_dir}/.vimrc
else 
    cd $1 && la
fi 
}
alias sdb='sd ${peter_dir}/.bash_profile'
sdd() {
    mkdir -p $1
    sd $1
} 
sdf() {
    for file in "$@"; do
        touch $file
        sd $file
    done
} 
alias sdg='sd ${peter_dir}/git'
alias sdh='sd ${host_dir}'
alias sdi='sd ${peter_dir}/index'
alias sdp='sd ${peter_dir}'    
alias sdr='sd ${peter_dir}/res'
alias sdri='sd ${peter_dir}/res/issues'
alias sdt='sd ${peter_dir}/tmp'
alias sdu='sd ..'    
alias sdv='sd ${peter_dir}/.vimrc'
alias py='python'
tl() { if [ $# -eq 2 ] ; then tail -n $1 $2; printf "\n"; else tail $1 ; printf "\n"; fi }  #tail $file | tail $file $limit
