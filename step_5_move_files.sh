export DUPE_DEST=$1
DUPE_INPUT=$2

move_to_other_folder () {
    new_path="$DUPE_DEST/$(dirname "$1")"
    mkdir --parents "$new_path"
    mv "$1" "$new_path"
}

export -f move_to_other_folder
cut -c 58- $DUPE_INPUT | xargs --no-run-if-empty -L1 -I'^' bash -c 'move_to_other_folder "^"'
