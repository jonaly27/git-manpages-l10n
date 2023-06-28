#!/bin/bash

echo -n "[po4a_langs]" >po4a.conf
langs=$(for l in po/documentation.*.po
do
    rstripped=${l%%.po}
    echo -n " ${rstripped##po/documentation.}"
done)
echo $langs >> po4a.conf

cat <<EOF >>po4a.conf
[po4a_paths] po/documentation.pot \$lang:po/documentation.\$lang.po
[options] opt: " -k 80"

EOF

for f in $(cat sources.txt)
do
    echo -n "[type: el
