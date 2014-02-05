#!/bin/bash
declare -A arr
shopt -s globstar

COUNT=0

for file in **; do
  [[ -f "$file" ]] || continue

  read cksm _ < <(md5sum "$file")
  if ((arr[$cksm]++)); then 
    COUNT=`expr $COUNT + 1`
    echo "rm $file"
#    rm "$file"
    echo "$file" >> files_to_delete.txt
  fi
done

echo -e "\nFiles to be deleted: $COUNT" >> files_to_delete.txt
