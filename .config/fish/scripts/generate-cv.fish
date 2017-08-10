#!/usr/bin/fish
pandoc -S cv.html -o cv.pdf -V geometry:"top=0.5cm, bottom=0.5cm, left=0.5cm, right=0.5cm" --smart --standalone --normalize --self-contained
