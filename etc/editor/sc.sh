blue="[0;34m" ; green="[0;32m" ; yellow="[0;33m" ; red="[0;31m" ; white="[0m"
project_path="/Users/peter/git/$project" 
delete_project (){
line_start=$(grep -nw -m1 "#@$1" $0 | sed 's/:.*//' )
line_end=$((line_start+3))
sed -i -e "$line_start,$line_end d" $0
rm -rf $project_path
}

#docs
if [ $# -eq 0 ]; then
echo -en """
${blue}create branch${white}
sc <project_id> cb <branch_name>
${blue}create project${white}
sc <project_id> cp <project_url>
${blue}change remote${white}
sc <project_id> cr <branch_name>
${blue}delete project${white}
sc <project_id> dp
${blue}git command${white}
sc <project_id> gc <command>
${blue}list local${white}
sc <project_id> ll
${blue}list projects${white}
sc lp <project_name_pattern="*">
${blue}list remote${white}
sc <project_id> lr
${blue}push branch${white}
sc <project_id> pb <commit_message=""> <branch="HEAD">
${blue}revert commit${white}
sc <project_id> rc
${blue}revert index${white}
sc <project_id> ri
${blue}revert untracked${white}
sc <project_id> ru
${blue}show branch / swith branch${white}
sc <project_id> sb / sc <project_id> sb <branch_name>
${blue}update branch${white}
sc <project_id> ub

"""
fi

#create project
if [[ $2 == 'cp' ]]; then
new_project=$(echo "$(basename $3)" | cut -f 1 -d '.')
alias=$1

while true; do
    if [[ -n $(grep -w "#@$alias" $0) ]]; then
    echo -en "${red}alias already exists\n${white}"
    read -p "Do wish to replace $alias -> $project ?: y/n 
" replace

    if [[ $replace == 'y' ]];then
        delete_project "$alias" && echo -en "${green}deleted $alias -> $project\n${white}"
        break
    elif [[ $replace == 'n' ]];then
        read -p "Enter alternative 2 char alias for $project
" alias
    fi
    else
        break
    fi
done


tmp="
#@$alias -> #@$new_project
\nif [[ \$1 == '$alias' ]] && [ \$# -eq 1 ]; then echo '$new_project'; elif [[ \$1 == '$alias' ]]; then project='$new_project'; fi 
\nif [[ \$1 == '$new_project' ]]; then echo '$alias'; fi \n\n"

echo -en $tmp | cat - $0 > temp && mv temp $0 && chmod -R 777 $0 

# git -C /Users/peter/editor/git/ clone $3

echo -en "${green}added $alias -> $new_project\n${white}"
fi

#delete project
if [[ $2 == 'dp' ]]; then
    delete_project "$1" && echo -en "${green}deleted $alias -> $project\n${white}"
fi

#list projects
if [[ $1 == 'lp' ]]; then
    if [ $# -eq 1 ]; then
        grep -P "#@\w{2}\s" $0 | tr -d '#@' | column -t 
    elif [ $# -eq 2 ]; then
        grep -P "#@.*$2.*" $0 | tr -d '#@' | column -t 
    fi
fi

#git command
if [[ $2 == 'gc' ]]; then
    git -C $project_path $3
fi

#create branch
if [[ $2 == 'cb' ]]; then
    git -C $project_path checkout -t origin/$3
fi

#show/swith branch
if [[ $2 == 'sb' ]]; then
    if [[ -z $4 ]]; then
        git -C $project_path status
    else
        git -C $project_path checkout $3
    fi
fi

#update branch
if [[ $2 == 'ub' ]]; then
    git -C $project_path pull origin HEAD
fi

#push branch
if [[ $2 == 'pb' ]]; then
    git -C $project_path add -A && git -C $project_path commit -am "$3"
    if [[ -z "$4" ]]; then
        git -C $project_path pull origin $4 && git -C $project_path push origin HEAD:$4
    else
        git -C $project_path pull origin HEAD && git -C $project_path push origin HEAD
    fi
fi

#list local
if [[ $2 == 'll' ]]; then
    git -C $project_path branch -vv
fi

#list remote
if [[ $2 == 'lr' ]]; then
    git -C $project_path branch -r
fi

#change remote
if [[ $2 == 'cr' ]]; then
    git -C $project_path branch HEAD -u origin/$3
fi

#revert commit
if [[ $2 == 'rc' ]]; then
    git -C $project_path reset --hard HEAD~1
fi

#revert index
if [[ $2 == 'ri' ]]; then
    git -C $project_path checkout -- .
fi

#revert untracked
if [[ $2 == 'ru' ]]; then
    git -C $project_path clean -fd
fi
