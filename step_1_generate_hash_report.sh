hash_file() {
  dd if="$1" bs=1024 count=16 2>/dev/null | sha224sum | cut -f1 -d" " | xargs printf "%s\t$1\n"
}
export -f hash_file
find $1 -type f -print0 | xargs -0 -L1 -P8 -I'^' bash -c 'hash_file "^"'
