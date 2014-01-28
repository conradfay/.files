#/bin/bash

# Simple uppercase to lowercase file renamer

for x in $(ls)
do
    if [ ! -f x ]
    then
        lc=$(echo $x | tr '[A-Z\ ]' '[a-z\-]')
        if [ $lc != $x ]
        then
            mv -i $x $lc
        fi
    fi
done

