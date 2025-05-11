# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func () {
    local x2 the_new_dir adir index
    local -i cnt

    if [[ $1 ==  "--" ]]; then
        dirs -v
        return 0
    fi

    the_new_dir=$1
    [[ -z $1 ]] && the_new_dir=$HOME

    if [[ ${the_new_dir:0:1} == '-' ]]; then
        #
        # Extract dir N from dirs
        index=${the_new_dir:1}
        [[ -z $index ]] && index=1
        adir=$(dirs +$index)
        [[ -z $adir ]] && return 1
        the_new_dir=$adir
    fi

    #
    # '~' has to be substituted by ${HOME}
    [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

    #
    # Now change to the new dir and add to the top of the stack
    pushd "${the_new_dir}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    the_new_dir=$(pwd)

    #
    # Trim down everything beyond 11th entry
    popd -n +11 2>/dev/null 1>/dev/null

    #
    # Remove any other occurence of this dir, skipping the top of the stack
    for ((cnt=1; cnt <= 10; cnt++)); do
        x2=$(dirs +${cnt} 2>/dev/null)
        [[ $? -ne 0 ]] && return 0
        [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
        if [[ "${x2}" == "${the_new_dir}" ]]; then
            popd -n +$cnt 2>/dev/null 1>/dev/null
            cnt=cnt-1
        fi
    done

    return 0
}

alias cd=cd_func


# This function finds current git branch name without calling any external command.
find_git_branch () {
    local xroot="$PWD"

    while [ ! -e "${xroot}/.git" ]; do
        local updir="${xroot%/*}"
        if [[ "$updir" == "$xroot" ]]; then
            break
        fi
        xroot="$updir"
    done

    local xgit_dir="$xroot/.git"
    local worktree_tag
    local fline
    local c_green=$'\001\e[32m\002'
    local c_yellow=$'\001\e[33m\002'
    local c_reset=$'\001\e[0m\002'

    if [ -f "$xgit_dir" ]; then
        # if .git is a file it can be a worktree
        read fline < "$xgit_dir"
        xgit_dir="${fline#gitdir: }"
        worktree_tag=" (worktree)"
    fi
    if [ -f "$xgit_dir/HEAD" ]; then
        read fline < "$xgit_dir/HEAD"
        if [[ "$fline" == "ref:"* ]]; then
            _git_branch=" [${c_green}${fline#*/*/}${c_reset}${worktree_tag}]"
        else
            _git_branch=" [${c_yellow}${fline:0:7}${c_reset}${worktree_tag}]"
        fi
    else
        _git_branch=""
    fi
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
