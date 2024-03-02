source ../sh/common.sh

mkdir -p "${HOME}/.cgdb"
link_file "${PWD}/cgdbrc" "${HOME}/.cgdb/cgdbrc" || LOGWARNING "Can't link cgdbrc"
