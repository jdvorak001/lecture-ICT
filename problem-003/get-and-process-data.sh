#!/bin/sh

# dataset from http://data.europa.eu/euodp/en/data/dataset/cordisH2020projects, the "H2020 Organizations" in CSV format
wget --no-verbose --timestamping --directory-prefix=data/ http://cordis.europa.eu/data/cordis-h2020organizations.csv

# stage 1
cat data/cordis-h2020organizations.csv | \
sed 1d | \
cut -f2,6,11 -d';' | \
sort > data/px1.txt

# stage 2
join -t';' data/px1.txt data/px1.txt | \
cut -f2-5 -d';' | \
sort | \
uniq -c | \
sort -n -r | \
sed -e 's/^ *\([0-9]*\) */\1;/' > data/c1.txt

