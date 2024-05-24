alias goto_projects='cd ~/projects'
alias lsa='ls -lha'
backup_dir() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: backup_dir directory"
        return 1
    fi
    tar -czvf "${1%/}_backup_$(date +'%Y%m%d').tar.gz" "$1"
}
search_replace() {
    if [ "$#" -ne 3 ]; then
        echo "Usage: search_replace search_string replace_string directory"
        return 1
    fi
    grep -rl "$1" "$3" | xargs sed -i "s/$1/$2/g"
}
