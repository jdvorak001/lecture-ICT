#!/bin/sh

# dataset from http://data.europa.eu/euodp/en/data/dataset/cordisH2020projects, the "H2020 Organizations" in CSV format
wget --no-verbose --timestamping --directory-prefix=data/ http://cordis.europa.eu/data/cordis-h2020organizations.csv

# ???
iconv -f windows-1252 -t UTF-8 <data/cordis-h2020organizations.csv | \
cut -d\; -f2,6,8,11 | \
sed 1d | \
grep ';HES;CZ' | \
sort >data/p.txt

# ???
cut -d\; -f2- <data/p.txt | \
sort | \
uniq -c | \
sed 's/^ *\([0-9]*\) */\1;/' | \
sort -k2 -t\; >data/c1.txt

# ???
join -t\; data/p.txt data/p.txt | \
cut -d\; -f2,5 | \
sort | \
uniq -c | \
sed 's/^ *\([0-9]*\) */\1;/' | \
egrep -v ';([^;]*);\1' | \
sort -n -r -t\; >data/c2.txt