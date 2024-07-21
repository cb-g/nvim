#!/bin/zsh

# array of LaTeX-related file extensions to delete
# extensions=("aux" "log" "out" "toc" "lof" "lot" "fls" "fdb_latexmk" "synctex.gz" "nav" "snm" "bbl" "blg" "xdv")
extensions=("aux" "log" "out" "toc" "fls" "fdb_latexmk" "synctex.gz" "bbl" "blg" "xdv")

# loop through each extension and delete the matching files
for ext in "${extensions[@]}"; do
    rm -f *."$ext"
done
