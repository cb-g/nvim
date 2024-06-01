#!/bin/zsh

# array of LaTeX-related file extensions to delete
# extensions=("aux" "log" "out" "toc" "lof" "lot" "fls" "fdb_latexmk" "synctex.gz" "nav" "snm" "bbl" "blg")
extensions=("aux" "log" "out" "fls" "fdb_latexmk" "synctex.gz")

# loop through each extension and delete the matching files
for ext in "${extensions[@]}"; do
    rm -f *."$ext"
done
