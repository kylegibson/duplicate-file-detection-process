full_hash() {
  dd if="$1" bs=1M 2>/dev/null | sha224sum | cut -f1 -d" " | tr "\n" "\0" | xargs -0 printf "%s\t$1\n"
}
export -f full_hash
cut -c 58- $1 | tr "\n" "\0" | xargs -0 -I'^' bash -c 'full_hash "^"'
