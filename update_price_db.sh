#!/usr/bin/env bash

rm -f eurofxref-hist.zip
wget https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip
unzip -p ./eurofxref-hist.zip | jq -R '. | split(",")' | jq --slurp '[. | {h: .[0], v: .[1:][]} | [.h, .v] | [transpose[] | {key: .[0], value: .[1]}] | from_entries] | [.[] | .Date as $date | [to_entries[] | ["P", $date, "EUR", .value, .key] | join(" ")]] | .[][]' -r | grep -v "N\/A" | grep -v "Date" | grep -v "EUR *$" > price.db
rm -f eurofxref-hist.zip
rm -f price.db.tar.xz
rm -f price.db.tar.gz
tar -cJf price.db.tar.xz price.db
tar -zcvf price.db.tar.gz price.db

cat price.db | grep -v "P 19" | grep -v "P 20\(00\|01\|02\|03\|04\|05\|06\|07\|08\|09\)" > price.2010.db
rm -f price.2010.db.tar.xz
rm -f price.2010.db.tar.gz
tar -cJf price.2010.db.tar.xz price.2010.db
tar -zcvf price.2010.db.tar.gz price.2010.db

cat price.db | grep -v "P 19" | grep -v "P 20\(00\|01\|02\|03\|04\|05\|06\|07\|08\|09\|10\|11\|12\|13\|14\)" > price.2015.db
rm -f price.2015.db.tar.xz
rm -f price.2015.db.tar.gz
tar -cJf price.2015.db.tar.xz price.2015.db
tar -zcvf price.2015.db.tar.gz price.2015.db
